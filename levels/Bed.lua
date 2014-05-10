content = {}
function game.load()
    content.bed = love.graphics.newImage("res/levels/bed.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="bedside-drawers", pos={0.75 * love.graphics.getWidth(), 0.43 * love.graphics.getHeight()}, size={ 0.14 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        if game.state.hallDoorOpened then
            game.switchLevelFade("Steam")
        else
            messageManager.setMessage(game.storyboard.genericLocked)
        end
    end
end
function game.draw()
    love.graphics.draw(content.bed, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
