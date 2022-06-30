local send_txt_location = {}

local str_utils = require("/lib/util/str-utils")
local url_utils = require("/lib/util/url-utils")
local json = require("/lib/util/json")

send_txt_location.send = function(options)
    local messageData = {};

    if xcsoar.blackboard.location then
        messageData.locationURL = str_utils.InterpolateTable("https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}", xcsoar.blackboard.location);
    else
        messageData.locationURL = "| GPS position not available";
        xcsoar.fire_legacy_event("StatusMessage","!! NO GPS POSITION !!");
    end
    
    if xcsoar.blackboard.altitude then
        messageData.altitude = math.floor(xcsoar.blackboard.altitude * 3.28084) .. "ft";
    else
        messageData.altitude = "";
        xcsoar.fire_legacy_event("StatusMessage","!! NO ALTITUDE !!");
    end
    
    messageData.status = options.status;
    messageData.glider = options.glider;
    
    local message = str_utils.InterpolateTable("${glider} ${status} ${altitude} ${locationURL}", messageData);
    
    local r = {
        phone = options.phone;
        message = url_utils.Encode(message),
    
        ip = "localhost",
        port = "8787",
        path = "SendSMS",
        username = "bru",
        password = "no",
    }
    
    local request = xcsoar.http.Request:new(
        str_utils.InterpolateTable("http://${ip}:${port}/${path}?username=${username}&password=${password}&phone=${phone}&message=${message}", r)
    );
    
    local httpResponse = request:perform()
    
    local response = json.decode(httpResponse.body);
    xcsoar.fire_legacy_event("StatusMessage",response.status)
    xcsoar.fire_legacy_event("StatusMessage",response.message)
end

return send_txt_location;