local smsMessenger = {}

json = require "json"

r = {
    phone = "+64226441495",
    message = "test",

    ip = "localhost",
    port = "8787",
    path = "SendSMS",
    username = "bru",
    password = "no",
}

function str_interp(s, tab)
    return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

request = xcsoar.http.Request:new(
    str_interp("http://${ip}:${port}/${path}?username=${username}&password=${password}&phone=${phone}&message=${message}", r)
);

httpResponse = request:perform()

response = json.decode(httpResponse.body);
xcsoar.fire_legacy_event("StatusMessage",response.status)
xcsoar.fire_legacy_event("StatusMessage",response.message)