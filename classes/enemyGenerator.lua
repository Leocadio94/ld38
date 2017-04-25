local spawnEnemiesMax = 3

function generateEnemies()
    for i = 1, spawnEnemiesMax do
        local chosenX = lume.randomchoice({0, gameWidth})
        local direction = 1

        if chosenX == gameWidth then
            direction = -1
        end

        enemy = require "classes.enemy" (chosenX + table.getn(enemies) * 2, player.y + table.getn(enemies) * 2, direction)

        table.insert(enemies, enemy)
    end
end
