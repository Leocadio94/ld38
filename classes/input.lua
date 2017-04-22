Input = Object:extend()

function Input:new()
    self.left = nil
    self.right = nil
    self.up = nil
    self.down = nil
    
    self.space = nil
    self.escape = nil

end

function Input:update()
    if joystick ~= nil then
        self.left = love.keyboard.isDown("left", "a") or 
                    joystick:isGamepadDown('dpleft') or 
                    joystick:getHat(1) == 'l' or
                    joystick:getGamepadAxis("leftx") == -1 or 
                    joystick:getAxis(1) == -1

        self.right = love.keyboard.isDown("right", "d") or 
                    joystick:isGamepadDown('dpright') or 
                    joystick:getHat(1) == 'r' or
                    joystick:getGamepadAxis("leftx") == 1 or 
                    joystick:getAxis(1) == 1

        self.up = love.keyboard.isDown("up", "w") or 
                    joystick:isGamepadDown('dpup') or 
                    joystick:getHat(1) == 'u' or
                    joystick:getGamepadAxis("lefty") == -1 or 
                    joystick:getAxis(2) == -1

        self.down = love.keyboard.isDown("down", "s") or 
                    joystick:isGamepadDown('dpdown') or 
                    joystick:getHat(1) == 'd' or
                    joystick:getGamepadAxis("lefty") == 1 or 
                    joystick:getAxis(2) == 1
        
        self.space = love.keyboard.isDown("space", 'rctrl', 'lctrl', 'ctrl') or 
                        joystick:isGamepadDown('a', 'rightshoulder') or 
                        joystick:isDown(1, 8)

        self.escape = love.keyboard.isDown("escape") or joystick:isGamepadDown('back', 'start') or joystick:isDown(12)
    else
        self.left = love.keyboard.isDown("left", "a")
        self.right = love.keyboard.isDown("right", "d")
        self.up = love.keyboard.isDown("up", "w")
        self.down = love.keyboard.isDown("down", "s")
        
        self.space = love.keyboard.isDown("space", 'rctrl', 'lctrl', 'ctrl')
        self.escape = love.keyboard.isDown("escape")
    end
end
