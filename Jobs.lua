local Prototype = require 'lua-additions.Prototype'
local cron = require 'lua-additions.cron'
local Jobs = Prototype:new()

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

function Jobs:after(time, f, ...)
  table.insert(self.jobs, cron.after(time, f, ...))
end

function Jobs:every(time, f, ...)
  table.insert(self.jobs, cron.every(time, f, ...))
end

return Jobs
