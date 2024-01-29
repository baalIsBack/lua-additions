local Prototype = {}
Prototype.__index = Prototype

function Prototype:new(...)
	local new_instance = {}
	new_instance.__index = new_instance
	setmetatable(new_instance, self)


	return new_instance
end

return Prototype