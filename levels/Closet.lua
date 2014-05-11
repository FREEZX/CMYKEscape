content = {}
function game.load()
    content.closet = love.graphics.newImage("res/levels/closet.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ClosetBin")
    end
    if gui.Button{text="pink", pos={0.45 * love.graphics.getWidth(), 0.4 * love.graphics.getHeight()}, size={ 0.15 *love.graphics.getWidth(), 0.2 * love.graphics.getHeight()}} then
        messageManager.setMessage("Picked up a bottle of paint stripper and a glowing magenta Icosahedron")
        inventory.addItem("paintRemover")
        inventory.addItem("magentaIco")
        game.switchLevelFade("ClosetBin")
        game.state.closetDone = true
        game.state.pickedIcos = game.state.pickedIcos + 1
        if game.state.pickedIcos == 4 then
            game.switchLevelFade("End")
            return
        end
    end
end
function game.draw()
    love.graphics.draw(content.closet, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
