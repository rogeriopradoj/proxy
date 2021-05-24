@echo off

echo.
echo "==> unset http_proxy, https_proxy and all_proxy environment variables"
REG delete HKCU\Environment /F /V http_proxy >nul 2>&1
SET http_proxy=
REG delete HKCU\Environment /F /V https_proxy >nul 2>&1
SET https_proxy=
REG delete HKCU\Environment /F /V all_proxy >nul 2>&1
SET all_proxy=
echo.
echo ".Ok"

echo.
echo "==> unset no_proxy environment variable"
REG delete HKCU\Environment /F /V no_proxy >nul 2>&1
SET no_proxy=
echo.
echo ".Ok"

echo.
echo "   - http_proxy : " %http_proxy%
echo "   - https_proxy: " %https_proxy%
echo "   - all_proxy: " %all_proxy%
echo.
echo "   - no_proxy : " %no_proxy%
echo.

echo.
PAUSE
