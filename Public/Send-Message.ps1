function Send-Message 
{
.AUTHOR
    $Message = Read-Host "Boo! Type your message"
    msg.exe * $Message
}