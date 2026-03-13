@echo off
setlocal enabledelayedexpansion

:: --- LANGUAGE DETECTION ---
set "L_CODE=en"
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\MuiCached" /v MachinePreferredUILanguages 2^>nul') do (
set "TMP_LANG=%%a"
set "L_CODE=!TMP_LANG:~0,2!"
)

:: --- TEXT DICTIONARY ---
if /i "!L_CODE!"=="es" (
set "T_TITLE=Control de Energia del Sistema"
set "T_HEADER=      CONTROL DE ENERGIA DEL SISTEMA"
set "T_OPT_S=[s] Apagar"
set "T_OPT_R=[r] Reiniciar"
set "T_OPT_C=[c] Cancelar tareas pendientes"
set "T_SELECT=Selecciona una opcion [s, r, c]: "
set "T_CANCEL_OK=[OK] Tareas pendientes canceladas."
set "T_CANCEL_NO=[!] No hay tareas pendientes."
set "T_INVALID=[!] Opcion invalida seleccionada."
set "T_PROMPT=Ingresa los minutos para !msg!: "
set "T_ERR_NUM=[!] Error: Numero invalido."
set "T_SUCCESS=EXITO: !msg! programado en !min! minuto(s)."
set "T_INFO=[INFO] Windows esta gestionando el temporizador."
set "T_FOOTER=Proceso finalizado."
set "M_SHUT=apagar"
set "M_REST=reiniciar"
) else (
set "T_TITLE=System Power Controller"
set "T_HEADER=      SYSTEM POWER CONTROL"
set "T_OPT_S=[s] Shutdown"
set "T_OPT_R=[r] Restart"
set "T_OPT_C=[c] Cancel pending tasks"
set "T_SELECT=Select an option [s, r, c]: "
set "T_CANCEL_OK=[OK] Pending tasks cancelled."
set "T_CANCEL_NO=[!] No pending tasks found."
set "T_INVALID=[!] Invalid option selected."
set "T_PROMPT=Enter minutes until !msg!: "
set "T_ERR_NUM=[!] Error: Invalid number."
set "T_SUCCESS=SUCCESS: !msg! scheduled in !min! minute(s)."
set "T_INFO=[INFO] Windows is now handling the timer."
set "T_FOOTER=Process finished."
set "M_SHUT=shutdown"
set "M_REST=restart"
)

title !T_TITLE!

:: Generate ANSI Escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Color Codes
set "green=%ESC%[92m"
set "red=%ESC%[91m"
set "yellow=%ESC%[93m"
set "cyan=%ESC%[96m"
set "reset=%ESC%[0m"

:: --- WRAPPER LOGIC ---
call :power_logic

echo.
echo %cyan%------------------------------------------%reset%
echo !T_FOOTER!
echo %cyan%------------------------------------------%reset%
pause
exit /b

:power_logic
cls
echo %cyan%==========================================%reset%
echo !T_HEADER!
echo %cyan%==========================================%reset%
echo.
echo !T_OPT_S!
echo !T_OPT_R!
echo !T_OPT_C!
echo.

set /p "action=!T_SELECT!"

:: --- OPTION: CANCEL ---
if /i "!action!"=="c" (
shutdown -a >nul 2>nul
if !errorlevel! equ 0 (
echo.
echo %green%!T_CANCEL_OK!%reset%
) else (
echo.
echo %yellow%!T_CANCEL_NO!%reset%
)
goto :eof
)

:: --- SET FLAGS ---
if /i "!action!"=="s" ( set "flag=-s" & set "msg=!M_SHUT!" )
if /i "!action!"=="r" ( set "flag=-r" & set "msg=!M_REST!" )

if not defined flag (
echo. & echo %red%!T_INVALID!%reset%
goto :eof
)

echo.
set /p "min=!T_PROMPT!"

:: Validation
set /a "test=min + 0" 2>nul
if !test! equ 0 if "!min!" neq "0" (
echo. & echo %red%!T_ERR_NUM!%reset%
goto :eof
)

set /a "sec=min * 60"

:: --- EXECUTE SYSTEM CALL ---
shutdown !flag! -t !sec!

echo.
echo %cyan%------------------------------------------%reset%
echo %green%!T_SUCCESS!%reset%
echo %yellow%!T_INFO!%reset%
echo %cyan%------------------------------------------%reset%

goto :eof
