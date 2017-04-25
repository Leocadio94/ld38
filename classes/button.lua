local Button = Object:extend()

function Button:new(x, y, width, height, text)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.text = text
end

function Button:draw()
	local btn_left = self.x
	local btn_right = self.x + self.width
	local btn_top = self.y
	local btn_bottom = self.y + self.height
	local xGame, yGame = push:toGame(love.mouse.getX(), love.mouse.getY())

	if self:mouseAboveButton(xGame, yGame, btn_left, btn_right, btn_top, btn_bottom) then
		love.graphics.setColor(0,0,0,255)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 50, 50)
	else
		love.graphics.setColor(0,0,0,50)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 50, 50)
	end

	love.graphics.setColor(255, 255, 255, 255)

	local textX = self.x + (self.width / 2)
	local textY = self.y + (self.height / 4)

	love.graphics.print(self.text, textX, textY, 0, 1, 1, fontBig:getWidth(self.text)/2, 0)
end

function Button:click()
	local btn_left = self.x
	local btn_right = self.x + self.width
	local btn_top = self.y
	local btn_bottom = self.y + self.height
	local xGame, yGame = push:toGame(love.mouse.getX(), love.mouse.getY())

	if love.mouse.isDown(1) then
		if self:mouseAboveButton(xGame, yGame, btn_left, btn_right, btn_top, btn_bottom) then
			if self.text == playText or self.text == resumeText then
				Gamestate.switch(gameLevel1)
			elseif self.text == backText then
				Gamestate.push(mainMenu)
			elseif self.text == gameOverSubTitle then
				Gamestate.push(mainMenu)
			elseif self.text == exitText then
				love.event.quit()
			end
		end
	end
end

function Button:mouseAboveButton(x, y, left, right, top, bottom)
    if x ~= nil and y ~= nil then
        if x > left and
            x < right and
            y > top and
            y < bottom then
            return true
        else
            return false
        end
    end
end

return Button
