@echo off
setlocal enabledelayedexpansion
title System Power Controller

:: --- WRAPPER LOGIC ---
call :power_logic

echo.
echo ------------------------------------------
echo Process finished.
echo ------------------------------------------
pause
exit /b

:power_logic
echo ==========================================
echo           SYSTEM POWER CONTROL
echo ==========================================
echo.
echo [s] Shutdown
echo [r] Restart
echo [c] Cancel pending tasks
echo.

set /p "action=Select an option [s, r, c]: "

:: --- OPTION: CANCEL ---
if /i "!action!"=="c" (
    shutdown -a >nul 2>nul
    if !errorlevel! equ 0 (
        echo.
        echo [OK] Pending tasks cancelled.
    ) else (
        echo.
        echo [!] No pending tasks found.
    )
    goto :eof
)

:: --- SET FLAGS ---
if /i "!action!"=="s" ( set "flag=-s" & set "msg=shutdown" )
if /i "!action!"=="r" ( set "flag=-r" & set "msg=restart" )

if not defined flag (
    echo. & echo [!] Invalid option selected.
    goto :eof
)

echo.
set /p "min=Enter minutes until !msg!: "

:: Validation
set /a "test=min + 0" 2>nul
if !test! equ 0 if "!min!" neq "0" (
    echo. & echo [!] Error: Invalid number.
    goto :eof
)

set /a "sec=min * 60"

:: --- EXECUTE SYSTEM CALL ---
shutdown !flag! -t !sec!

echo.
echo ------------------------------------------
echo SUCCESS: !msg! scheduled in !min! minute(s).
echo [INFO] Windows is now handling the timer.
echo ------------------------------------------

goto :eof