require "classes.libs"
require "classes.assets"

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 800, 600
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

	input = require "classes.input"
	background = require "classes.background" ()
	planet = require "classes.planet" (gameWidth/2, gameHeight/2)
	player = require "classes.player" (gameWidth/2, gameHeight/2 - planet.width/2)
	gun = require "classes.gun" (player.x + player.ox + 5, player.y)

	gameMusic:setLooping(true)
	gameMusic:play()
end

function love.update(dt)
	lurker.update()
	input:update()

	background:update(dt)

	planet:update(dt)
	player:update(dt)
	gun:update(dt)
end

function love.draw()
  	push:start()

	background:draw()

	planet:draw()
	player:draw()
	gun:draw()

	push:finish()
end
