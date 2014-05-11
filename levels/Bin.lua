content = {}
function game.load()
    content.bed = love.graphics.newImage("res/levels/bin.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="shapea", pos={0.43 * love.graphics.getWidth(), 0.23 * love.graphics.getHeight()}, size={ 0.16 *love.graphics.getWidth(), 0.34 * love.graphics.getHeight()}} then
    	inventory.addItem("shapeA")
        messageManager.setMessage("Took the weird shaped object.")
        game.state.shapeaPicked = true
    	game.switchLevelFade("ClosetBin")
    end
end
function game.draw()
    love.graphics.draw(content.bed, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
