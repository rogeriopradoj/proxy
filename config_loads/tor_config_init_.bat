@echo off

echo.
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
SET http_proxy=socks5://127.0.0.1:9150 >nul 2>&1
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
echo "==> set http.proxy and https.proxy git global config"
git config --global http.proxy %http_proxy%  >nul 2>&1
git config --global https.proxy %http_proxy%  >nul 2>&1
echo.
for /f %%i in ('git config --get http.proxy') do set _INIT_TEMP=%%i
echo "   - http_proxy : " %_INIT_TEMP%
for /f %%i in ('git config --get https.proxy') do set _INIT_TEMP=%%i
echo "   - https_proxy: " %_INIT_TEMP%
echo.
echo ".Ok"

echo.
PAUSE
