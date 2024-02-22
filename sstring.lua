local sstring = getmetatable('') --super string


function sstring:toFirstUpper()
  return (self:gsub("^%l", string.upper))
end

function sstring:toFirstLower()
  return (self:gsub("^%u", string.lower))
end
