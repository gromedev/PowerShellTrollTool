function Invoke-VariableInputPopup {
<#    
[CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [int]
        $Age
    )
    Write-Output $Age
#>
}

<#
$Command = Show-Command Invoke-VariableInputPopup -PassThru
$MyAge = Invoke-Expression $Command

#[Environment]::SetEnvironmentVariable("VAR_TEST", "AAAAAAAAAA", "Machine")
#[System.Environment]::GetEnvironmentVariable('VAR_TEST','machine')
#>