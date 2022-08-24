Function Set-AudioUnmute 
{
    Start-AudioControl
    [Audio]::Mute = $false
}