content = {}
function game.load()
    content.chestopen = love.graphics.newImage("res/levels/black_drawer.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="stuff", pos={0.37 * love.graphics.getWidth(), 0.43 * love.graphics.getHeight()}, size={0.19 *love.graphics.getWidth(), 0.25 * love.graphics.getHeight()}} then
        messageManager.setMessage("Picked up the black shadow Icosahedron.")
        inventory.addItem("blackIco")
        game.state.blackIcoDone = true
        game.state.pickedIcos = game.state.pickedIcos + 1
        if game.state.pickedIcos == 4 then
            game.switchLevelFade("End")
            return
        end
        game.switchLevelFade("ClosetBin")
    end 
end
function game.draw()
    love.graphics.draw(content.chestopen, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
