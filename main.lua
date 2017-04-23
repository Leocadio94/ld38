require "classes.libs"
require "classes.assets"

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 800, 600
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

	input = require "classes.input"
	planet = require "classes.planet" (gameWidth/2, gameHeight/2)
	player = require "classes.player" (gameWidth/2, gameHeight/2 - planet.width/2)
end

function love.update(dt)
	lurker.update()
	input:update()
	planet:update(dt)
	player:update(dt)
end

function love.draw()
  	push:start()

	love.graphics.print("Hello World!", x, y)
	love.graphics.draw(bg, 0, 0)

	planet:draw()
	player:draw()

	push:finish()
end
