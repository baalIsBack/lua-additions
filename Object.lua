local Jobs = require 'lua-additions.Jobs'
local Callbackmanager = require 'lua-additions.Callbackmanager'
local Prototype = require 'lua-additions.Prototype'
local Object = Prototype:new()
Object.isObject = true


function Object:init()
  self.jobs = Jobs:new():init()
  self.callbacks = Callbackmanager:new():init()
  return self
end

return Object
