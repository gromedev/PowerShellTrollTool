function Invoke-RedAlert {

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