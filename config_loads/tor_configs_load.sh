#!/usr/bin/env bash

# Configura proxy para o GIT
git config --global http.proxy socks5://127.0.0.1:9150
git config --global https.proxy socks5://127.0.0.1:9150

echo "Configurados proxys para o GIT:"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Configura proxy para tudo via CLI
export HTTP_PROXY="socks5://127.0.0.1:9150"
export HTTPS_PROXY="socks5://127.0.0.1:9150"
HTTP_PROXY=socks5://127.0.0.1:9150
HTTPS_PROXY=socks5://127.0.0.1:9150

echo "Configurados proxys para tudo via CLI:"
echo "- HTTP_PROXY  $HTTP_PROXY" 
echo "- HTTPS_PROXY $HTTPS_PROXY" 
echo ""
