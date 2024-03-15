local Object = require 'lua-additions.Object'
local Animation = Object:clone("Animation")

local table = require 'lua-additions.stable'

function Animation:init(fps, quads, loop)
  local Jobs = require 'lua-additions.Jobs'
  Object.init(self)
  self.callbacks:declare("finish")

  self.active = true
  self.loop = true
  if loop ~= nil then
    self.loop = loop
  end
  self.quads = quads
  self.quad_id = 1
  self.jobs = Jobs:new()
  self.jobs:every(1 / fps, function(self)
    if self.active then
      if self.quad_id == #self.quads then
        self.callbacks:call("finish", self)
        if not self.loop then
          return
        end
      end
      self.quad_id = (self.quad_id % #self.quads) + 1
    end
  end, self)
  return self
end

--[[
	Will load all images; TODO: rename function to represent behavior better
]]
function Animation:quadsFromSheet(img, frameW, frameH) --
  local quads = {}
  for x = 0, (img:getWidth() / frameW) - 1, 1 do
    table.insert(quads,
      love.graphics.newQuad(x * frameW, 0 * frameH, frameW, frameH, img:getWidth(), img:getHeight()))
  end
  return quads
end

function Animation:stop()
  self.active = false
  self.quad_id = 1
  return self
end

function Animation:pause()
  self.active = false
  return self
end

function Animation:play()
  self.active = true
  return self
end

function Animation:restart()
  self.active = true
  self.quad_id = 1
  return self
end

function Animation:reverse()
  table.reverse(self.quads)
  return self
end

function Animation:update(dt)
  self.jobs:update(dt)
  return self
end

function Animation:getQuad()
  return self.quads[self.quad_id]
end

return Animation
