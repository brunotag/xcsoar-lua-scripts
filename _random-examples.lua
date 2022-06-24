-- comment starts with a double hyphen

--[[
multi
line
comment
]]--

i = 42
if i > 1 then
   --xcsoar.fire_legacy_event("StatusMessage","i=" .. i)
elseif i == 0 then
   --xcsoar.fire_legacy_event("StatusMessage","zero")
else
   error("negative")
end

a = {1, 'a', 3.14}
--xcsoar.fire_legacy_event("StatusMessage",a[2])

function f(a, b)
   return a * b
end
--xcsoar.fire_legacy_event("StatusMessage", f(2, 3))
--xcsoar.fire_legacy_event("StatusMessage", "Lua Na")
--xcsoar.fire_legacy_event("StatusMessage", "Status")
--xcsoar.fire_legacy_event("StatusMessage", "Lua Na 2")

--it is not (yet) possible to control the delay of the messages.
--currently the delay depends on the content of the message.

-- alert("Ciao Piero\nMi sono rotto")
message = "{ \"to\": \"+64226441495\". \"message\": \"zio lampante\"}";

function sendMessage(url, options)
   
end



