$files = Invoke-Expression -Command "dir *.tar.gz"
New-Item './index.html' -ItemType File -Force

Add-Content './index.html' '<html><head>'
Add-Content './index.html' '<title>Lua Packages</title>'
Add-Content './index.html' '</head>'
Add-Content './index.html' '<body><h1>Lua Packages</h1>'

foreach ($file in $files)
{
    
    $fileName = $file -replace "\.[^\.]+$"
    Add-Content './index.html' "<a href=""$file"">$fileName</a><br><br>"
}

Add-Content './index.html' '</body></html>'