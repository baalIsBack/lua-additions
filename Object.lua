local Object = Prototype:new()
Object.isObject = true


function Object:init()
  self.jobs = Jobqueue:new():init()
  self.callbacks = Callbackmanager:new():init()
  return self
end

return Object
