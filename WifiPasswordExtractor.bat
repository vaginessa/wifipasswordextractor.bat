@echo off

echo Working...

del ssidswkeys.txt 2> nul

for /F "tokens=4*" %%i in ('netsh wlan show profiles *^| findstr /l :"SSID name"') do ( 
	
	echo ssid: %%i %%j >> ssidswkeys.txt 
	netsh wlan show profile name=%%i %%j key=clear | findstr /l :"Key Content" >> ssidswkeys.txt
	echo( >> ssidswkeys.txt
 
)

echo Finished. See 'ssidskeys.txt'

pause