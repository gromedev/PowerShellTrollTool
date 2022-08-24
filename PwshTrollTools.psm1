<#
.DESCRIPTION
    Bunch of joke functions for the everyday scriptkiddie.

Probably a good 65-70% of the functions were stolen from the following:
    https://github.com/perplexityjeff/PowerShell-Troll
    https://github.com/Hackstur/JokerShell/blob/master/
    https://github.com/Agunderman10/Powershell-Pranks
    https://lazyadmin.nl/powershell/powershell-gui-howto-get-started/
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