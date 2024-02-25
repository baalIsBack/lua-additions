local Object = require 'lua-additions.Object'
local Keyboard = Object:new()

function Keyboard:getID()
  return "Keyboard"
end

function Keyboard:init()
  Object.init(self)

  self.wasDown = {}
  self.isDown = {}

  return self
end

function Keyboard:update(dt)
  --
end

function Keyboard:keypressed( key, scancode, isrepeat )
  --
end

function Keyboard:keyreleased( key, scancode )
  --
end

function Keyboard:isDown(instance, key)
  return love.keyboard.isDown(key)
end

function Keyboard:isPressed(instance, key)
  return self.keys[key].pressed
end

function Keyboard:isReleased(instance, key)
  return self.keys[char].released
end


local instance = Keyboard:new():init()
require("lua-additions.Global"):set(Keyboard:getID(), instance)

return Keyboard
