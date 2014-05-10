
----------------------------------------------
--                                          --
--   GAME FRAMEWORK FUNCTIONS               --
--                                          --
----------------------------------------------


game.levelData = {}
game.global = {}

game.alpha = 0
game.levelChanging = false
game.fadingIn = true
game.fadingOut = false
game.levelPath = ""
game.fadeSpeed = 500

function game.switchLevel(levelName, switchFunction)
    local fileName = levelName .. ".lua"
    local filePath = game.availableLevels[fileName]
    game.fadingIn = true
    if filePath ~= nil then
        game.clearCallbacks()
        love.filesystem.load(filePath)()
        game.load()
    end
    game.middleFunction = switchFunction
end

function game.switchLevelFade(levelName, switchFunction)
    local fileName = levelName .. ".lua"
    local filePath = game.availableLevels[fileName]
    game.fadingOut = true
    game.levelPath = filePath
    game.middleFunction = switchFunction
end

function game.loadLevel(levelPath)
    if levelPath ~= nil then
        game.clearCallbacks()
        love.filesystem.load(levelPath)()
        game.load()
    end
end

function game.clearCallbacks()
    game.load = game.empty
    game.update = game.empty
    game.draw = game.empty
    game.keypressed = game.empty
    game.keyreleased = game.empty
    game.mousepressed = game.empty
    game.mousereleased = game.empty
end

function game.drawMenu()

end
