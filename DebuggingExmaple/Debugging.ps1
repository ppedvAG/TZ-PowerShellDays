[cmdletBinding()]
param(
    [int]$Eingabe = 5
)

Write-Verbose -Message "ZusatzInfo1"

Write-Debug -Message "Vor Datenabruf"
Write-Host "Rufe Daten ab:" $Eingabe

Write-Verbose -Message "ZusatzInfo2"

Write-Debug -Message "Vor Datan Analyse"
Write-Host "Analysiere Daten:" $Eingabe

Write-Debug -Message "Vor Datenverarbeitung"
Write-Host "Verarbeite Daten:" $Eingabe

Write-Debug -Message "Vor Datenspeicherung"
Write-Host "Speichere Änderungen:" $Eingabe

