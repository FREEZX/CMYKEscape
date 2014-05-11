game = {}
game.shared = {}
game.shared.content = {}
game.state = {}
game.availableLevels = {}
game.currentLevel = nil

function love.load()
    love.filesystem.load("helpers/Math.lua")()
    love.filesystem.load("helpers/Tables.lua")()
    love.filesystem.load("helpers/Mouse.lua")()
    love.filesystem.load("lib/base/Framework.lua")()
    love.filesystem.load("lib/sounds/SoundManager.lua")()
    love.filesystem.load("lib/fx/FxManager.lua")()
    love.filesystem.load("classes/CircularBuffer.lua")()
    love.filesystem.load("classes/MessageManager.lua")()
    love.filesystem.load("classes/Inventory.lua")()
    love.filesystem.load("classes/InventoryItem.lua")()
    love.filesystem.load("res/values/storyboard-en.lua")()
    love.filesystem.load("res/values/items.lua")()
    gui = require "lib/Quickie"

    inventory.inventoryFont = love.graphics.newFont("res/fonts/redoctober.ttf", 12)

    local files = love.filesystem.getDirectoryItems("levels")
    for _,v in ipairs(files) do
        print(v);
        game.availableLevels[v] = "levels/" .. v
    end

    game.shared.mouse = love.graphics.newImage("res/sprites/mouse.png");

    game.screenModes = love.window.getFullscreenModes()

    table.sort(game.screenModes, function(a, b) return a.width*a.height < b.width*b.height end)
    love.window.setMode(game.screenModes[#game.screenModes].width, game.screenModes[#game.screenModes].height, {fullscreen=true})

    ----------------------------------------------
    --                                          --
    --   AUDIO INIT                             --
    --                                          --
    ----------------------------------------------
    soundManager.setAmbient("res/audio/ambient.ogg");
    soundManager.playAmbient();
    soundManager.setAmbientVolume(0.1);

    game.shared.width = 1920
    game.shared.height = 1080

    game.state.pickedIcos = 0

    game.shared.scale = math.min(love.graphics.getWidth() / game.shared.width, 
        love.graphics.getHeight() / game.shared.height);

    game.shared.yOffset = math.abs(game.shared.scale * game.shared.height - love.graphics.getHeight()) / 2;
    game.shared.xOffset = math.abs(game.shared.scale * game.shared.width - love.graphics.getWidth()) / 2;

    game.shared.leftButtonPos = {0.0 * game.shared.width, 80};
    game.shared.rightButtonPos = {0.9 * game.shared.width, 80};
    game.shared.sideButtonSize = {0.1 * game.shared.width, game.shared.height}

    fxManager.loadFx("vignette")

    game.switchLevel("Bed")
end
function love.keypressed(key)
   if key == "escape" then
      love.event.push("quit")
   end
end
function love.update(dt)
    game.update(dt)
    fxManager.update(dt)
    messageManager.update(dt)
    inventory.update(dt)
    fadeUpdate(dt)
    
end
function fadeUpdate(dt)
    if game.fadingIn then
        game.alpha = game.alpha + dt * game.fadeSpeed
        if game.alpha > 255 then
            game.alpha = 255
            game.fadingIn = false
        end
    end
    if game.fadingOut then
        game.alpha = game.alpha - dt * game.fadeSpeed
        if game.alpha < 0 then
            game.alpha = 0
            game.fadingOut = false
            game.fadingIn = true
            if game.middleFunction then
                game.middleFunction()
            end
            game.loadLevel(game.levelPath)
        end
    end
end
function love.draw()
    game.draw()
    fxManager.draw()
    inventory.draw()
    if game.alpha == 255 then
        gui.core.draw()
    end
    love.graphics.setColor(0, 0, 0, 255-game.alpha)
    love.graphics.rectangle("fill", 0, 0, game.shared.width, game.shared.height)
    love.graphics.setColor(255, 255, 255, 255)
    messageManager.draw()
end
