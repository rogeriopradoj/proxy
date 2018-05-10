#!/usr/bin/env bash

# Configura proxy para o GIT
git config --global http.proxy http://127.0.0.1:3128
git config --global https.proxy http://127.0.0.1:3128

echo "Configurados proxys para o GIT:"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Configura proxy para tudo via CLI
export http_proxy="http://127.0.0.1:3128"
export https_proxy="http://127.0.0.1:3128"
http_proxy=http://127.0.0.1:3128
https_proxy=http://127.0.0.1:3128

echo "Configurados proxys para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo ""
