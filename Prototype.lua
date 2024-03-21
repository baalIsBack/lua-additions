local Prototype = {}
Prototype.__index = Prototype

function Prototype:clone(name)
	local new_instance = {}
	setmetatable(new_instance, self)

	new_instance.__index = new_instance

	new_instance.type_name = name or new_instance:super():type()

	new_instance["is" .. new_instance.type_name] = true

	return new_instance
end

function Prototype:type()
	return self.type_name
end

function Prototype:super()
	return getmetatable(self)
end

function Prototype:init(...)
	return self
end

function Prototype:new(...)
	return self:clone():init(...)
end

return Prototype
