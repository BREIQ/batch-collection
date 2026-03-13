@echo off
setlocal enabledelayedexpansion

:: --- LANGUAGE DETECTION ---
:: Set default language to English
set "L_CODE=en"
:: Try to fetch the system UI language from the registry
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\MuiCached" /v MachinePreferredUILanguages 2^>nul') do set "L_CODE=%%a"
:: Extract only the first two characters (e.g., "es" or "en")
set "L_CODE=%L_CODE:~0,2%"

:: --- TEXT DICTIONARY ---
if /i "%L_CODE%"=="es" (
    set "T_TITLE=Conexión SSH"
    set "T_TERM=Sesión terminada o cancelada."
    set "T_WAIT=La ventana permanecerá abierta por 24 horas."
    set "T_HEADER=      CONEXIÓN SSH"
    set "T_PROMPT_USER=Inserte nombre de usuario: "
    set "T_PROMPT_DOM=Ingrese dominio [dominio:puerto]: "
    set "T_CONN=Conectando a: !user!@!domain! en el puerto !port!..."
) else (
    set "T_TITLE=SSH Connection"
    set "T_TERM=Session terminated or cancelled."
    set "T_WAIT=Window will remain open for 24 hours."
    set "T_HEADER=      SSH CONNECTION"
    set "T_PROMPT_USER=Enter username: "
    set "T_PROMPT_DOM=Enter domain [domain:port]: "
    set "T_CONN=Connecting to: !user!@!domain! on port !port!..."
)

:: --- MAIN LOGIC ---
title %T_TITLE%
:: Set console code page to UTF-8 for special characters support
chcp 65001 > nul

:: Execute the connection logic label
call :ssh_logic

echo.
echo ------------------------------------------
echo %T_TERM%
echo %T_WAIT%
echo ------------------------------------------
:: Keep the window open for 24 hours (86400 seconds)
timeout /t 86400 /nobreak
exit /b

:ssh_logic
echo ==========================================
echo %T_HEADER%
echo ==========================================
echo.

:: Get user input using translated prompts
set /p "user=%T_PROMPT_USER%"
set /p "input=%T_PROMPT_DOM%"

:: Default port setup
set "domain=%input%"
set "port=22"

:: Check if the input contains a colon (custom port check)
echo %input% | findstr /i ":" >nul
if %errorlevel% equ 0 (
    for /f "tokens=1,2 delims=:" %%a in ("%input%") do (
        set "domain=%%a"
        set "port=%%b"
    )
)

echo.
echo ------------------------------------------
echo %T_CONN%
echo ------------------------------------------
echo.

:: Execute SSH command with parsed variables
ssh !user!@!domain! -p !port!
goto :eof
