function Get-PSSessionScriptHistory.ps1
{
    $parms = @{
      ComputerName = "Server01"
      Name = "ITTask"
      OutTarget = "Job"
      JobName = "ITTaskJob01"
      Credential = "Domain01\Admin01"
    }
    Receive-PSSession @parms
} 