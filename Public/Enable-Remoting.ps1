function Enable-Remoting
{
#.DESCRIPTION This needs to be run locally on the target machine to enable remote connections.
    $result = [System.Windows.Forms.MessageBox]::Show('This is potentially EXTREMELY dangerous to run. Are you sure?' , "WARNING!" , 4)
    
    if ($result -eq 'Yes') {
    While (1) 
        { 
            Set-Service -Name "WinRM" -StartupType Automatic -Status Running
        #Uncomment below and run on management machine if you want to connect to target using IP
            #Set-Item wsman:\localhost\Client\TrustedHosts -value 172.22.8.253
            #Restart-Service WinRM

        #Uncomment to configure https transport on target
            Set-Service -Name "WinRM" -StartupType Automatic -Status Running
            $Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName "172.22.8.253"
            $cert.Thumbprint
            New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint –Force
            New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP
            Enable-PSRemoting
            <#
            Enable-PSRemoting
            winrm quickconfig
            #winrm quickconfig -transport:https
            Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP" -RemoteAddress Any
            Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP-NoScope" -RemoteAddress Any
            Set-NetFirewallRule -Name "WINRM-HTTP-In-TCP-PUBLIC" -RemoteAddress Any
            #>
        }     
    }
}