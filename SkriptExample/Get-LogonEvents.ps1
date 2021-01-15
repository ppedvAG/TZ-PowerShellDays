[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Folgende Werte wurde vom User übergeben. EventID: $EventId, Newest: $Newest, Computername:$Computername"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest
