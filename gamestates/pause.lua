local Pause = {}

require "classes/menu"

function Pause:enter()
    gameTitle = "Pause"
    gameOverTitle = "Game Over!"
    resumeText = "Resume"
    backText = "Back"

    btnPlay = require "classes/button" (gameWidth - centerX, centerY - 50, 350, 100, resumeText)
    btnExit = require "classes/button" (gameWidth - centerX, centerY + 100, 350, 100, backText)

    pauseButtons = {}
    table.insert(pauseButtons, btnPlay)
    table.insert(pauseButtons, btnExit)
end

function Pause:update (dt)
    love.mouse.setCursor(click)
    for i, btn in ipairs(pauseButtons) do
        btn:click()
    end
end

function Pause:draw ()
    push:start()

    love.mouse.setVisible(true)
    love.graphics.setFont(fontBig)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(bg, 0,0)
    love.graphics.draw(stars, 0,0)
    love.graphics.printf(gameTitle, 0, centerY / 4, centerX * 2, 'center')

    love.graphics.setFont(fontMedium)
    for i, btn in ipairs(pauseButtons) do
        btn:draw()
    end

    push:finish()
end

return Pause
