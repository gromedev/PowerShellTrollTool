#.AUTHOR https://raw.githubusercontent.com/Hackstur
function Enable-RotateDisplay
{
    $WScript = New-Object -com wscript.shell;
    $WScript.SendKeys("^%{LEFT}")
}