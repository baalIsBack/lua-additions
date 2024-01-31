
local table = table or {}

function table.foreach(t, f)
	for i, v in pairs(t) do
		f(v, i)
	end
end