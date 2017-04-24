local GameLevel1 = {}

function GameLevel1:enter()
	background = require "classes.background" ()
	planet = require "classes.planet" (gameWidth/2, gameHeight/2)
	player = require "classes.player" (gameWidth/2, gameHeight/2 - planet.width/2)
	gun = require "classes.gun" (player.x + player.ox + 5, player.y)

	gameMusic:setLooping(true)
	gameMusic:play()
end

function GameLevel1:update(dt)
    background:update(dt)

	planet:update(dt)
	player:update(dt)
	gun:update(dt)
end

function GameLevel1:draw()
  	push:start()
    
	background:draw()

	planet:draw()
	player:draw()
	gun:draw()

    push:finish()
end

return GameLevel1
