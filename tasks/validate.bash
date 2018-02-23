#!/usr/bin/env bash

# Start variables validate.
function validate() {

    # Start checking the necessary parameters.
    if [ -z "${_DEPLOY_APP_SERVER_DIR}" ]; then

    out_danger "Variable _DEPLOY_APP_SERVER_DIR unset" 1;
    exit 1

    fi

    if [ -z "${_DEPLOY_SERVER}" ]; then

    out_danger "Variable _DEPLOY_SERVER unset" 1;
    exit 1

    fi

    if [ -z "${_DEPLOY_REPO_REMOTE}" ]; then

    out_danger "Variable _DEPLOY_APP_SERVER_DIR unset" 1;
    exit 1

    fi

    if [ -z "${_DEPLOY_PROJECT_DIR}" ]; then

    out_danger "Variable _DEPLOY_PROJECT_DIR unset" 1;
    exit 1

    fi
}
