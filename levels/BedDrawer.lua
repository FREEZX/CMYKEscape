content = {}
function game.load()
    content.bed = love.graphics.newImage("res/levels/bed_drawer_open.jpg")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="shapea", pos={0.43 * love.graphics.getWidth(), 0.4 * love.graphics.getHeight()}, size={ 0.16 *love.graphics.getWidth(), 0.34 * love.graphics.getHeight()}} then
    	inventory.addItem("cyanIco")
    	inventory.addItem("crowbar")
        messageManager.setMessage("Took a glowing cyan Icosahedron and a Crowbar.")
        game.state.pickedIcos = game.state.pickedIcos + 1
        game.state.bedDrawersPicked = true
        if game.state.pickedIcos == 4 then
            game.switchLevelFade("End")
            return
        end
    	game.switchLevelFade("Bed")
    end
end
function game.draw()
    love.graphics.draw(content.bed, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
