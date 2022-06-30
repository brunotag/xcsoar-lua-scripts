local str_utils = {};

str_utils.InterpolateTable = function (s, tab)
    return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

return str_utils;