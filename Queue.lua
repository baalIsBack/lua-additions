local Stack = require 'lua-additions.Stack'

local Queue = Stack:new()

--Functions
function Queue:index()
	return math.min(1, #self.contents)
end





return Queue