content = {}
function game.load()
    content.closetbin = love.graphics.newImage("res/levels/closetbin.png")
    content.lock = love.graphics.newImage("res/levels/closetbin_lock.png")
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("Bed")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="bin", pos={0.7 * love.graphics.getWidth(), 0.63 * love.graphics.getHeight()}, size={ 0.16 *love.graphics.getWidth(), 0.14 * love.graphics.getHeight()}} then
        if not game.state.shapeaPicked then
        	game.switchLevelFade("Bin")
        else
            messageManager.setMessage(game.storyboard.nothingThere)
        end
    end
    if gui.Button{text="closet", pos={0.15 * love.graphics.getWidth(), 80}, size={ 0.3 *love.graphics.getWidth(), .7 * love.graphics.getHeight()}} then
        if(game.state.closetunlocked) and not game.state.closetDone then
        	game.switchLevelFade("Closet")
    	elseif game.state.closetDone then
    		messageManager.setMessage(game.storyboard.nothingThere)
        elseif inventory.isSelected("Closet Key") then
        	game.state.closetunlocked = true
        	inventory.removeItem("Closet Key")
        else
            messageManager.setMessage(game.storyboard.genericLocked)
        end
    end
end
function game.draw()
    love.graphics.draw(content.closetbin, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
    if(not game.state.closetunlocked) then
	    love.graphics.draw(content.lock, game.shared.xOffset, game.shared.yOffset, 0,
	        game.shared.scale,
	        game.shared.scale)
    end
end
