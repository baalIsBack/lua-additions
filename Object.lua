local Jobs = require 'lua-additions.Jobs'
local Callbackmanager = require 'lua-additions.Callbackmanager'
local Prototype = require 'lua-additions.Prototype'
local Object = Prototype:instantiate()
Object.isObject = true


function Object:init()
  self.jobs = Jobs:new()
  self.callbacks = Callbackmanager:new()
  return self
end

return Object
