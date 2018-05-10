#!/usr/bin/env bash

# Remove proxy para o GIT
git config --global --unset http.proxy
git config --global --unset https.proxy

echo "Removidos proxies para o GIT"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Remove proxy para tudo via CLI
unset http_proxy
unset https_proxy
unset all_proxy

echo "Removidos proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo "- all_proxy $https_proxy" 
echo ""
