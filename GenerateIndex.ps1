$files = dir .\* -include ('*.tar.gz', '*.lua')
New-Item './index.html' -ItemType File -Force | out-null

Add-Content './index.html' '<html><head>'
Add-Content './index.html' '<title>Lua Packages</title>'
Add-Content './index.html' '</head>'
Add-Content './index.html' '<body><h1>Lua Packages</h1>'

foreach ($file in $files)
{
    $fileName = $file.Name
    Add-Content './index.html' "<a href=""/xcsoar-lua-scripts/$fileName"">$fileName</a><br><br>"
}

Add-Content './index.html' '</body></html>'