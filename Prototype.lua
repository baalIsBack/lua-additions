

local Prototype = {}
Prototype.__index = Prototype

function Prototype:instantiate()
  local new_instance = {}
  setmetatable(new_instance, self)

  new_instance.__index = new_instance

  return new_instance
end

function Prototype:getID()
  return "::UNDEFINED"
end

function Prototype:super()
  return getmetatable(self)
end

function Prototype:init(...)
  return self
end

function Prototype:new(...)
  if self.singleton_instance then
    return self.singleton_instance
  end
  return self:instantiate():init(...)
end

function Prototype:singleton(...)
  if self.singleton_instance then
    return self.singleton_instance
  end
  self.singleton_instance = self:new(...)

  if Global then
    Global:set(self:getID(), self.singleton_instance)
  end

  return self.singleton_instance
end

return Prototype
