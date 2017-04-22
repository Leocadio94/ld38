local Player = Object:extend()

function Player:new(x, y)
    self.sprite = playerSprite
    self.x = x
    self.y = y
	self.width  = playerSprite:getWidth()
	self.height = playerSprite:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
	self.collidable = true
	self.xVelocity = 0
	self.yVelocity = 0
	self.acc = 100
	self.maxSpeed = 600
	self.friction = 20
	self.gravity = 80
	self.isJumping = false
	self.isGrounded = false
	self.hasReachedMax = false
	self.jumpAcc = 500
	self.jumpMaxSpeed = 11
    self.filter = function(item, other)
        local x, y, w, h = world:getRect(other)
        local px, py, pw, ph = world:getRect(item)
        local playerBottom = py + ph
        local otherBottom = y + h
        if playerBottom <= y then -- bottom of player collides with top of platform.
  		return 'slide'
  	  end
  	end
end

function Player:update(dt)
    local prevX, prevY = self.x, self.y

    -- Friction
    self.xVelocity = self.xVelocity * (1 - math.min(dt*self.friction, 1))
    self.yVelocity = self.yVelocity * (1 - math.min(dt*self.friction, 1))

    -- Gravity
    

    -- 96 pixels per second
    -- local speed = 96
    -- local actualX, actualY, cols, len = world:move(self, self.x, self.y, self.filter)
    --
    -- for i=1,len do
    --     print('collided with ' .. tostring(cols[i].other.name).. ' in coordinates: X='.. tostring(cols[i].touch.x) .. " Y="..tostring(cols[i].touch.y))
    --     print(cols[i].type)
    -- end
    --
    -- -- Move player up
    -- if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    --     self.y = self.y - speed * dt
    -- end
    --
    -- -- Move player down
    -- if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    --     if len == 0 then
    --         self.y = self.y + speed * dt
    --     end
    -- end
    --
    -- -- Move player left
    -- if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
    --     self.x = self.x - speed * dt
    -- end
    --
    -- -- Move player right
    -- if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    --     self.x = self.x + speed * dt
    -- end
end

function Player:draw()
    love.graphics.draw(
        self.sprite,
        math.floor(self.x),
        math.floor(self.y)
    )
end

return Player
