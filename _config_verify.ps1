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
