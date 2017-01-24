#!/usr/bin/env bash

# Remove proxy para o GIT
git config --global --unset http.proxy
git config --global --unset https.proxy

echo "Removidos proxys para o GIT"
echo "- http.proxy  `git config --get http.proxy`" 
echo "- https.proxy `git config --get https.proxy`" 
echo ""

# Remove proxy para tudo via CLI
unset HTTP_PROXY
unset HTTPS_PROXY

echo "Removidos proxys para tudo via CLI:"
echo "- HTTP_PROXY  $HTTP_PROXY" 
echo "- HTTPS_PROXY $HTTPS_PROXY" 
echo ""
