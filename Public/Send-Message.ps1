function Send-Message 
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [string]
        $Message
    )
    #Write-Output $Message
}

$Command = Show-Command Send-Message -PassThru
$MyMessage = msg.exe * $Command
$Message = $null