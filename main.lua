require "classes.libs"
require "classes.assets"

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 800, 600
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

	input = require "classes.input"
	world = require "classes.world" (gameWidth/2, gameHeight/2)
end

function love.update(dt)
	lurker.update()
	input:update()
	world:update(dt)
end

function love.draw()
  	push:start()

	love.graphics.print("Hello World!", x, y)
	love.graphics.draw(bg, 0, 0)

	world:draw()

	push:finish()
end
