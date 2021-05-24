@echo off

echo.
echo "==> unset PROXY_WINDOWS_PATH environment variable"
REG delete HKCU\Environment /F /V PROXY_WINDOWS_PATH >nul 2>&1
SET PROXY_WINDOWS_PATH=
echo.
echo ".Ok"

echo.
PAUSE
