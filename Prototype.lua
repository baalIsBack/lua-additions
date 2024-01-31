local Prototype = {}
Prototype.__index = Prototype

<<<<<<< HEAD
function Prototype:new()
	local new_instance = {}
	setmetatable(new_instance, self)

	new_instance.__index = new_instance
=======
function Prototype:new(...)
	local new_instance = {}
	new_instance.__index = new_instance
	setmetatable(new_instance, self)

>>>>>>> a83df85c1f19e31bd802af60aaadab98a0ff17d2

	return new_instance
end

<<<<<<< HEAD
function Prototype:super()
	return getmetatable(self)
end



=======
>>>>>>> a83df85c1f19e31bd802af60aaadab98a0ff17d2
return Prototype