local Gun = Object:extend()

function Gun:new(x, y)
    self.sprite = gunSprite
    self.x = x
    self.y = y
	self.width  = gunSprite:getWidth()
	self.height = gunSprite:getHeight()
    self.sx = 1
    self.sy = 1
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.r = 0
    self.g = anim8.newGrid(20, 20, gunAnimation:getWidth(), gunAnimation:getHeight())
	self.animations = {
        idle = anim8.newAnimation(self.g('1-3', 1), 0.1),
        shoot = anim8.newAnimation(self.g('1-3', 2), 0.1)
    }
    self.animation = self.animations.idle
end

function Gun:update(dt)
    if player.sx == 1 then
        self.x = player.x + player.ox + 5
        self.sx = 1
    elseif player.sx == -1 then
        self.x = player.x - player.ox - 5
        self.sx = -1
    end

    if input.space then
        self.animation = self.animations.shoot
    else
        self.animation = self.animations.idle
    end

    self.animation:update(dt)
end

function Gun:draw()
    self.animation:draw(gunAnimation, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)
end

return Gun
