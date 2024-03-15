local Prototype = require 'lua-additions.Prototype'
local Callbackmanager = Prototype:clone("Callbackmanager")

function Callbackmanager:init()
  self.callbacks = {}
  return self
end

function Callbackmanager:declare(name)
  assert(not self.callbacks[name], "Callbackmanager:declare : Callback already exists: "..name)
  self.callbacks[name] = {}
end

function Callbackmanager:register(name, f, p1, ...)
  assert(f, "Callback requires function.")
  assert(self.callbacks[name], "Callbackmanager:register : No such callback: "..name)
  local params = {}
  if p1 then
    params = {p1, ...}
  end
  table.insert(self.callbacks[name], {f=f,params=params,})
end

function Callbackmanager:call(name, ...)
  if self.callbacks[name] then
    for i, c in ipairs(self.callbacks[name]) do
      if unpack(c.params) ~= nil then
        c.f(unpack(c.params), ...)
      else
        c.f(...)
      end
    end
  end
end

return Callbackmanager
