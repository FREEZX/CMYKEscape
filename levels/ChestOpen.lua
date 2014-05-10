content = {}
function game.load()
    content.chestopen = love.graphics.newImage("res/levels/chest_open.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="bin", pos={0.75 * love.graphics.getWidth(), 0.6 * love.graphics.getHeight()}, size={ 0.14 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        game.switchLevelFade("Bin")
    end
end
function game.draw()
    love.graphics.draw(content.chestopen, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
