@echo off
setlocal enabledelayedexpansion

:: --- ADMIN PRIVILEGE CHECK & AUTO-ELEVATE ---
fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
echo [INFO] Requesting Administrator privileges...
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b
)

:: --- LANGUAGE DETECTION ---
set "L_CODE=en"
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\MuiCached" /v MachinePreferredUILanguages 2^>nul') do set "L_CODE=%%a"
set "L_CODE=%L_CODE:~0,2%"

:: --- TEXT DICTIONARY ---
if /i "%L_CODE%"=="es" (
set "T_TITLE=Editor de Archivo Hosts (Admin)"
set "T_HEADER=      EDITOR DE ARCHIVO HOSTS"
set "T_OK=[ OK ] Ejecutando con privilegios de Administrador."
set "T_INFO=[ INFO ] Abriendo Bloc de notas..."
set "T_FOOTER=Proceso finalizado. Archivo Hosts cerrado."
) else (
set "T_TITLE=Hosts File Editor (Admin)"
set "T_HEADER=      HOSTS FILE EDITOR"
set "T_OK=[ OK ] Running with Administrator privileges."
set "T_INFO=[ INFO ] Opening Notepad..."
set "T_FOOTER=Process finished. Hosts file closed."
)

title %T_TITLE%

:: Generate ANSI Escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Color Codes
set "green=%ESC%[92m"
set "cyan=%ESC%[96m"
set "reset=%ESC%[0m"

:: --- LOGIC ---
cls
echo %cyan%==========================================%reset%
echo %T_HEADER%
echo %cyan%==========================================%reset%
echo.
echo %green%%T_OK%%reset%
echo %T_INFO%
echo.

:: Path to the hosts file
set "hostsPath=%SystemRoot%\System32\drivers\etc\hosts"

:: Open Notepad and wait until it's closed
start /wait notepad.exe "%hostsPath%"

echo %cyan%------------------------------------------%reset%
echo %T_FOOTER%
echo %cyan%------------------------------------------%reset%
pause
exit
