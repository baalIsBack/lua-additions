local Prototype = require 'lua-additions.Prototype'
local Global = Prototype:clone("Global")

function Global:init()
	self._G = {}
	return self
end

function Global:set(id, val)
	if type(id) == "table" and id.type and val == nil then
		if id:type() == "Planet" then
			asd()
		end
		self._G[id:type()] = id
		return
	end
	self._G[id] = val
end

function Global:get(id)
	if type(id) == "table" and id.type then
		return self._G[id:type()]
	end
	return self._G[id]
end

return Global:new():init()
