$dirs = Get-ChildItem -Directory
foreach ($dir in $dirs)
{
    if ((Get-ChildItem $dir *.rockspec).Count -gt 0)
    {
        $dirname = $dir.Name;
        tar czvpf "$dirname.tar.gz" "./$dirname"
    }
}
