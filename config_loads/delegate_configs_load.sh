#!/usr/bin/env bash

# Configura proxy para o GIT
git config --global http.proxy http://127.0.0.1:8118
git config --global https.proxy http://127.0.0.1:8118

echo "Configurados proxies para o GIT:"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Configura proxy para tudo via CLI
export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"
export all_proxy="http://127.0.0.1:8118"
http_proxy=http://127.0.0.1:8118
https_proxy=http://127.0.0.1:8118
all_proxy=http://127.0.0.1:8118

echo "Configurados proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo "- all_proxy $all_proxy" 
echo ""
