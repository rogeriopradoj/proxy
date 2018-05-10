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
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
SET http_proxy=!LOCAL_PROXY_ADDRESS! >nul 2>&1
SET https_proxy=%http_proxy%  >nul 2>&1
SET all_proxy=%http_proxy%  >nul 2>&1
setx http_proxy %http_proxy% >nul 2>&1
setx https_proxy %http_proxy% >nul 2>&1
setx all_proxy %http_proxy% >nul 2>&1
echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo "   - all_proxy: " %all_proxy%
echo.
echo ".Ok"

echo.
echo "==> set no_proxy environment variable"
SET no_proxy=!CNTLM_NO_PROXY! >nul 2>&1
setx no_proxy %no_proxy% >nul 2>&1
echo.
echo "   - no_proxy : " %no_proxy%
echo.
echo ".Ok"

echo.
PAUSE


:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof