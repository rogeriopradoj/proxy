@echo off

echo.
echo "==> set http_proxy, https_proxy and all_proxy environment variables"
SET http_proxy=http://127.0.0.1:8118
SET https_proxy=%http_proxy%
SET all_proxy=%http_proxy%
setx http_proxy %http_proxy%
setx https_proxy %http_proxy%
setx all_proxy %http_proxy%
echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo "   - all_proxy: " %all_proxy%
echo.
echo ".Ok"

echo.
PAUSE
