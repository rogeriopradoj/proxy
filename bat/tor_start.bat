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
%WINDIR%\system32\TIMEOUT /T 1
%WINDIR%\system32\tasklist | %WINDIR%\system32\find "tor.exe" | %WINDIR%\system32\find /v "redirector.exe" && goto loop

endlocal
chcp %cp%>nul
