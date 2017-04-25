local MainMenu = {}

require "classes/menu"

function MainMenu:enter()

    gameTitle = "Tiny Benn"
    gameOverTitle = "Game Over!"
    playText = "Play"
    exitText = "Exit"

    btnPlay = require "classes/button" (50, centerY - 50, 300, 100, playText)
    btnExit = require "classes/button" (50, centerY + 100, 300, 100, exitText)

    menuButtons = {}
    table.insert(menuButtons, btnPlay)
    table.insert(menuButtons, btnExit)
end

function MainMenu:update (dt)
    love.mouse.setCursor(click)
    for i, btn in ipairs(menuButtons) do
        btn:click()
    end
end

function MainMenu:draw ()
    push:start()

    love.mouse.setVisible(true)
    love.graphics.setFont(fontBig)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(bg, 0,0)
    love.graphics.draw(stars, 0,0)
    love.graphics.printf(gameTitle, 0, centerY / 4, centerX * 2, 'center')

    love.graphics.setFont(fontMedium)
    for i, btn in ipairs(menuButtons) do
        btn:draw()
    end

    push:finish()
end

return MainMenu
