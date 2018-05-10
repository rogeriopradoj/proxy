#!/usr/bin/env bash

# Configura proxy para o GIT
git config --global http.proxy socks5://127.0.0.1:9150
git config --global https.proxy socks5://127.0.0.1:9150

echo "Configurados proxies para o GIT:"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Configura proxy para tudo via CLI
export http_proxy="socks5://127.0.0.1:9150"
export https_proxy="socks5://127.0.0.1:9150"
export all_proxy="socks5://127.0.0.1:9150"
http_proxy=socks5://127.0.0.1:9150
https_proxy=socks5://127.0.0.1:9150
all_proxy=socks5://127.0.0.1:9150

echo "Configurados proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo "- all_proxy $https_proxy" 
echo ""
