configuration WebServerConfiguration
{
    # Zum Abrufen der Knotenliste können Ausdrücke ausgewertet werden.
    # Beispiel: $AllNodes.Where("Role -eq Web").NodeName
    node ("Member1")
    {
        LocalConfigurationManager
        {
            #ApplyOnly: Nur einmalig Konfiguration anwenden
            #ApplyAndMonitor: Konfiguration anwenden und bei Abweichung EventLog Eintrag
            ConfigurationMode = "ApplyAndAutoCorrect" #Konfiguration anwenden und bei Abweichung automatisch wieder herrstellen        }
        }
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
WebServerConfiguration -OutputPath "$(Get-Location)\Configuration"