Function Invoke-NotificationSoundSpam
{
    param
    (
        [Parameter()][int]$Interval = 4
    )
    Get-ChildItem C:\Windows\Media\ -File -Filter *.wav | Select-Object -ExpandProperty Name | Foreach-Object { Start-Sleep -Seconds $Interval; (New-Object Media.SoundPlayer "C:\WINDOWS\Media\$_").Play(); }
}