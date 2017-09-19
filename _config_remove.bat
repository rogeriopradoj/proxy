@echo off

echo.
echo "==> unset PROXY_WINDOWS_PATH environment variable"
REG delete HKCU\Environment /F /V PROXY_WINDOWS_PATH >nul 2>&1
SET PROXY_WINDOWS_PATH=
echo.
echo ".Ok"

echo.
echo "==> unset HTTP_PROXY and HTTPS_PROXY environment variables"
REG delete HKCU\Environment /F /V HTTP_PROXY >nul 2>&1
SET HTTP_PROXY=
REG delete HKCU\Environment /F /V HTTPS_PROXY >nul 2>&1
SET HTTPS_PROXY=
echo.
echo ".Ok"

echo.
echo "==> unset NO_PROXY environment variable"
REG delete HKCU\Environment /F /V NO_PROXY >nul 2>&1
SET NO_PROXY=
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
