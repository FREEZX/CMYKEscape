content = {}
function game.load()
    content.chestpot = love.graphics.newImage("res/levels/chestpot.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("Bed")
    end
    if gui.Button{text="chest", pos={0.5 * love.graphics.getWidth(), 0.45 * love.graphics.getHeight()}, size={ 0.25 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        game.switchLevelFade("Keycode")
    end
end
function game.draw()
    love.graphics.draw(content.chestpot, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
