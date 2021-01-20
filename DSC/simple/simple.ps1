configuration WebServerConfiguration
{
    # Zum Abrufen der Knotenliste können Ausdrücke ausgewertet werden.
    # Beispiel: $AllNodes.Where("Role -eq Web").NodeName
    node ("Member1")
    {
        # Ressourcenanbieter aufrufen
        # Beispiel: WindowsFeature, File
        WindowsFeature WebServerRolle
        {
           Ensure = "Present"
           Name   = "Web-Server"
        }

        WindowsFeature ManagementTools
        {
            Ensure = "Present"
            Name = "Web-Mgmt-Tools"
        }      
    }
}
WebServerConfiguration -OutputPath (Get-Location)