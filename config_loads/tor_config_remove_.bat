@echo off

echo.
echo "==> unset http_proxy, https_proxy and all_proxy environment variables"
REG delete HKCU\Environment /F /V http_proxy >nul 2>&1
REG delete HKCU\Environment /F /V https_proxy >nul 2>&1
REG delete HKCU\Environment /F /V all_proxy >nul 2>&1
echo.
echo ".Ok"

echo.
PAUSE
