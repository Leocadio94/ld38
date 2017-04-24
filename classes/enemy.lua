local Enemy = Object:extend()

function Enemy:new(x, y, direction)
    self.sprite = enemySprite
    self.x = x
    self.y = y
	self.width  = enemySprite:getWidth()
	self.height = enemySprite:getHeight()
    self.sx = 1
    self.sy = 1
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.r = 0
    self.g = anim8.newGrid(80, 80, enemyAnimation:getWidth(), enemyAnimation:getHeight())
	self.animation = anim8.newAnimation(self.g('1-3', 1), 0.3)
	self.speed = 50
    self.direction = direction

    --bornSound:play()
end

function Enemy:update(dt)
    if self.direction == 1 then
        self.sx = 1
        self.x = self.x + self.speed * dt

        if input.right then
            self.x = self.x - 2
        elseif input.left then
            self.x = self.x + 2
        end
    elseif self.direction == -1 then
        self.sx = -1
        self.x = self.x - self.speed *dt

        if input.right then
            self.x = self.x - 2
        elseif input.left then
            self.x = self.x + 2
        end
    end

    self.animation:update(dt)
end

function Enemy:checkCollision(other)
    local enemy_left = self.x
    local enemy_right = self.x + self.width

    local other_left = other.x
    local other_right = other.x + other.width

    if enemy_right > other_left and
    enemy_left < other_right then
        --if enableSounds then explosionSound:play() end
        --screen:setShake(10)
        --screen:setRotation(.2)
        --screen:zoom(1.05)
        return true
    else
        return false
    end
end

function Enemy:draw()
    self.animation:draw(enemyAnimation, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)
end

return Enemy
