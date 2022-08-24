Function Send-VoiceMessage([string]$customVoiceMessage)
{
    $customVoiceMessage = Read-Host "Type your message here"
    Add-Type -AssemblyName System.speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak($customVoiceMessage)
}