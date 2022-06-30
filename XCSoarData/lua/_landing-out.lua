local send_txt_location = require("/lib/send-txt-location");
local config = require("/data/config");

send_txt_location.send({
    glider = config.glider,
    phone = config.retrievePhone,
    status = "landing out"
});