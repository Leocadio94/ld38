require "classes.libs"
require "classes.assets"

local mainMenu = require 'gamestates.mainmenu'
local gameLevel1 = require 'gamestates.gamelevel1'
local pause = require 'gamestates.pause'

function love.load()
    -- Grab window size
	gameWidth, gameHeight = 800, 600
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

	input = require "classes.input"

	Gamestate.registerEvents()
    Gamestate.switch(gameLevel1)
end

function love.update(dt)
	lurker.update()
	input:update()
end

function love.draw()
end
