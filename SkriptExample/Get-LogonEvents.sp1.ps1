
 Get-EventLog -LogName Security -ComputerName localhost | Where-Object EventId -eq 4624 | Select-Object -First 10
