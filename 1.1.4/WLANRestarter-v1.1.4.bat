::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBdRQguUM1eeA6YX/Ofr08yOrkgOaPU2foaV07eBQA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBdRQguUM1eeA6YX/Ofr092rg2MvUfEreZ3P36bDNrFduwuwO5M10xo=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] WLANRestarter By ÑÓÊ±qwq
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
set /a COUNT=COUNT+1
echo [%time:~0,2%:%time:~3,2%:%time:~6,2% INFO] Ping to router 192.168.1.1 ^(Count=%COUNT%^)...
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
	goto :looplog
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