@echo off
title Hosts File Editor (Admin)

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

:: --- LOGIC ---
echo ==========================================
echo           HOSTS FILE EDITOR
echo ==========================================
echo.
echo [OK] Running with Administrator privileges.
echo [INFO] Opening Notepad...
echo.

:: Path to the hosts file
set "hostsPath=%SystemRoot%\System32\drivers\etc\hosts"

:: Open Notepad and wait until it's closed
start /wait notepad.exe "%hostsPath%"

echo ------------------------------------------
echo Process finished. Hosts file closed.
echo ------------------------------------------
pause
exit