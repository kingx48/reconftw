#!/usr/bin/env bash
set -e

MISSING=()
for cmd in httpx subfinder nuclei ffuf assetfinder; do
    if ! command -v $cmd >/dev/null 2>&1; then
        MISSING+=("$cmd")
    fi
done

if [ ${#MISSING[@]} -ne 0 ]; then
    echo "Missing tools: ${MISSING[*]}"
    read -p "Do you want to install them now? (y/n) " ans
    if [[ $ans == [yY]* ]]; then
        ./install-advanced-tools.sh
    fi
else
    echo "All tools appear to be installed."
fi
