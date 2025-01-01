#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'kcat-apt' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.
# For the 'kcat-apt' feature, that means the default version is 'latest'.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "validate kcat installation" which kcat
check "validate version" kcat -V

# Report result
reportResults
