@echo off
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLANRestarter By 延时qwq
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Process running at [%date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%].
echo.
set LOGFILE=WLAN.%date:~0,4%.%date:~5,2%.%date:~8,2%.log
set COUNT=0
if "%1" == "-log" (
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Log enabled.
	echo. >> %LOGFILE%
	echo. >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Process running at [%date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%]. >> %LOGFILE%
	echo. >> %LOGFILE%
	goto :looplog
)
:loop
set /a COUNT=COUNT+1
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to router 192.168.1.1 ^(Count=%COUNT%^)...
ping 192.168.1.1 -n 1 > nul
ping 192.168.1.1 -n 1 > nul
if "%ERRORLEVEL%" == "1" (
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% ERROR] FAILED to ping router 192.168.1.1
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to test server www.bilibili.com ...
	ping www.bilibili.com -n 1 > nul
    ping www.bilibili.com -n 1 > nul
	if "%ERRORLEVEL%"=="1" (
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% FATAL] FAILED to ping test server www.bilibili.com
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Shutting down WLAN... 
		netsh interface set interface "WLAN 3" disabled > nul
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Done.
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Starting WLAN...
		netsh interface set interface "WLAN 3" enabled > nul
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLAN Restarted.
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Waiting for WLAN Setting...
		call :loopping
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] OK.
		goto :loop
	)
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] OK.
	goto :loop
)
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Success.
timeout 3 > nul
goto :loop

:looplog
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to router 192.168.1.1 ^(Count=%COUNT%^)... >> %LOGFILE%
ping 192.168.1.1 -n 1 > nul
ping 192.168.1.1 -n 1 > nul
if "%ERRORLEVEL%"=="1" (
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% ERROR] FAILED to ping router 192.168.1.1 >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% ERROR] FAILED to ping router 192.168.1.1.
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to test server www.bilibili.com... >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to test server www.bilibili.com...
	ping www.bilibili.com -n 1 > nul
    	ping www.bilibili.com -n 1 > nul
	if "%ERRORLEVEL%"=="1" (
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% FATAL] FAILED to ping test server www.bilibili.com. >> %LOGFILE%
		echo [%time:~0,2%:%time:~3,2%:%time:~6,2% FATAL] FAILED to ping test server www.bilibili.com.
	)
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Shutting down WLAN...  >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Shutting down WLAN...
	netsh interface set interface "WLAN 3" disabled>nul
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Done. >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Done.
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Starting WLAN... >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% WARN] Starting WLAN...
	netsh interface set interface "WLAN 3" enabled>nul
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLAN Restarted. >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLAN Restarted.
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Waiting for WLAN Setting... >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Waiting for WLAN Setting...
	call :loopping >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] OK. >> %LOGFILE%
	echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] OK.
	goto :loop
)
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Success. >> %LOGFILE%
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Success.
timeout 3 > nul
goto :looplog

:loopping
ping -n 1 192.168.1.1 > nul
if "%ERRORLEVEL%"=="1" goto :loopping
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Setting is OK, waiting WLAN...
:loopping2
ping -n 1 www.bilibili.com > nul
if "%ERRORLEVEL%"=="1" goto :loopping2
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLAN is OK.
timeout /nobreak 3 > nul