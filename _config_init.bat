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
echo "==> set HTTP_PROXY and HTTPS_PROXY environment variables"
SET HTTP_PROXY=!LOCAL_PROXY_ADDRESS! >nul 2>&1
SET HTTPS_PROXY=%HTTP_PROXY%  >nul 2>&1
setx HTTP_PROXY %HTTP_PROXY% >nul 2>&1
setx HTTPS_PROXY %HTTP_PROXY% >nul 2>&1
echo.
echo "   - HTTP_PROXY : " %HTTP_PROXY%
echo "   - HTTPS_PROXY: " %HTTPS_PROXY%
echo.
echo ".Ok"

echo.
echo "==> set NO_PROXY environment variable"
SET NO_PROXY=!CNTLM_NO_PROXY! >nul 2>&1
setx NO_PROXY %NO_PROXY% >nul 2>&1
echo.
echo "   - NO_PROXY : " %NO_PROXY%
echo.
echo ".Ok"

echo.
echo "==> set http.proxy and https.proxy git global config"
git config --global http.proxy %HTTP_PROXY%  >nul 2>&1
git config --global https.proxy %HTTP_PROXY%  >nul 2>&1
echo.
for /f %%i in ('git config --get http.proxy') do set _INIT_TEMP=%%i
echo "   - git http.proxy : " %_INIT_TEMP%
for /f %%i in ('git config --get https.proxy') do set _INIT_TEMP=%%i
echo "   - git https.proxy: " %_INIT_TEMP%
echo.
echo ".Ok"

echo.
PAUSE


:GetEnvValue
@FOR /F "tokens=2 delims==" %%a in ('find "%~1=" %ENVFILE%') do @set %~2=%%a
@goto:eof