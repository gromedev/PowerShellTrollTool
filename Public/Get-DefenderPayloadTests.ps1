function Get-DefenderPayloadTests
{
    Write-Host = "Fetch a collection of non-malign ASR and Defender payloads to C:\temp\Fetch-DefenderPayloadTests"
    $result = [System.Windows.Forms.MessageBox]::Show('These files WILL set your A/V off. Continue?' , "WARNING!" , 4)
    
    if ($result -eq 'Yes') {
    While (1) 
        { 
            $Path = "C:\temp\DefenderPayloadTests"
            $Payloads  = Invoke-WebRequest -uri "https://thomasmartingrome-my.sharepoint.com/:u:/g/personal/thomas_grome_dev/EdIASJt5R1NIvGR05pqRY38B7WNzf5-uTx4pBYDG08c1lA?e=Dc0jfN" -Method "GET"  -Outfile $Path
            Expand-Archive -Path $Payloads -DestinationPath C:\Temp\Get-DefenderPayloadTests -OutFile "$path\ZippedFile.zip"
        }     
    }
}