local Prototype = require 'lua-additions.Prototype'
local Object = Prototype:clone("Object")


function Object:init()
	local Jobs = require 'lua-additions.Jobs'
	local Callbackmanager = require 'lua-additions.Callbackmanager'

	self.jobs = Jobs:new()
	self.callbacks = Callbackmanager:new()
	return self
end

return Object
