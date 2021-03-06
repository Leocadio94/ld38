bg = love.graphics.newImage("assets/images/bg.png")
stars = love.graphics.newImage("assets/images/stars.png")
planetSprite = love.graphics.newImage("assets/images/planet.png")
playerSprite = love.graphics.newImage("assets/images/playerSprite.png")
playerAnimation = love.graphics.newImage("assets/images/playerAnimation.png")
enemySprite = love.graphics.newImage("assets/images/enemySprite.png")
enemyAnimation = love.graphics.newImage("assets/images/enemyAnimation.png")
gunSprite = love.graphics.newImage("assets/images/gunSprite.png")
gunAnimation = love.graphics.newImage("assets/images/gunAnimation.png")
bulletSprite = love.graphics.newImage("assets/images/bulletSprite.png")

bornSound = love.audio.newSource("assets/sounds/born.wav", "static")
deathSound = love.audio.newSource("assets/sounds/death.wav", "static")
selectSound = love.audio.newSource("assets/sounds/select.wav", "static")
shootSound = love.audio.newSource("assets/sounds/shoot.wav", "static")
walkSound = love.audio.newSource("assets/sounds/walk.wav", "static")
enemyDeathSound = love.audio.newSource("assets/sounds/enemyDeath.wav", "static")
playerDamageSound = love.audio.newSource("assets/sounds/playerDamage.wav", "static")

gameMusic = love.audio.newSource("assets/music/game.wav")

fontBig = love.graphics.newFont("assets/fonts/space_one.ttf", 80)
fontMedium = love.graphics.newFont("assets/fonts/bm_space.ttf", 60)
fontSmall = love.graphics.newFont("assets/fonts/bm_space.ttf", 20)

cursor = love.mouse.newCursor("assets/images/cursor.png", 0, 0)
click = love.mouse.newCursor("assets/images/click.png", 0, 0)
