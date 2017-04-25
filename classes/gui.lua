function drawGui()
    love.graphics.setFont(fontSmall)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("SCORE: "..score, 0, 0)
    love.graphics.print("LEVEL: "..level, 0, fontSmall:getHeight("LEVEL: "..level))
    love.graphics.print("LIVES: "..player.lives, gameWidth - fontSmall:getWidth("LIVES: "..player.lives), 0)
end
