function New-PwshWindow 
{
  <#  Start-Process -Verb RunAs powershell @"
    -NoExit -Command  "msg.exe * hello"
    "@
    #>
}
