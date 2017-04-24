function drawGui()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("SCORE: "..score, 0, 0)
    love.graphics.print("LIVES: "..player.lives, gameWidth - 50, 0)
end
