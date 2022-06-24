local strutil = {}

function strutil.interpolate(string, table)
    return (string:gsub('($%b{})', function(w) return table[w:sub(3, -2)] or w end))
end

function strutil.toString(objOrTable)
    local o = objOrTable;
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. strutil.toString(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

return strutil