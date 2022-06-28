local version = _VERSION:match("%d+%.%d+")
package.path = './lua_modules/share/lua/' .. version .. '/?.lua;./lua_modules/share/lua/' .. version .. '/?/init.lua;' .. package.path
package.cpath = './lua_modules/lib/lua/' .. version .. '/?.so;' .. package.cpath

local lunajson = require 'lunajson'
local strutil = require 'strutil'

local function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

local configString = readAll("sms-http-config.json");
local options = lunajson.decode(configString);

options.message = "stocazzo";

local url = strutil.interpolate("http://${ip}:${port}/${path}?username=${username}&password=${password}&phone=${phone}&message=${message}", options);

print (url);