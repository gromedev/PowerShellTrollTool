function Send-Message 
{
    $Message = "Hello"
    msg.exe * $Message
}

<#
function Send-Message 
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [string]
        $Message
    )
    Write-Output $Message
}
$func = msg.exe * $Message
$func
$Message = $null

$Command = Show-Command Send-Message -PassThru
$MyMessage = msg.exe * $Command
$Message = $null
#>