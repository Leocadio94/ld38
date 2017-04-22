local Player = Object:extend()

function Player:new(x, y)
    self.sprite = playerSprite
    self.x = x
    self.y = y
	self.width  = playerSprite:getWidth()
	self.height = playerSprite:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.r = 0
end

function Player:update(dt)

end

function Player:draw()
    love.graphics.draw(self.sprite, self.x, self.y, self.r, 1, 1, self.ox, self.oy)
end

return Player
