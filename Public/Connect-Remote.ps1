Function Connect-Remote
{
    $ComputerName = "172.22.8.253"
    $creds = Get-Credential
    Enter-PSSession -ComputerName $ComputerName -Credential $creds
}