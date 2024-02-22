local Callbackmanager = Prototype:new()


function Callbackmanager:init()
  self.callbacks = {}
  return self
end

function Callbackmanager:register(name, f)
  if not self.callbacks[name] then
    self.callbacks[name] = {}
  end
  table.insert(self.callbacks[name], f)
end

function Callbackmanager:call(name, ...)
  if self.callbacks[name] then
    for i, c in ipairs(self.callbacks[name]) do
      c(...)
    end
  end
end

return Callbackmanager
