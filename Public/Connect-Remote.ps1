Function Connect-Remote
{
    Add-Type -AssemblyName Microsoft.VisualBasic
    $ComputerName = [Microsoft.VisualBasic.Interaction]::InputBox("Enter Hostname or IP", "Hostname", "$ComputerName")
    write-host $ComputerName
    $creds = Get-Credential
    Enter-PSSession -ComputerName $ComputerName -Credential $creds
}