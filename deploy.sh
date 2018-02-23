#!/usr/bin/env bash

set -o errexit # Make your script exit when a command fails
set -o pipefail # Exit status of the last command that threw a non-zero exit code is returned
set -o nounset # Exit when your script tries to use undeclared variables

# Importing configurations.
_DEPLOY_CONFIG_FILE="inc/config.bash"

# Check if configuration file was included.
if [ ! -f "${_DEPLOY_CONFIG_FILE}" ]; then
    echo "Setup the configuration file before start ${_DEPLOY_CONFIG_FILE}: cp inc/config.bash.dist inc/config.bash"
    exit 1
fi

# Load defined settings.
source inc/config.bash

# Load response messages.
source inc/messages.bash

# Load Bootstrap file.
source inc/bootstrap.bash

# Instance Bootstrap function.
bootstrap_core

# Start variables validate.
validate

# Generate and push TAG.
mapping
