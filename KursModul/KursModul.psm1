function New-TestFilesDir
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})] #Root Verzeichnis muss vorhanden sein
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

#Funktionen
function TestFilesCreation
{
    param(
    [int]$Count,
    [string]$path
    )

    #Prüfen ob Pfad mit \ endet, wenn nicht wird es hinzugefügt
    if($path.EndsWith("\") -eq $false)
    {
        $path = $path + "\"
    }

    for($i = 1; $i -le $Count; $i++)
    {
        $FileNumber = "{0:D2}" -f $i
        $Filepath = $path + "File" + $FileNumber + ".txt"
        New-Item -Path $Filepath -ItemType File
    }
}

$TestFilespath = $path + "TestFiles"

if((Test-Path -Path $TestFilespath))
{
    if($force)
    {   #Wenn Pfad vorhanden und Parameter Force angegeben, lösche Inhalt
        Get-ChildItem -Path $TestFilespath -Recurse | Remove-Item -Force -Recurse
    }
    else
    {   #Wenn Pfad vorhanden aber Force nicht angegeben, gebe Meldung aus und beende
        Write-Host -ForegroundColor Red -Object "Der Ordner Testfiles ist bereits vorhanden"
        exit #beendet die Skript Ausführung
    }
}
else
{
    New-Item -Path $TestFilespath -ItemType Directory
}

#Dateien im TestFiles Root Verzeichnis erstellen
TestFilesCreation -Count $FileCount -path $TestFilespath

#Schleife zum erstellen der Ordner
for($i = 1; $i -le $DirCount;$i++)
{
    $DirNumber = "{0:D2}" -f $i #Zahlenformatieren mit führenden Nullen z.B. 2 -> 02
    $dirpath = "$TestFilespath\Ordner$DirNumber"
    New-Item -Path $dirpath -ItemType Directory #erstellen der Ordner

    #Dateien in jeweiligen Unterordner erstellen
    TestFilesCreation -Count $FileCount -path $dirpath

}
}