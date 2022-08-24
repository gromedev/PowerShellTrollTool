Function Send-AudioFile
{
    Param(
        [parameter(Mandatory=$true)]
        [string]$URL
    )

    if(Test-Path "DownloadedWAVFile.wav")
    {
        Remove-Item "DownloadedWAVFile.wav" -Force
    }

    Invoke-WebRequest -Uri $URL -OutFile "DownloadedWAVFile.wav"

    $filepath = ((Get-Childitem "DownloadedWAVFile.wav").FullName)

    $sound = new-Object System.Media.SoundPlayer;
    $sound.SoundLocation=$filepath;
    $sound.Play();
}