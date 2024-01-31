local Prototype = {}
Prototype.__index = Prototype

function Prototype:new()
	local new_instance = {}
	setmetatable(new_instance, self)

	new_instance.__index = new_instance

	return new_instance
end

function Prototype:super()
	return getmetatable(self)
end

function Prototype:init(...)
	return self
end


return Prototype