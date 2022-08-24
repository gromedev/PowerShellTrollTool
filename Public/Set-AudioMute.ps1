Function Set-AudioMute 
{
    Start-AudioControl
    [Audio]::Mute = $true
}