#!/usr/bin/env bash
set -e

APT_PKGS=(git curl wget python3 python3-pip python3-venv build-essential)
GO_TOOLS=(
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
    "github.com/ffuf/ffuf@latest"
    "github.com/tomnomnom/assetfinder@latest"
)

# install apt packages
sudo apt-get update
for pkg in "${APT_PKGS[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        sudo apt-get install -y "$pkg"
    fi
done

# ensure GOPATH
if ! command -v go >/dev/null 2>&1; then
    echo "Go is required but not installed." >&2
    exit 1
fi

for tool in "${GO_TOOLS[@]}"; do
    go install "$tool"
done

echo "Tools installation completed."
