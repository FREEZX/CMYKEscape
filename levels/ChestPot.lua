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
        if game.state.chestUnlocked then
            game.switchLevelFade("ChestOpen")
        else
            game.switchLevelFade("Keycode")
        end
    end
    if gui.Button{text="pot", pos={0.15 * love.graphics.getWidth(), 0.45 * love.graphics.getHeight()}, size={ 0.13 *love.graphics.getWidth(), 0.17 * love.graphics.getHeight()}} then
        if game.state.potKeyPicked then
            messageManager.setMessage(game.storyboard.nothingThere)
        else
            inventory.addItem("closetKey")
            game.state.potKeyPicked = true
        end
    end
end
function game.draw()
    love.graphics.draw(content.chestpot, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
