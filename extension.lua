
local function NEW_RECURSIVE_CALL(t, mt, ...)
				if mt == nil then
								return
				end
				local f_load = rawget(mt, "load")
				if f_load then
								NEW_RECURSIVE_CALL(t, getmetatable(mt), ...)
								f_load(t, ...)
				end
end

local SINGLETONS = {}
function NEW(mt, ...)
				if mt.isSingleton and SINGLETONS[mt] then
								return SINGLETONS[mt]
				end
				local self = {}
				mt.__index = mt
				setmetatable(self, mt)
				
				NEW_RECURSIVE_CALL(self, mt, ...)

				if mt.isSingleton then
								SINGLETONS[mt] = self
								return SINGLETONS[mt]
				end
				return self
end

function SIGN(x)
				if x < 0 then return -1 end
				return 1

end

function ROUND(num, numDecimalPlaces)
				local mult = 10^(numDecimalPlaces or 0)
				return math.floor(num * mult + 0.5) / mult
end

function NORM(a, b)
				local x = math.sqrt(a*a + b*b)
				if x == 0 then
								return 1
				end
				return x
end

function CHECK_COLLISION(x1,y1,w1,h1, x2,y2,w2,h2)
				return x1 < x2+w2 and
								x2 < x1+w1 and
								y1 < y2+h2 and
								y2 < y1+h1
end

function ID() end

function FOREACH(t, f, ...)
				for i, v in ipairs(t) do
								f(v, i, ...)
				end
end

function DIST(x1, y1, x2, y2)
				return NORM(x2-x1, y2-y1)
end

function REVERSE(tbl)
				for i=1, math.floor(#tbl / 2) do
								local tmp = tbl[i]
								tbl[i] = tbl[#tbl - i + 1]
								tbl[#tbl - i + 1] = tmp
				end
end

function ANGLE(x1, y1, x2, y2)
				return math.atan2(y2 - y1, x2 - x1)+math.pi/2
end