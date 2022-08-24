Function Set-AudioLevel 
{
    Param(
        [parameter(Mandatory=$true)]
        [ValidateRange(0,1)]
        [double]$AudioLevel
    )

    Start-AudioControl
    [audio]::Volume = $AudioLevel
}