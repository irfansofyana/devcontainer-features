#!/bin/sh
set -e

# Check for apt-get
if ! type apt-get >/dev/null 2>&1; then
    echo "ERROR: apt-get not found. This feature is only supported on Debian/Ubuntu-based systems."
    exit 1
fi

# Function to check and install packages
check_package_and_install() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt-get update -y
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Install kafkacat and create kcat symlink
if [ "${VERSION}" != "latest" ]; then
    echo "Installing kafkacat version ${VERSION}..."
    check_package_and_install kafkacat="${VERSION}"
else
    echo "Installing latest version of kafkacat..."
    check_package_and_install kafkacat
fi

# Create symlink from kafkacat to kcat for consistency
if [ ! -e "/usr/bin/kcat" ] && [ -e "/usr/bin/kafkacat" ]; then
    ln -s /usr/bin/kafkacat /usr/bin/kcat
fi

# Clean up apt cache
rm -rf /var/lib/apt/lists/*
