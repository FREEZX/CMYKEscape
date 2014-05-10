local vignette = {}
function vignette.load(self)
    self.alpha = 200
    self.minAlpha = 100
    self.maxAlpha = 200
    self:updateDestAlpha()

    self.image = love.graphics.newImage("res/fx/vignette.png")

    self.scale = math.min(love.graphics.getWidth() / self.image:getWidth(), 
        love.graphics.getHeight() / self.image:getHeight());

    self.yOffset = game.shared.yOffset
end
function vignette.update(self, dt)
    self.alpha = lerp(self.alpha, self.destAlpha, 3 * dt)
    if math.abs(self.alpha - self.destAlpha) < 20 then
        self:updateDestAlpha()
    end
end
function vignette.updateDestAlpha(self)
    self.destAlpha = math.random(self.minAlpha, self.maxAlpha)
end
function vignette.draw(self)
    local colorBak = {love.graphics.getColor()}
    love.graphics.setColor(255, 255, 255, self.alpha)
    love.graphics.draw(self.image, 0, self.yOffset, 0, self.scale, self.scale)
    love.graphics.setColor(colorBak)
end

fxManager.fx["vignette"] = vignette
