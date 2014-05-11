content = {}
function game.load()
    content.bed = love.graphics.newImage("res/levels/bed.jpg")
    content.shapeA = love.graphics.newImage("res/levels/bed_shapea.png")
    content.shapeB = love.graphics.newImage("res/levels/bed_shapeb.png")
    content.paint = love.graphics.newImage("res/sprites/paint.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="bedside-drawers", pos={0.75 * love.graphics.getWidth(), 0.43 * love.graphics.getHeight()}, size={ 0.14 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        if game.state.bedDrawersPicked then
            messageManager.setMessage(game.storyboard.nothingThere)
        elseif inventory.isSelected("S shaped object") and not game.state.drawersShapeA then
            game.state.drawersShapeA = true
            inventory.removeItem("S shaped object")
        elseif inventory.isSelected("Weird shaped object") and not game.state.drawersShapeB then
            game.state.drawersShapeB = true
            inventory.removeItem("Weird shaped object")
        elseif game.state.drawersShapeB and game.state.drawersShapeA then
            game.switchLevelFade("BedDrawer")
        else
            messageManager.setMessage("I cannot open it. There are weird shaped holes on the first drawer.")
        end
    end
    if gui.Button{text="paint", pos={0.47 * love.graphics.getWidth(), 0.1 * love.graphics.getHeight()}, size={ 0.2 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        if game.state.paintRemoved then
            messageManager.setMessage(game.storyboard.code)
        elseif inventory.isSelected("Paint Remover") then
            game.state.paintRemoved = true;
            inventory.removeItem("Paint Remover")
        else
            messageManager.setMessage(game.storyboard.paint)
        end
    end
end
function game.draw()
    love.graphics.draw(content.bed, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)

    if not game.state.paintRemoved  then
        love.graphics.draw(content.paint, game.shared.xOffset, game.shared.yOffset, 0,
            game.shared.scale,
            game.shared.scale)
    end

    if game.state.drawersShapeA then
        love.graphics.draw(content.shapeA, game.shared.xOffset, game.shared.yOffset, 0,
            game.shared.scale,
            game.shared.scale)
    end

    if game.state.drawersShapeB then
        love.graphics.draw(content.shapeB, game.shared.xOffset, game.shared.yOffset, 0,
            game.shared.scale,
            game.shared.scale)
    end
end
