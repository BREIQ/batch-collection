@echo off
setlocal enabledelayedexpansion

:: --- LANGUAGE DETECTION ---
set "L_CODE=en"
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\MuiCached" /v MachinePreferredUILanguages 2^>nul') do set "L_CODE=%%a"
set "L_CODE=%L_CODE:~0,2%"

:: --- TEXT DICTIONARY ---
if /i "%L_CODE%"=="es" (
set "T_TITLE=Conexion SSH"
set "T_TERM=Sesion terminada o cancelada."
set "T_WAIT=La ventana permanecera abierta por 24 horas."
set "T_HEADER=      CONEXION SSH"
set "T_PROMPT_USER=Ingrese nombre de usuario: "
set "T_PROMPT_DOM=Ingrese dominio [dominio:puerto]: "
set "T_CONN=Conectando a: "
set "T_CONN2= en el puerto "
) else (
set "T_TITLE=SSH Connection"
set "T_TERM=Session terminated or cancelled."
set "T_WAIT=Window will remain open for 24 hours."
set "T_HEADER=      SSH CONNECTION"
set "T_PROMPT_USER=Enter username: "
set "T_PROMPT_DOM=Enter domain [domain:port]: "
set "T_CONN=Connecting to: "
set "T_CONN2= on port "
)

:: --- ANSI COLORS ---
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"
set "green=%ESC%[92m"
set "yellow=%ESC%[93m"
set "cyan=%ESC%[96m"
set "red=%ESC%[91m"
set "reset=%ESC%[0m"

:: --- MAIN LOGIC ---
title %T_TITLE%

call :ssh_logic

echo.
echo %cyan%------------------------------------------%reset%
echo %yellow%%T_TERM%%reset%
echo %T_WAIT%
echo %cyan%------------------------------------------%reset%
timeout /t 86400 /nobreak
exit /b

:ssh_logic
cls
echo %cyan%==========================================%reset%
echo %T_HEADER%
echo %cyan%==========================================%reset%
echo.

set /p "user=%T_PROMPT_USER%"
set /p "input=%T_PROMPT_DOM%"

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
echo %cyan%------------------------------------------%reset%
echo %green%%T_CONN%!domain!%T_CONN2%!port!%reset%
echo %cyan%------------------------------------------%reset%
echo.

ssh !user!@!domain! -p !port!
goto :eof
