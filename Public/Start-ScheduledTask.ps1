Function Start-ScheduledTask
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