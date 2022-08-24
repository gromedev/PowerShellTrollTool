function Get-DefenderPayloadTests
{
    Write-Host = "Fetch a collection of non-malign ASR and Defender payloads to C:\temp\Fetch-DefenderPayloadTests"
    $result = [System.Windows.Forms.MessageBox]::Show('These files WILL set your A/V off. Continue?' , "WARNING!" , 4)
    
    if ($result -eq 'Yes') {
    While (1) 
        { 
            $Path = "C:\temp\DefenderPayloadTests.zip"
            $Payloads  = Invoke-WebRequest -uri "https://github.com/gromedev/PowerShellTrollTool/blob/main/Assets/Get-DefenderPaylodTests.zip" -Outfile $Path | 
            #Expand-Archive -Path $Path -DestinationPath "C:\Temp\Get-DefenderPayloadTests"
            explorer.exe "C:\Temp\"
        }     
    }
}