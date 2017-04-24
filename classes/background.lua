local Background = Object:extend()

function Background:new()
    self.bg = bg
    self.stars = stars
    self.x1 = 0
    self.x2 = 0
    self.width = stars:getWidth()
    self.height = stars:getHeight()
    self.ox = self.width / 2
    self.oy = self.height / 2
    self.sx1 = 1
    self.sx2 = -1
    self.acc = 20
    self.direction = 1
end

function Background:update(dt)
    if input.left then
        self.direction = 1
        self.acc = 100
    elseif input.right then
        self.direction = -1
        self.acc = 100
    else
        self.acc = 20
    end

    self.x1 = self.x1 + self.acc * self.direction * dt
    self.x2 = self.x2 + self.acc * self.direction * dt

    if self.x1 > gameWidth and self.direction == 1 then
        self.x1 = 0
    elseif self.x1 < 0 and self.direction == -1 then
        self.x1 = gameWidth
    end

    if self.x2 > gameWidth  and self.direction == 1 then
        self.x2 = 0
    elseif self.x2 < 0 and self.direction == -1 then
        self.x2 = gameWidth
    end
end

function Background:draw()
	love.graphics.draw(self.bg, 0, 0)
    love.graphics.draw(self.stars, self.x1 + 50, 0, 0, -1, 1,0,0)
    love.graphics.draw(self.stars, self.x2, 0, 0, 1, 1,0,0)
end

return Background
