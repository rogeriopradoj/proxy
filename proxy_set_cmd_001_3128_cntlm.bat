@echo off

setlocal EnableDelayedExpansion

set ENVFILE="%~dp0.env"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. Dica: copie o arquivo .env.example da raiz do projeto"
    goto:eof
)

call:GetEnvValue "CNTLM_NO_PROXY" CNTLM_NO_PROXY

echo.
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
set http_proxy=http://127.0.0.1:3128
set https_proxy=%http_proxy%
set all_proxy=%http_proxy%
echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo "   - all_proxy: " %all_proxy%
echo.
echo ".ok"

echo.
echo "==> set no_proxy environment variable"
SET no_proxy=!CNTLM_NO_PROXY! >nul 2>&1
setx no_proxy %no_proxy% >nul 2>&1
echo.
echo "   - no_proxy : " %no_proxy%
echo.
echo ".Ok"

echo.
goto:eof

:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('%WINDIR%\system32\find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof

:eof
rem exit
pause