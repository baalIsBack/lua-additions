local old_table = table
local table = {}
setmetatable(table, old_table)
old_table.__index = old_table

function table.foreach(t, f)
  for i, v in pairs(t) do
    f(v, i)
  end
end

return table
