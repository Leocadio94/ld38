local GameLevel1 = {}

require "classes/enemyGenerator"
require "classes/gui"

level = 1
score = 0

function GameLevel1:enter()
	background = require "classes.background" ()
	planet = require "classes.planet" (gameWidth/2, gameHeight/2)
	player = require "classes.player" (gameWidth/2, gameHeight/2 - planet.width/2)
	gun = require "classes.gun" (player.x + player.ox + 5, player.y)
	enemies = {}
	generateEnemies()

	gameOverTitle = "Game Over!"
    gameOverSubTitle = "Restart"
	btnGameOver = require "classes/button" (centerX - 250, centerY, 450, 100, gameOverSubTitle)

	gameOver = false
end

function GameLevel1:update(dt)
    love.mouse.setVisible(false)
	if not gameOver then
	    background:update(dt)

		planet:update(dt)
		player:update(dt)
		gun:update(dt)

		for v,ene in ipairs(enemies) do
			ene:update(dt)
			if ene:checkCollision(player) then
				table.remove(enemies, j)
				player.lives = player.lives - 1
			end
		end

		for i, bul in ipairs(gun.bullets) do
			for j,ene in ipairs(enemies) do
				if ene:checkCollision(bul) then
					table.remove(enemies, j)
					table.remove(gun.bullets, i)
					score = score + 100 * level
				end
			end
		end

		if table.getn(enemies) == 0 then
			generateEnemies()
			level = level + 1
		end

		if player.lives == 0 then
			gameOver = true
		end

		if input.escape then
			Gamestate.push(pause)
		end
	else
		btnGameOver:click()
	end
end

function GameLevel1:draw()
  	push:start()

	background:draw()

	if not gameOver then

		planet:draw()
		player:draw()
		gun:draw()

		for k,ene in ipairs(enemies) do
			ene:draw()
		end

		drawGui()
	else
	    love.mouse.setVisible(true)
	    love.graphics.setFont(fontBig)
	    love.graphics.setColor(255, 255, 255, 255)
	    love.graphics.print(gameOverTitle, centerX, centerY/2, 0, 1, 1, fontBig:getWidth(gameOverTitle)/2, fontBig:getHeight(gameOverTitle)/2)
	    love.graphics.setFont(fontMedium)
	    btnGameOver:draw()
	end

    push:finish()
end

return GameLevel1
