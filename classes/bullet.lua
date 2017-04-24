local Bullet = Object:extend()

function Bullet:new(x, y, direction)
    self.sprite = bulletSprite
    self.x = x
    self.y = y
	self.width  = bulletSprite:getWidth()
	self.height = bulletSprite:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.direction = direction
	self.speed = 800
end

function Bullet:update(dt)
    if self.direction == 1 then
        self.x = self.x + self.speed*dt
    elseif self.direction == -1 then
        self.x = self.x - self.speed*dt
    end
end

function Bullet:draw()
    love.graphics.draw(self.sprite, self.x, self.y, 0, -1, 1, self.ox, self.oy)
end

function Bullet:destroy()
	if self.x < 0-self.width then return true end
	if self.x > gameWidth then return true end

	if self.y < 0-self.height then return true end
	if self.y > gameHeight then return true end

    return false
end

return Bullet
