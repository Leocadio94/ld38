local GameLevel1 = {}

function GameLevel1:enter()
	background = require "classes.background" ()
	planet = require "classes.planet" (gameWidth/2, gameHeight/2)
	player = require "classes.player" (gameWidth/2, gameHeight/2 - planet.width/2)
	gun = require "classes.gun" (player.x + player.ox + 5, player.y)
	enemy1 = require "classes.enemy" (0, player.y, 1)
	enemy2 = require "classes.enemy" (gameWidth, player.y, -1)
	enemies = {}
	table.insert(enemies, enemy1)
	table.insert(enemies, enemy2)

	gameMusic:setLooping(true)
	gameMusic:play()
end

function GameLevel1:update(dt)
    background:update(dt)

	planet:update(dt)
	player:update(dt)
	gun:update(dt)

	for v,ene in ipairs(enemies) do
		ene:update(dt)
	end

	for i, bul in ipairs(gun.bullets) do
		for j,ene in ipairs(enemies) do
			if ene:checkCollision(bul) then
				table.remove(enemies, j)
				table.remove(gun.bullets, i)
			end
		end
	end
end

function GameLevel1:draw()
  	push:start()

	background:draw()

	planet:draw()
	player:draw()
	gun:draw()

	for k,ene in ipairs(enemies) do
		ene:draw()
	end

    push:finish()
end

return GameLevel1
