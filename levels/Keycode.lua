content = {}

function game.load()
    content.keycode = love.graphics.newImage("res/levels/keycode.png")
    content.beepSound = love.audio.newSource("res/sounds/switchOn.ogg", "static")
    content.codePos = 0
    content.code = CircularBuffer.create(4)
    content.correctCode = table.Reverse({5, 3, 6, 2}); --The code is reverse due to the nature of the buffer
end
function game.update()
    if gui.Button{text="left-leave", pos=game.shared.leftButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    if gui.Button{text="right-leave", pos=game.shared.rightButtonPos, size=game.shared.sideButtonSize} then
        game.switchLevelFade("ChestPot")
    end
    local i, j

    for i=0,2 do
    	for j=0,2 do
			if gui.Button{text=i*3+j, pos={(0.41+j*0.07) * love.graphics.getWidth(), (0.22+i*0.18) * love.graphics.getHeight()}, size={ 0.055 *love.graphics.getWidth(), 0.12 * love.graphics.getHeight()}} then
				love.audio.stop(content.beepSound)
				love.audio.play(content.beepSound)
				content.code:Add(i*3+j+1);
				if table.Compare(content.code.buffer, content.correctCode) then
					game.state.chestUnlocked = true
        			game.switchLevelFade("ChestOpen")
				end
			end
		end
    end
end
function game.draw()
    love.graphics.draw(content.keycode, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
