rem@echo off
title .==.                Inicializa delegate              .==.
rem Inicializa delegate

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

cd %~dp0..\vendor\delegate
bin\con32-dg9_9_13.exe -f -P0.0.0.0:8118 SERVER=http SOCKS=127.0.0.1:9150 ADMIN="local@localhost.com"

endlocal
chcp %cp%>nul
