#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'lazydocker' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "validate lazydocker installation" which lazydocker
check "validate version" lazydocker --version

# Report result
reportResults
