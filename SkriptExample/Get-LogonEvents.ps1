param(
[int]$EventId,
[int]$Newest,
[string]$Computername
)

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest
