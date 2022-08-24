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