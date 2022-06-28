$rockSpeckFileName = (Get-Item *.rockspec).Name
#Remove-Item -Recurse -Force ./lua_modules
luarocks install --tree lua_modules --only-deps $rockSpeckFileName
wget "https://brunotag.github.io/xcsoar-lua-scripts/set-paths.lua" -outfile "./set-paths.lua"