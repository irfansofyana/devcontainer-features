#!/bin/bash

set -e

# Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "validate lazydocker installation" which lazydocker
check "validate lazydocker version" lazydocker --version | grep "0.23.0"

# Report result
reportResults
