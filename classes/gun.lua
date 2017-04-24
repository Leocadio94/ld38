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
        idle = anim8.newAnimation(self.g('1-4', 1), 0.1),
        shoot = anim8.newAnimation(self.g('1-4', 2), 0.1)
    }
    self.animation = self.animations.idle
    self.bullets = {}
	self.canShoot = true
	self.canShootTimerMax = 0.3
	self.canShootTimer = self.canShootTimerMax
end

function Gun:update(dt)
    if player.sx == 1 then
        self.x = player.x + player.ox + 5
        self.sx = 1
    elseif player.sx == -1 then
        self.x = player.x - player.ox - 5
        self.sx = -1
    end

    self.canShootTimer = self.canShootTimer - (1 * dt)
	if self.canShootTimer < 0 then
		self.canShoot = true
	end

	if input.space then
        self.animation = self.animations.shoot

        if self.canShoot then
    		self:shoot()
            self.canShoot = false
            self.canShootTimer = self.canShootTimerMax
        end
	else
        self.animation = self.animations.idle
    end

    for v,bul in ipairs(self.bullets) do
        bul:update(dt)
        if bul:destroy() then
            table.remove(self.bullets, v)
        end
    end

    self.animation:update(dt)
end

function Gun:draw()
    self.animation:draw(gunAnimation, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)

    for v,bul in ipairs(self.bullets) do
        bul:draw()
    end
end


function Gun:shoot ()
    self.animation = self.animations.shoot
    bullet = require "classes/bullet" (self.x, self.y, self.sx)
    table.insert(self.bullets, bullet)
end
return Gun
