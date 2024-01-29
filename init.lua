local relativeFolder = (...) .. "."--:match("(.-)[^%.]+$")

require (relativeFolder..'String')
require (relativeFolder..'table')
require (relativeFolder..'extension')

local init = {}

return init