<#
.SYNOPSIS
    Forked from https://github.com/perplexityjeff/PowerShell-Troll
    https://github.com/Hackstur/JokerShell/blob/master/
    https://github.com/Agunderman10/Powershell-Pranks

    https://lazyadmin.nl/powershell/powershell-gui-howto-get-started/


.DESCRIPTION
    Bunch of joke functions for the everyday scriptkiddie.


.TO-DO
    - Dropdown: executes function on selection
    - Notification: when e.g. Get-AudioLevel is invoked, show out put at the bottom of the window
    - Test on Remote Machine (with WinRM)
    - New-ModuleManifest -Path .\PwshTroll -ModuleVersion "1.0" -Author "thomas@grome.dev"
    - Text Menu: Add function execution confirmation 
    - Remote: Fix PSSession function
#>

$Public  = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)

foreach ($Import in @($Public + $Private)) {
    try {
        . $Import.Fullname -ErrorAction Stop
    }
    catch {
        Write-Error -Message "Failed to import function $($Import.Fullname): $_" -ErrorAction Continue
    }
}

Export-ModuleMember -Function $Public.Basename