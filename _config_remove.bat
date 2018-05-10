@echo off

echo.
echo "==> unset PROXY_WINDOWS_PATH environment variable"
REG delete HKCU\Environment /F /V PROXY_WINDOWS_PATH >nul 2>&1
SET PROXY_WINDOWS_PATH=
echo.
echo ".Ok"

echo.
echo "==> unset http_proxy and https_proxy environment variables"
REG delete HKCU\Environment /F /V http_proxy >nul 2>&1
SET http_proxy=
REG delete HKCU\Environment /F /V https_proxy >nul 2>&1
SET https_proxy=
echo.
echo ".Ok"

echo.
echo "==> unset no_proxy environment variable"
REG delete HKCU\Environment /F /V no_proxy >nul 2>&1
SET no_proxy=
echo.
echo ".Ok"

echo.
echo "==> unset http.proxy and https.proxy git global config"
call git config --global --unset http.proxy >nul 2>&1
call git config --global --unset https.proxy >nul 2>&1
echo.
echo ".Ok"

echo.
PAUSE
