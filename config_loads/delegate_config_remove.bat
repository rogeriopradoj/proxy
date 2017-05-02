@echo off

echo.
echo "==> unset HTTP_PROXY and HTTPS_PROXY environment variables"
REG delete HKCU\Environment /F /V HTTP_PROXY >nul 2>&1
REG delete HKCU\Environment /F /V HTTPS_PROXY >nul 2>&1
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
