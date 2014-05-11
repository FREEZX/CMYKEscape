messageManager = {
    timeSet = 0,
    duration = 0,
    text = "",
    messageAlpha = 0,
    messageShown = false,
    messageFont,
    defaultDuration = 2,
    fadeSpeed = 200,
    boxColor = {0, 0, 0},
    textColor = {255, 255, 255},
}

messageManager.messageFont = love.graphics.newFont("res/fonts/stampete.ttf", 16);

function messageManager.setMessage(text, duration)
    if type(text) == "table" then
        local currText = table.remove(text)
        table.insert(text, 1, currText)
        text = currText
    end
    duration = duration or messageManager.defaultDuration

    messageManager.timeSet = love.timer.getTime()
    messageManager.text = text
    messageManager.duration = duration
    messageManager.messageAlpha = 255
    messageManager.update(.01)
    messageManager.messageShown = true
end

function messageManager.update(dt)
    if love.timer.getTime() > messageManager.timeSet + messageManager.duration and messageManager.messageAlpha > 0 then
        messageManager.messageAlpha = messageManager.messageAlpha - dt * messageManager.fadeSpeed
        if messageManager.messageAlpha <= 0 then
            messageManager.messageShown = false
        end
    end
end

function messageManager.draw()
    if messageManager.messageAlpha > 0 then
        local savedFont = love.graphics.getFont()
        love.graphics.setFont(messageManager.messageFont)

        local savedColor = {love.graphics.getColor()}
        love.graphics.setColor(messageManager.boxColor[1], messageManager.boxColor[2], messageManager.boxColor[3], messageManager.messageAlpha)
        love.graphics.rectangle("fill", 0, 0.8 * love.graphics.getHeight(), love.graphics.getWidth(), 30 )
        love.graphics.setColor(messageManager.textColor[1], messageManager.textColor[2], messageManager.textColor[3], messageManager.messageAlpha)
        love.graphics.printf(messageManager.text, 0, 0.8 * love.graphics.getHeight() + 6, love.graphics.getWidth(), "center")

        love.graphics.setFont(savedFont)
        love.graphics.setColor(savedColor)
    end
end