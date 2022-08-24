function Restart-Explorer
{
    Stop-Process -Name "explorer" -force
}