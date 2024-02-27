local Prototype = require 'lua-additions.Prototype'
local Global = Prototype:instantiate()
Global.isSingleton = true

function Global:init()
  self._G = {}
  return self
end

function Global:set(id, val)
  self._G[id] = val
end

function Global:get(id)
  return self._G[id]
end

return Global:new()
