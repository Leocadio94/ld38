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
    self.g = anim8.newGrid(40, 80, playerAnimation:getWidth(), playerAnimation:getHeight())
	self.animations = {
        idle = anim8.newAnimation(self.g('1-3', 1), 0.1),
        runningRight = anim8.newAnimation(self.g('1-3', 2), 0.1),
        runningLeft = anim8.newAnimation(self.g('1-3', 2), 0.1):flipH(),
    }
    self.animation = self.animations.idle
end

function Player:update(dt)
    if input.right then
        self.animation = self.animations.runningRight
    elseif input.left then
        self.animation = self.animations.runningLeft
    else
        self.animation = self.animations.idle
    end

    self.animation:update(dt)
end

function Player:draw()
    self.animation:draw(playerAnimation, self.x, self.y, self.r, 1, 1, self.ox, self.oy)
end

return Player
