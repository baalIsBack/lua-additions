local Prototype = require 'lua-additions.Prototype'
local cron = require 'lua-additions.cron'
local Jobs = Prototype:instantiate()

function Jobs:getID()
  return "Jobs"
end

function Jobs:init()
  self.jobs = {}
  return self
end

function Jobs:update(dt)
  for i, j in ipairs(self.jobs) do
    j:update(dt)
  end
end

function Jobs:remove(job)
  for i, j in ipairs(self.jobs) do
    if j == job then
      table.remove(self.jobs, i)
      return true
    end
  end
  return false
end

function Jobs:insert(job)
  table.insert(self.jobs, job)
end

function Jobs:after(time, f, ...)
  self:insert(cron.after(time, f, ...))
end

function Jobs:every(time, f, ...)
  self:insert(cron.every(time, f, ...))
end

return Jobs
