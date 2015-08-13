@echo off

rem Creates a file called 'ssidswkeys.txt' in the same directory with all the Wifi SSIDs that the computer
rem remembers connecting to along with clear-text passwords if found.
rem Zachary Keeton August 2015 - @ZacharyKeeton.  Inspired by the work of Aditya K Sood  (adi_ks [at] secniche.org)

echo Working...

del ssidswkeys.txt 2> nul

for /F "tokens=4*" %%i in ('netsh wlan show profiles *^| findstr /l :"SSID name"') do ( 
	
	echo ssid: %%i %%j >> ssidswkeys.txt 
	netsh wlan show profile name=%%i %%j key=clear | findstr /l :"Key Content" >> ssidswkeys.txt
	echo( >> ssidswkeys.txt
)

echo Finished. See 'ssidskeys.txt'

pause