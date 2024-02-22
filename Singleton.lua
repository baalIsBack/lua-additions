local Prototype = require 'lua-additions.Prototype'

local Singleton = Prototype:new() --

function Singleton:init()
  self.contents = {}
end

function Singleton:get(prototype)
  if not self.contents[prototype] then
    self.contents[prototype] = prototype:new():init()
  end
  return self.contents[prototype]
end

return Singleton
