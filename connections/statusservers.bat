@echo off
setlocal enabledelayedexpansion
title Multi-Server Monitor

:: ==========================================================
:: CUSTOMIZATION:
:: Delete the example servers below and add your own.
:: Separate each domain or IP with a single space.
:: ==========================================================
set "servers=google.com duckduckgo.com bing.com yahoo.com exaple.local"
:: ==========================================================

:: This command creates the real ANSI Escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: ANSI Color Codes using the generated ESC character
set "green=%ESC%[92m"
set "red=%ESC%[91m"
set "reset=%ESC%[0m"

:loop
cls
echo ==========================================
echo        MULTI-SERVER STATUS MONITOR
echo ==========================================
echo Last update: !TIME:~0,8!
echo ------------------------------------------
echo.

for %%s in (%servers%) do (
    :: Ping once with 1 second timeout
    ping -n 1 -w 1000 %%s >nul 2>&1
    
    if !errorlevel! equ 0 (
        echo %green%[ ONLINE  ]%reset% %%s
    ) else (
        echo %red%[ OFFLINE ]%reset% %%s
    )
)

echo.
echo ------------------------------------------
echo Next check in 10 seconds...
timeout /t 10 /nobreak >nul
goto loop