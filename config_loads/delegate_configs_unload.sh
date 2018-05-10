#!/usr/bin/env bash

# Remove proxy para tudo via CLI
unset http_proxy
unset https_proxy
unset all_proxy

echo "Removidos proxies para tudo via CLI:"
echo "- http_proxy  $http_proxy" 
echo "- https_proxy $https_proxy" 
echo "- all_proxy $all_proxy" 
echo ""
