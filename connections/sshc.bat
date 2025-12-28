@echo off
setlocal enabledelayedexpansion
title SSH Connection

:: --- WRAPPER LOGIC ---
:: We call a internal label to handle the connection. 
:: This way, if SSH is interrupted, we return here instead of closing.
call :ssh_logic

echo.
echo ------------------------------------------
echo Session terminated or cancelled. 
echo Window will remain open for 24 hours.
echo ------------------------------------------
timeout /t 86400 /nobreak
exit /b

:ssh_logic
echo ==========================================
echo           SSH CONNECTION
echo ==========================================
echo.

set /p "user=Enter username (e.g., root): "
set /p "input=Enter domain [domain:port]: "

set "domain=%input%"
set "port=22"

echo %input% | findstr /i ":" >nul
if %errorlevel% equ 0 (
    for /f "tokens=1,2 delims=:" %%a in ("%input%") do (
        set "domain=%%a"
        set "port=%%b"
    )
)

echo.
echo ------------------------------------------
echo Connecting to: !user!@!domain! on port !port!...
echo ------------------------------------------
echo.

:: Execute SSH
ssh !user!@!domain! -p !port!
goto :eof