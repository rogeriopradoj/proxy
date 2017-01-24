@echo off

echo.
echo "==> set HTTP_PROXY and HTTPS_PROXY environment variables"
SET HTTP_PROXY=http://127.0.0.1:8118 >nul 2>&1
SET HTTPS_PROXY=%HTTP_PROXY%  >nul 2>&1
setx HTTP_PROXY %HTTP_PROXY% >nul 2>&1
setx HTTPS_PROXY %HTTP_PROXY% >nul 2>&1
echo.
echo "   - HTTP_PROXY : " %HTTP_PROXY%
echo "   - HTTPS_PROXY: " %HTTPS_PROXY%
echo.
echo ".Ok"

echo.
echo "==> set http.proxy and https.proxy git global config"
git config --global http.proxy %HTTP_PROXY%  >nul 2>&1
git config --global https.proxy %HTTP_PROXY%  >nul 2>&1
echo.
for /f %%i in ('git config --get http.proxy') do set _INIT_TEMP=%%i
echo "   - HTTP_PROXY : " %_INIT_TEMP%
for /f %%i in ('git config --get https.proxy') do set _INIT_TEMP=%%i
echo "   - HTTPS_PROXY: " %_INIT_TEMP%
echo.
echo ".Ok"

echo.
PAUSE
