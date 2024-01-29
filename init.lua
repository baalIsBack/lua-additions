if arg[2] == "debug" then
	require("lldebugger").start()
end


local relativeFolder = (...) .. "."--:match("(.-)[^%.]+$")

local old_require = require
local require = function(libname)
	return old_require(relativeFolder .. libname)
end


require('sstring')
require('table')
require('extension')

local init = {}
init.Prototype = require('Prototype')

return init