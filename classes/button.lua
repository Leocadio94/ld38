Button = Object:extend()

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
	local textY = self.y
	
	love.graphics.print(self.text, textX, textY, 0, 1, 1, font:getWidth(self.text)/2, 0)
end

function Button:click()
	local btn_left = self.x
	local btn_right = self.x + self.width
	local btn_top = self.y
	local btn_bottom = self.y + self.height
	local xGame, yGame = push:toGame(love.mouse.getX(), love.mouse.getY())
	
	if self:mouseAboveButton(xGame, yGame, btn_left, btn_right, btn_top, btn_bottom) then		
		if self.text == playText then
			if enableSounds then selectSound:play() end
			reset()
			gameMode = "Play"
			if enableSounds then bornSound:play() end
		elseif self.text == optionsText then
			gameMode = "Options"
			if enableSounds then selectSound:play() end
		elseif self.text == fullscreenText then
			push:switchFullscreen()
			if enableSounds then selectSound:play() end
		elseif self.text == musicText then
			enableMusic = not enableMusic
			if enableSounds then selectSound:play() end
		elseif self.text == soundsText then
			enableSounds = not enableSounds
			if enableSounds then selectSound:play() end
		elseif self.text == exitText then
			love.event.quit()
			if enableSounds then selectSound:play() end
		elseif self.text == resumeText then
			gameMode = "Play"
			if enableSounds then selectSound:play() end
		elseif self.text == goBackText then
			gameMode = "Menu"
			if enableSounds then selectSound:play() end
		elseif self.text == gameOverSubTitle then
			gameMode = "Play"
			showGameOver = false
			reset()
			if enableSounds then selectSound:play() end
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