function Set-FakeVirusScan
{
#.DESCRIPTION Displays a cmd window to fool a user into waiting for antivirus definitions to update. Finishes update at 69 and 420 %.

#.AUTHOR https://raw.githubusercontent.com/kaburkett

cmd.exe
echo off
echo ****************************************************************
echo ****************************************************************
echo *********     SEMANTIC ANTIVIRUS: UPDATING DEFINITIONS      ****
echo ****************************************************************
echo ****************************************************************
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 10 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 20 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 30 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 40 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 50 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 60 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 69 percent complete.
TIMEOUT /T 5 /NOBREAK > null
echo Updating . . 420 percent complete. Applying new definitions. . . 
TIMEOUT /T 5 > null
}