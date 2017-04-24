local Planet = Object:extend()

function Planet:new(x, y)
    self.sprite = planetSprite
    self.x = x
    self.y = y
	self.width  = planetSprite:getWidth()
	self.height = planetSprite:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.r = 0
    self.acc = 3
end

function Planet:update(dt)
    if input.left then
        self.r = self.r - self.acc * dt
    elseif input.right then
        self.r = self.r + self.acc * dt
    end
end

function Planet:draw()
    love.graphics.draw(self.sprite, self.x, self.y, self.r, 1, 1, self.ox, self.oy)
end

return Planet
