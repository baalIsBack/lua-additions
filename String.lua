local String = getmetatable('')


function String:toFirstUpper()
	return (self:gsub("^%l", string.upper))
end

function String:toFirstLower()
	return (self:gsub("^%u", string.lower))
end