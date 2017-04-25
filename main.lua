require "classes.libs"
require "classes.assets"

mainMenu = require 'gamestates.mainmenu'
gameLevel1 = require 'gamestates.gamelevel1'
pause = require 'gamestates.pause'

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 800, 600
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

    centerX = gameWidth / 2
    centerY = gameHeight / 2

	input = require "classes.input"

	gameMusic:setLooping(true)
	gameMusic:play()

	Gamestate.registerEvents()
    Gamestate.switch(mainMenu)
end

function love.update(dt)
	lurker.update()
	input:update()
end

function love.draw()
end
