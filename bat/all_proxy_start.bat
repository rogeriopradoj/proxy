@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
REM Inicia todos os proxies

start %~dp0cntlm_start.bat -y
start /min %~dp0tor_start.bat
start /min %~dp0delegate_start.bat

exit