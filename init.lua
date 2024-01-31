local relativeFolder = (...) .. "."--:match("(.-)[^%.]+$")

local function load(lib_name)
	return require(relativeFolder..lib_name)
end

load 'sstring'
load 'table'
load 'extension'

local init = {}
return init