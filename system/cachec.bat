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
set "T_TITLE=Limpiador de Basura del Sistema"
set "T_HEADER=      LIMPIADOR DE BASURA DEL SISTEMA"
set "T_START=[!] Limpiando archivos temporales..."
set "T_SUCCESS=EXITO: Sistema limpio."
) else (
set "T_TITLE=System Junk Cleaner"
set "T_HEADER=      SYSTEM JUNK CLEANER"
set "T_START=[!] Cleaning temporary files..."
set "T_SUCCESS=SUCCESS: System cleaned."
)

title %T_TITLE%

:: Generate ANSI Escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Color Codes
set "green=%ESC%[92m"
set "yellow=%ESC%[93m"
set "cyan=%ESC%[96m"
set "reset=%ESC%[0m"

:: --- LOGIC ---
cls
echo %cyan%==========================================%reset%
echo %T_HEADER%
echo %cyan%==========================================%reset%
echo.
echo %yellow%%T_START%%reset%

:: Temporary files
del /s /f /q %temp%*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%

:: Windows Temp
del /s /f /q %systemroot%\temp*.* >nul 2>&1
rd /s /q %systemroot%\temp >nul 2>&1
mkdir %systemroot%\temp

:: Prefetch
del /s /f /q %systemroot%\prefetch*.* >nul 2>&1

:: Recycle Bin
powershell.exe -command "Clear-RecycleBin -Force" >nul 2>&1

echo.
echo %cyan%------------------------------------------%reset%
echo %green%%T_SUCCESS%%reset%
echo %cyan%------------------------------------------%reset%
pause
exit
