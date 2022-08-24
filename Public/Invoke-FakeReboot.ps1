function Invoke-FakeReboot
{
#.AUTHOR https://raw.githubusercontent.com/Hackstur
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null
    $popuptype=[microsoft.visualbasic.msgboxstyle]::Exclamation -bor [microsoft.visualbasic.msgboxstyle]::OKOnly -bor [microsoft.visualbasic.msgboxstyle]::DefaultButton1
    $a=60
    while (1)
    {
        $a=$a-1
        $ans = [Microsoft.VisualBasic.Interaction]::MsgBox("CRITICAL ERROR REBOOTING IN ... $a"+"s",$popuptype,"Windows")
        $ans
    }
}