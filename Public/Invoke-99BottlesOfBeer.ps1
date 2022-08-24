Function Invoke-99BottlesOfBeer
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $result = [System.Windows.Forms.MessageBox]::Show('Warning: This script is EXTREMELY loud and annoying. Are you sure you want to piss off your co-workers?' , "99 Bottles of Beer on the Wall!" , 4)
    
    if ($result -eq 'Yes') {
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        foreach ($total in 99..1) {
            if ($total -ne 1) {
                $Words = "$total bottles of beer on the wall, $total bottles of beer. Take one down and pass it around, $($total - 1)  bottles of beer on the wall."
                }
            else {
                $Words = "$total bottle of beer on the wall, $total bottles of beer. Take one down and pass it around, no more bottles of beer on the wall."
                 }
            $speak.Speak($Words)
        }
    }
}