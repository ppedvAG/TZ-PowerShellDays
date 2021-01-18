[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})]
    [string]$path,

    [ValidateRange(1,99)]
    [int]$FileCount = 5,

    [ValidateRange(1,99)]
    [int]$DirCount = 5,

    [switch]$force
)
if($path.EndsWith("\") -eq $false)
{
    $path = $path + "\"
}
$TestFilespath = $path + "TestFiles"

if((Test-Path -Path $TestFilespath))
{
    if($force)
    {
        Remove-Item -Path $TestFilespath -Recurse -Force
    }
    else
    {
        Write-Host -ForegroundColor Red -Object "Der Ordner Testfiles ist bereits vorhanden"
        exit
    }
}
else
{
    New-Item -Path $TestFilespath -ItemType Directory
}


for($i = 1; $i -le $DirCount;$i++)
{
    $DirNumber = "{0:D2}" -f $i #Zahlenformatieren mit führenden Nullen z.B. 2 -> 02
    $dirpath = "$TestFilespath\Ordner$DirNumber"
    New-Item -Path $dirpath -ItemType Directory

    for($j = 1; $j -le $FileCount; $j ++)
    {
        $FileNumber = "{0:D2}" -f $j
        $filepath = "$dirpath\File$FileNumber.txt"
        New-Item -Path $filepath -ItemType File
    }
}