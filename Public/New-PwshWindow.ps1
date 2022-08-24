function New-PwshWindow 
{
    <#  Start-Process -Verb RunAs powershell @"
    -NoExit -Command  "msg.exe * hello"
    "@
    #>

    <#https://stackoverflow.com/questions/44981177/run-powershell-custom-function-in-new-window

    $func = (Get-Command -Type Function Check-PC)
    $wholeFuncDef = 'Function ' + $func.Name + " {`n" + $func.Definition + "`n}"

    Start-Process powershell -args '-noprofile', '-noexit', '-EncodedCommand', `
    ([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("$wholeFuncDef; Check-PC")))
    #>

    <#
    $func = (Get-Command -Type Function Send-Message)
    $wholeFuncDef = 'Function ' + $func.Name + " {`n" + $func.Definition + "`n}"

    Start-Process powershell -args '-noprofile', '-noexit', '-EncodedCommand', `
    ([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("$wholeFuncDef; Send-Message")))
    #>

    <#
    Invoke-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    $Message = Read-Host "Boo! Type your message"
    msg.exe * $Message
    #>
<#
    $func = (Get-Command -Type Function Send-Message)
    $wholeFuncDef = 'Function ' + $func.Name + " {`n" + $func.Definition + "`n}"

    Invoke-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -args '-noprofile', '-noexit', '-EncodedCommand', `
    ([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("$wholeFuncDef; Send-Message")))
#>
$func = ""
$ENCODED = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($cmd))
Write-Output $ENCODED

}
