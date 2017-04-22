local World = Object:extend()

function World:new(x, y)
    self.sprite = worldSprite
    self.x = x
    self.y = y
	self.width  = worldSprite:getWidth()
	self.height = worldSprite:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.r = 0
    self.acc = 5
end

function World:update(dt)
    if input.left then
        self.r = self.r - self.acc * dt
    elseif input.right then
        self.r = self.r + self.acc * dt
    end
end

function World:draw()
    love.graphics.draw(self.sprite, self.x, self.y, self.r, 1, 1, self.ox, self.oy)
end

return World
