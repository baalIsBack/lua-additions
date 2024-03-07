local Prototype = require 'lua-additions.Prototype'
local Callbackmanager = Prototype:clone("Callbackmanager")


function Callbackmanager:init()
  self.callbacks = {}
  return self
end

function Callbackmanager:register(name, f, p1, ...)
  assert(f, "Callback requires function.")
  if not self.callbacks[name] then
    self.callbacks[name] = {}
  end
  local params = {}
  if p1 then
    params = {p1, ...}
  end
  --if p1 and p1:type() == "Animation" then asd()end
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
