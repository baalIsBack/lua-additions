local Prototype = require 'lua-additions.Prototype'

local Stack = Prototype:new()

--Methods
function Stack:init()
	self.contents = {}
	return self
end

function Stack:push(element)
	table.insert(self.contents, element)
	return self
end

function Stack:pop()
	self:assertNotEmpty()
	table.remove(self.contents, self:index())
	return self
end


--Functions
function Stack:peek()
	self:assertNotEmpty()
	return self.contents[self:index()]
end

function Stack:index()
	return #self.contents
end

function Stack:isEmpty()
	return self:index() == 0
end

function Stack:assertNotEmpty()
	assert(not self:isEmpty(), "Can not access elements of empty Stack.")
	return self
end




return Stack