@echo off
title System Junk Cleaner
echo ==========================================
echo           SYSTEM JUNK CLEANER
echo ==========================================
echo.
echo [!] Cleaning temporary files...

:: Temporary files
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%

:: Windows Temp
del /s /f /q %systemroot%\temp\*.* >nul 2>&1
rd /s /q %systemroot%\temp >nul 2>&1
mkdir %systemroot%\temp

:: Prefetch
del /s /f /q %systemroot%\prefetch\*.* >nul 2>&1

:: Recycle Bin
powershell.exe -command "Clear-RecycleBin -Force" >nul 2>&1

echo.
echo ------------------------------------------
echo SUCCESS: System cleaned.
echo ------------------------------------------
pause
exit