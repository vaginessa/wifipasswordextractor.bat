@echo off

rem Just copy all this code and save as a .bat file and double-click to run (in Windows)
rem Creates a file called 'ssidswkeys.txt' in the same directory with all the Wifi SSIDs that the computer
rem remembers connecting to along with clear-text passwords if found.
rem Zachary Keeton August 2015 - @ZacharyKeeton.  Inspired by the work of Aditya K Sood  (adi_ks [at] secniche.org)

rem Screen text.
echo Working...

rem Delete old output file. Suppress 'file not found' errors (if first time running).
del ssidswkeys.txt 2> nul

rem Loop through known SSIDs.
rem For each ssid: log it to output file, fetch the password, write it to the file too.
for /F "tokens=4*" %%i in ('netsh wlan show profiles *^| findstr /l :"SSID name"') do ( 
	
	echo ssid: %%i %%j >> ssidswkeys.txt 
	netsh wlan show profile name=%%i %%j key=clear | findstr /l :"Key Content" >> ssidswkeys.txt
	
	rem Write blank line to output file.
	echo( >> ssidswkeys.txt
)

rem Screen text.
echo Finished. See 'ssidskeys.txt'

rem Screen text: Press any key to continue...
rem Then it will exit.
pause
