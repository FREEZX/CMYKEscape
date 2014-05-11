content = {}
function game.load()
    content.endimage = love.graphics.newImage("res/levels/end.png")
    content.loadTime = love.timer.getTime()
    content.duration = 20
    content.messageSeq = 0
end
function game.update()
    if not messageManager.messageShown then
        if content.messageSeq == 0 then
            messageManager.setMessage("All colors are the friends of their neighbors and the lovers of their opposites.", 6)
        elseif content.messageSeq == 1 then
            messageManager.setMessage("Made by Kristijan Trajkovski.", 4)
        elseif content.messageSeq == 2 then
            messageManager.setMessage("THE END", 4)
        end
        content.messageSeq = content.messageSeq + 1
    end

    if love.timer.getTime() > content.loadTime + content.duration then
        love.event.push("quit")
    end
end
function game.draw()
    love.graphics.draw(content.endimage, game.shared.xOffset, game.shared.yOffset, 0,
        game.shared.scale,
        game.shared.scale)
end
