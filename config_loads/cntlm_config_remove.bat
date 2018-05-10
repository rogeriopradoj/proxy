@echo off

echo.
echo "==> unset http_proxy and https_proxy environment variables"
REG delete HKCU\Environment /F /V http_proxy >nul 2>&1
REG delete HKCU\Environment /F /V https_proxy >nul 2>&1
echo.
echo ".Ok"

echo.
echo "==> unset http.proxy and https.proxy git global config"
git config --global --unset http.proxy >nul 2>&1
git config --global --unset https.proxy >nul 2>&1
echo.
echo ".Ok"

echo.
PAUSE
