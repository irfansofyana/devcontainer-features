#!/bin/bash -i

set -e
source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.29"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.4" \
    --option packages='curl,ca-certificates'

# Get the version from the options, defaulting to "latest"
VERSION=${VERSION:-"latest"}

if [[ "$VERSION" == "latest" ]]; then
    LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
else
    # Validate if the specified version exists
    if curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/tags/v$VERSION" | grep -q '"message": "Not Found"'; then
        echo "Version $VERSION does not exist."
        exit 1
    fi
    LAZYDOCKER_VERSION=$VERSION
fi

if [[ $(uname -m) == "x86_64" ]]; then
    curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/v${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
elif [[ $(uname -m) == "aarch64" ]]; then
    curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/v${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION}_Linux_arm64.tar.gz"
else
    echo "Unsupported architecture"
    exit 1
fi

tar xf lazydocker.tar.gz lazydocker
install lazydocker /usr/local/bin