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

	gameMusic:setLooping(true)
	gameMusic:play()

	gameOver = false
end

function GameLevel1:update(dt)
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
	end
end

function GameLevel1:draw()
  	push:start()

	if not gameOver then
		background:draw()

		planet:draw()
		player:draw()
		gun:draw()

		for k,ene in ipairs(enemies) do
			ene:draw()
		end

		drawGui()
	end

    push:finish()
end

return GameLevel1
