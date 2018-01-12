@echo off

echo.
echo "   - PROXY_WINDOWS_PATH: " %PROXY_WINDOWS_PATH%
echo.
echo "   - HTTP_PROXY : " %HTTP_PROXY%
echo "   - HTTPS_PROXY: " %HTTPS_PROXY%
echo.
echo "   - NO_PROXY : " %NO_PROXY%
echo.
echo "    git http.proxy + https.proxy"
echo.
git config --get http.proxy
echo.
git config --get https.proxy
echo.

echo.
PAUSE

