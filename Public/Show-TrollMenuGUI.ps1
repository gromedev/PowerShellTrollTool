Function Show-TrollMenuGUI
{
#.DESCRIPTION Opens a GUI menu for PwshTrollTools
Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.Size = New-Object System.Drawing.Size(1250,600)
$form.StartPosition = 'CenterScreen'
$form.text = "PowerShell Troll"


$button_click0 = {Connect-Remote}
$Button0 = New-Object System.Windows.Forms.Button
$Button0.Location = New-Object System.Drawing.Size(350,50)
$Button0.Size = New-Object System.Drawing.Size(500,35)
$Button0.Text = "Who's the unlucky guy?"
$Button0.Add_Click($Button_Click0)

#First column
$button_click1 = {Send-Message}
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Size(50,150)
$Button1.Size = New-Object System.Drawing.Size(200,35)
$Button1.Text = "Send Message"
$Button1.Add_Click($Button_Click1)


$button_click2 = {Restart-Explorer}
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(50,200)
$Button2.Size = New-Object System.Drawing.Size(200,35)
$Button2.Text = "Restart Explorer"
$Button2.Add_Click($Button_Click2)


$button_click3 = {Send-VoiceMessage}
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Size(50,250)
$Button3.Size = New-Object System.Drawing.Size(200,35)
$Button3.Text = "Send VoiceMessage"
$Button3.Add_Click($Button_Click3)


$button_click4 = {Send-AudioFile}
$Button4 = New-Object System.Windows.Forms.Button
$Button4.Location = New-Object System.Drawing.Size(50,300)
$Button4.Size = New-Object System.Drawing.Size(200,35)
$Button4.Text = "Send AudioFile"
$Button4.Add_Click($Button_Click4)


$button_click5 = {Invoke-NotificationSoundSpam}
$Button5 = New-Object System.Windows.Forms.Button
$Button5.Location = New-Object System.Drawing.Size(50,350)
$Button5.Size = New-Object System.Drawing.Size(200,35)
$Button5.Text = "Annoying Sound"
$Button5.Add_Click($Button_Click5)


$button_click6 = {Invoke-ScheduledTask}
$Button6 = New-Object System.Windows.Forms.Button
$Button6.Location = New-Object System.Drawing.Size(50,400)
$Button6.Size = New-Object System.Drawing.Size(200,35)
$Button6.Text = "New ScheduledTask"
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


$button_click10 = {Set-AudioMax}
$Button10 = New-Object System.Windows.Forms.Button
$Button10.Location = New-Object System.Drawing.Size(350,300)
$Button10.Size = New-Object System.Drawing.Size(200,35)
$Button10.Text = "Max Volume"
$Button10.Add_Click($Button_Click10)


$button_click11 = {Disable-Monitor}
$Button11 = New-Object System.Windows.Forms.Button
$Button11.Location = New-Object System.Drawing.Size(350,350)
$Button11.Size = New-Object System.Drawing.Size(200,35)
$Button11.Text = "Disable Monitor"
$Button11.Add_Click($Button_Click11)


$button_click12 = {Rotate-Monitor}
$Button12 = New-Object System.Windows.Forms.Button
$Button12.Location = New-Object System.Drawing.Size(350,400)
$Button12.Size = New-Object System.Drawing.Size(200,35)
$Button12.Text = "Desktop Orientation"
$Button12.Add_Click($Button_Click12)


$button_click9 = {Invoke-99BottlesOfBeer}
$Button9 = New-Object System.Windows.Forms.Button
$Button9.Location = New-Object System.Drawing.Size(350,250)
$Button9.Size = New-Object System.Drawing.Size(200,35)
$Button9.Text = "99 Bottles of Beer"
$Button9.Add_Click($Button_Click9)


#Third column
$button_click13 = {Set-WallPaperHasselhoffe}
$Button13 = New-Object System.Windows.Forms.Button
$Button13.Location = New-Object System.Drawing.Size(650,150)
$Button13.Size = New-Object System.Drawing.Size(200,35)
$Button13.Text = "Set Desktop"
$Button13.Add_Click($Button_Click13)


$button_click14 = {Invoke-FakeScreenWarning}
$Button14 = New-Object System.Windows.Forms.Button
$Button14.Location = New-Object System.Drawing.Size(650,200)
$Button14.Size = New-Object System.Drawing.Size(200,35)
$Button14.Text = "Loud Warning Screen"
$Button14.Add_Click($Button_Click14)


$button_click15 = {Invoke-FakeReboot}
$Button15 = New-Object System.Windows.Forms.Button
$Button15.Location = New-Object System.Drawing.Size(650,250)
$Button15.Size = New-Object System.Drawing.Size(200,35)
$Button15.Text = "Reboot Scare"
$Button15.Add_Click($Button_Click15)


$button_click16 = {Invoke-FakeReboot2}
$Button16 = New-Object System.Windows.Forms.Button
$Button16.Location = New-Object System.Drawing.Size(650,300)
$Button16.Size = New-Object System.Drawing.Size(200,35)
$Button16.Text = "Reboot Scare #2"
$Button16.Add_Click($Button_Click16)


$button_click18 = {Set-FakeVirusScan}
$Button18 = New-Object System.Windows.Forms.Button
$Button18.Location = New-Object System.Drawing.Size(650,400)
$Button18.Size = New-Object System.Drawing.Size(200,35)
$Button18.Text = "Fake Virus Scan"
$Button18.Add_Click($Button_Click18)


$button_click17 = {New-PornShortcuts}
$Button17 = New-Object System.Windows.Forms.Button
$Button17.Location = New-Object System.Drawing.Size(650,350)
$Button17.Size = New-Object System.Drawing.Size(200,35)
$Button17.Text = "Creates Porn Dirs"
$Button17.Add_Click($Button_Click17)


$button_click26 = {Get-DefenderPayloadTests}
$Button26 = New-Object System.Windows.Forms.Button
$Button26.Location = New-Object System.Drawing.Size(650,350)
$Button26.Size = New-Object System.Drawing.Size(200,35)
$Button26.Text = "d/l Defender Payloads"
$Button26.Add_Click($Button_Click26)


#Fourth column
$button_click19 = {Invoke-ForkBomb}
$Button19 = New-Object System.Windows.Forms.Button
$Button19.Location = New-Object System.Drawing.Size(950,150)
$Button19.Size = New-Object System.Drawing.Size(200,35)
$Button19.Text = "Fork Bomb"
$Button19.Add_Click($Button_Click19)


$button_click20 = {Invoke-DesktopShortcutBomb}
$Button20 = New-Object System.Windows.Forms.Button
$Button20.Location = New-Object System.Drawing.Size(950,200)
$Button20.Size = New-Object System.Drawing.Size(200,35)
$Button20.Text = "Shortcuts Bomb"
$Button20.Add_Click($Button_Click20)


$button_click21 = {Invoke-MailBoxBomb}
$Button21 = New-Object System.Windows.Forms.Button
$Button21.Location = New-Object System.Drawing.Size(950,250)
$Button21.Size = New-Object System.Drawing.Size(200,35)
$Button21.Text = "Mailbox Bomb"
$Button21.Add_Click($Button_Click21)

$button_click23 = {Invoke-TabBomb}
$Button23 = New-Object System.Windows.Forms.Button
$Button23.Location = New-Object System.Drawing.Size(950,350)
$Button23.Size = New-Object System.Drawing.Size(200,35)
$Button23.Text = "Tabs Bomb"
$Button23.Add_Click($Button_Click23)


$button_click22 = {Invoke-ChromeBomb}
$Button22 = New-Object System.Windows.Forms.Button
$Button22.Location = New-Object System.Drawing.Size(950,300)
$Button22.Size = New-Object System.Drawing.Size(200,35)
$Button22.Text = "Chrome Tabs Bomb"
$Button22.Add_Click($Button_Click22)


$button_click24 = {Invoke-RickRoll}
$Button24 = New-Object System.Windows.Forms.Button
$Button24.Location = New-Object System.Drawing.Size(950,400)
$Button24.Size = New-Object System.Drawing.Size(200,35)
$Button24.Text = "Rick Roll"
$Button24.Add_Click($Button_Click24)


$button_click25 = {Invoke-CatFact}
$Button25 = New-Object System.Windows.Forms.Button
$Button25.Location = New-Object System.Drawing.Size(950,450)
$Button25.Size = New-Object System.Drawing.Size(200,35)
$Button25.Text = "Send Cat Facts"
$Button25.Add_Click($Button_Click25)


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
$Form.Controls.Add($Button10)
$Form.Controls.Add($Button11)
$Form.Controls.Add($Button12)
$Form.Controls.Add($Button9)

$Form.Controls.Add($Button13)
$Form.Controls.Add($Button14)
$Form.Controls.Add($Button15)
$Form.Controls.Add($Button16)
$Form.Controls.Add($Button18)
$Form.Controls.Add($Button17)
$Form.Controls.Add($Button26)

$Form.Controls.Add($Button19)
$Form.Controls.Add($Button20)
$Form.Controls.Add($Button21)
$Form.Controls.Add($Button23)
$Form.Controls.Add($Button22)
$Form.Controls.Add($Button24)
$Form.Controls.Add($Button25)

$form.showdialog()
}