#!/bin/bash

set -e

# Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "validate kcat installation" which kcat
check "validate version" kcat -V | grep "1.6.0"

# Report result
reportResults
