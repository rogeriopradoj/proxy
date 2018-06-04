#!/usr/bin/env bash

# Configura proxy para tudo via CLI
export http_proxy=http://127.0.0.1:8118
export https_proxy=$http_proxy
export all_proxy=$http_proxy
http_proxy=$http_proxy
https_proxy=$http_proxy
all_proxy=$http_proxy

echo "Configurados proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo "- all_proxy $all_proxy" 
echo ""
