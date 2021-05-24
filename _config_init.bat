@echo off

setlocal EnableDelayedExpansion

set ENVFILE="%~dp0.env"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
    goto:eof
)

call:GetEnvValue "CNTLM_NO_PROXY" CNTLM_NO_PROXY
call:GetEnvValue "CNTLM_LISTEN" CNTLM_LISTEN
call:GetEnvValue "CNTLM_PROXY" CNTLM_PROXY
call:GetEnvValue "LOCAL_PROXY_ADDRESS" LOCAL_PROXY_ADDRESS

echo.
echo "==> set PROXY_WINDOWS_PATH environment variable"
SET PROXY_WINDOWS_PATH=%~dp0 >nul 2>&1
setx PROXY_WINDOWS_PATH %PROXY_WINDOWS_PATH% >nul 2>&1
echo.
echo "   - PROXY_WINDOWS_PATH: " %PROXY_WINDOWS_PATH%
echo.
echo ".Ok"

echo.
PAUSE
goto:eof

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('%WINDIR%\system32\find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof

:eof
rem exit
pause