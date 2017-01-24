@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
REM Fecha todos os proxies

taskkill /F /FI "WindowTitle eq .==.                Inicializa cntlm              .==." /T

taskkill /F /FI "WindowTitle eq .==.                Inicializa tor              .==." /T
start %~dp0tor_stop.bat

taskkill /F /FI "WindowTitle eq .==.                Inicializa delegate              .==." /T
start %~dp0delegate_stop.bat

exit