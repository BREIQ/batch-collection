@echo off
setlocal enabledelayedexpansion

:: --- LANGUAGE DETECTION ---
set "L_CODE=en"
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\MuiCached" /v MachinePreferredUILanguages 2^>nul') do set "L_CODE=%%a"
set "L_CODE=%L_CODE:~0,2%"

:: --- TEXT DICTIONARY ---
if /i "%L_CODE%"=="es" (
set "T_TITLE=Monitor de Servidores"
set "T_HEADER=      MONITOR DE SERVIDORES"
set "T_UPDATE=Ultima actualizacion:"
set "T_NEXT=Proxima revision en 10 segundos..."
set "T_ONLINE=[ EN LINEA ]"
set "T_OFFLINE=[ CAIDO    ]"
) else (
set "T_TITLE=Multi-Server Monitor"
set "T_HEADER=      MULTI-SERVER STATUS MONITOR"
set "T_UPDATE=Last update:"
set "T_NEXT=Next check in 10 seconds..."
set "T_ONLINE=[ ONLINE   ]"
set "T_OFFLINE=[ OFFLINE  ]"
)

title %T_TITLE%

:: --- SERVER LIST ---
set "servers=google.com duckduckgo.com bing.com yahoo.com example.local"

:: Generate ANSI Escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Color Codes
set "green=%ESC%[92m"
set "red=%ESC%[91m"
set "reset=%ESC%[0m"

:loop
cls
echo ==========================================
echo %T_HEADER%
echo ==========================================
echo %T_UPDATE% !TIME:~0,8!
echo ------------------------------------------
echo.

for %%s in (%servers%) do (
ping -n 1 -w 1000 %%s >nul 2>&1
if !errorlevel! equ 0 (
echo %green%%T_ONLINE%%reset% %%s
) else (
echo %red%%T_OFFLINE%%reset% %%s
)
)

echo.
echo ------------------------------------------
echo %T_NEXT%
timeout /t 10 /nobreak >nul
goto loop
