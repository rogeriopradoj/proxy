echo ""
echo "==> unset PROXY_WINDOWS_PATH environment variable"
Get-Item HKCU:\Environment | Remove-ItemProperty -Name PROXY_WINDOWS_PATH -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("PROXY_WINDOWS_PATH", $null ,"User")
echo ""
echo ".Ok"

PAUSE
