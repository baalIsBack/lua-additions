--- Queue implementation using Stack with modified index
-- @module Queue

local Stack = require 'lua-additions.Stack'

local Queue = Stack:instantiate()

--Functions
function Queue:index()
  return math.min(1, #self.contents)
end

return Queue
