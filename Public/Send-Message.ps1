function Send-Message 
{
    Add-Type -AssemblyName Microsoft.VisualBasic
    $Message = [Microsoft.VisualBasic.Interaction]::InputBox("Enter your message", "Message", "$Message")
    write-host $Message
    msg.exe * $Message
}