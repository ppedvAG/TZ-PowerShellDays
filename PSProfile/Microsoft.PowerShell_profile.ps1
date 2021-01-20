
function Color-Console
{
[cmdletBinding()]
param()
    $Host.ui.RawUI.BackgroundColor = "white"
    $Host.UI.RawUI.ForegroundColor = "Black"
    $Host.UI.RawUI.WindowTitle = "PowerShell $($PSVersionTable.PSVersion.MAjor) $((Get-Date).ToShortTimeString())"

    if((Get-Command -Name Set-PSReadlineOption).Version.Major -lt 2)
    {
        Write-Verbose -Message "OS = SErver2016 oder Windows1803 oder geringer"

        Set-PSReadlineOption -TokenKind Command -ForegroundColor DarkBlue
        Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
        Set-PSReadlineOption -TokenKind Number -ForegroundColor DarkRed
        Set-PSReadlineOption -TokenKind Member -ForegroundColor Gray
        Set-PSReadlineOption -TokenKind Comment -ForegroundColor Green
    }
    else
    {
        Write-Verbose -Message "PSReadline V2 ab Windows10 1809 / Server 2019"

        Set-PSReadLineOption -Colors @{"Parameter" = [ConsoleColor]::Blue
                               "Command"   = [Consolecolor]::DarkBlue
                               "Number"    = [Consolecolor]::DarkRed
                               "Member"    = [ConsoleColor]::Gray
                               "String"    = [Consolecolor]::DarkGreen
                               "Comment"   = [ConsoleColor]::Green
                               "Keyword"   = [ConsoleColor]::Magenta
                               "None"      = [ConsoleColor]::Black
                               "Operator"  = [ConsoleColor]::DarkMagenta
                               "Type"      = [ConsoleColor]::Cyan
                               "Variable"  = [ConsoleColor]::DarkCyan}
    }    
    Clear-Host
}

function prompt
{
    $currentprincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $adminStatus = $currentprincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if($adminStatus)
    {
        $UserState = "Elevated"
    }
    else
    {
        $UserState = "User"
    }

    Write-Host -ForegroundColor Blue "[$UserState] $(Get-Location) | $($env:COMPUTERNAME)" 
    Write-Host "[$((Get-Date).ToShortTimeString())] " -NoNewline #$('>' * ($NestedPromptLevel + 1))

}

Color-Console