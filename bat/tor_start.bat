@echo off
title .==.                Inicializa tor              .==.
rem Inicializa tor

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

cd %~dp0..\vendor\tor
start /min "" tor.exe -f .\torrc
goto loop

:loop
TIMEOUT /T 1
tasklist | find "tor.exe" | find /v "redirector.exe" && goto loop

endlocal
chcp %cp%>nul
