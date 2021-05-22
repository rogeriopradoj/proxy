echo ""
echo "==> unset PROXY_WINDOWS_PATH environment variable"
Get-Item HKCU:\Environment | Remove-ItemProperty -Name PROXY_WINDOWS_PATH -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("PROXY_WINDOWS_PATH", $null ,"User")
echo ""
echo ".Ok"

echo ""
echo "==> unset http_proxy, https_proxy and all_proxy environment variables"
Get-Item HKCU:\Environment | Remove-ItemProperty -Name http_proxy -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("http_proxy", $null ,"User")
Get-Item HKCU:\Environment | Remove-ItemProperty -Name https_proxy -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("https_proxy", $null ,"User")
Get-Item HKCU:\Environment | Remove-ItemProperty -Name all_proxy -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("all_proxy", $null ,"User")
echo ""
echo ".Ok"

echo ""
echo "==> unset no_proxy environment variable"
Get-Item HKCU:\Environment | Remove-ItemProperty -Name no_proxy -Force -ErrorAction SilentlyContinue
[Environment]::SetEnvironmentVariable("no_proxy", $null ,"User")
echo ""
echo ".Ok"

echo ""
"    - PROXY_WINDOWS_PATH:     {0}" -f [Environment]::GetEnvironmentVariable("PROXY_WINDOWS_PATH", "User")
echo ""
"    - http_proxy:     {0}" -f [Environment]::GetEnvironmentVariable("http_proxy", "User")
"    - https_proxy:     {0}" -f [Environment]::GetEnvironmentVariable("https_proxy", "User")
"    - all_proxy:     {0}" -f [Environment]::GetEnvironmentVariable("all_proxy", "User")
echo ""
"    - no_proxy:      {0}" -f [Environment]::GetEnvironmentVariable("no_proxy", "User")

echo ""
echo ""

PAUSE
