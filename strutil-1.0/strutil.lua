local strutil = {}

function strutil.interpolate(string, table)
    return (string:gsub('($%b{})', function(w) return table[w:sub(3, -2)] or w end))
end

return strutil