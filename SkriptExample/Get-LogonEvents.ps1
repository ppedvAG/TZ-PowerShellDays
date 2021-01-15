<#
.SYNOPSIS
Frägt An / Abmeldebezogene Events vom Systme ab
.DESCRIPTION
Frägt An / Abmeldebezogene Events vom Systme ab. Es sind folgende EventTypen Möglich: Anmeldung, Abmeldung, fehlgeschlagene Anmeldung
.PARAMETER EventId
Legt fest welches Event abgefragt werden soll. 4624 Anmeldung, 4634 Abmeldung, 4625 fehlgeschalgene Anmeldung
.EXAMPLE
Get-LogonEvents.ps1 -EventId 4624 -Newest 2

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   31791 Jan 15 11:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   31786 Jan 15 11:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....

   Frägt vom localhost die letzten 2 erfolgreichen Anmeldungen ab
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Folgende Werte wurde vom User übergeben. EventID: $EventId, Newest: $Newest, Computername:$Computername"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest
