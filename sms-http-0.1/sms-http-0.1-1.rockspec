package = "sms-http"
version = "0.1-1"
source = {
   url = "https://brunotag.github.io/xcsoar-lua-scripts/sms-http-0.1.tar.gz"
}
description = {
   summary = "send sms via http",
   homepage = "https://github.com/brunotag/xcsoar-lua-scripts/tree/master/sms-http-0.1",
   license = "MIT"
}
dependencies = {
   "lua >= 5.4",
   "strutil >= 1.1",
   "lunajson >= 1.2.3",
}
build = {
   type = "builtin",
   modules = {
      ["sms-http"] = "sms-http.lua"
   }
}
