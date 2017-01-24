#!/usr/bin/env bash

# Configura proxy para o GIT
git config --global http.proxy http://127.0.0.1:3128
git config --global https.proxy http://127.0.0.1:3128

echo "Configurados proxys para o GIT:"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Configura proxy para tudo via CLI
export HTTP_PROXY="http://127.0.0.1:3128"
export HTTPS_PROXY="http://127.0.0.1:3128"
HTTP_PROXY=http://127.0.0.1:3128
HTTPS_PROXY=http://127.0.0.1:3128

echo "Configurados proxys para tudo via CLI:"
echo "- HTTP_PROXY  $HTTP_PROXY" 
echo "- HTTPS_PROXY $HTTPS_PROXY" 
echo ""
