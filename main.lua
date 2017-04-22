require "classes.libs"
require "classes.assets"

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 1360, 768
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})
end

function love.resize(w, h)
  	push:resize(w, h)
end

function love.update(dt)
	lurker.update()
end

function love.draw()
  	push:start()

	love.graphics.print("Hello World!", x, y)

	push:finish()
end
