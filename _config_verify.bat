@echo off

echo.
echo "   - PROXY_WINDOWS_PATH: " %PROXY_WINDOWS_PATH%
echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo.
echo "   - no_proxy : " %no_proxy%
echo.
echo "    git http.proxy + https.proxy"
echo.
git config --get http.proxy
echo.
git config --get https.proxy
echo.

echo.
PAUSE

