#!/usr/bin/env bash

# Configura proxy para tudo via CLI
export http_proxy="http://127.0.0.1:3128"
export https_proxy="http://127.0.0.1:3128"
export all_proxy="http://127.0.0.1:3128"
http_proxy=http://127.0.0.1:3128
https_proxy=http://127.0.0.1:3128
all_proxy=http://127.0.0.1:3128

echo "Configurados proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy"
echo "- https_proxy $https_proxy"
echo "- all_proxy $all_proxy"
echo ""
