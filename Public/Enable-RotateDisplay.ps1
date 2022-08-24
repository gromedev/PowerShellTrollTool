function Enable-RotateDisplay
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    $WScript = New-Object -com wscript.shell;
    $WScript.SendKeys("^%{LEFT}")
}