@echo off

echo.
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
SET http_proxy=http://127.0.0.1:8118 >nul 2>&1
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
PAUSE
