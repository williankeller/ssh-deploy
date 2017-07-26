#!/usr/bin/env bash

# Importing configurations.
_DEPLOY_CONFIG_FILE="deploy.config.bash"

# Check if configuration file was included.
if [ -f "${_DEPLOY_CONFIG_FILE}" ]; then

  source deploy.config.bash

  # Start checking the necessary parameters.
  if [ -z "${_DEPLOY_APP_SERVER_DIR}" ]; then

    echo "Variable _DEPLOY_APP_SERVER_DIR unset"; exit;

  fi

  if [ -z "${_DEPLOY_SERVER}" ]; then

    echo "Variable _DEPLOY_SERVER unset"; exit;

  fi

  if [ -z "${_DEPLOY_REPO_REMOTE}" ]; then

    echo "Variable _DEPLOY_APP_SERVER_DIR unset"; exit;

  fi

  if [ -z "${_DEPLOY_PROJECT_DIR}" ]; then

    echo "Variable _DEPLOY_PROJECT_DIR unset"; exit;

  fi

  _DEPLOY_TAG=${1:-}

  if [ -z "${_DEPLOY_TAG}" ]; then

    _DEPLOY_TAG=$(echo "release-$(date +%Y-%m-%d)")

    _DEPLOY_GIT_IN_REPO="git -C ${_DEPLOY_PROJECT_DIR}"

    _DEPLOY_TAG_NUMBER=$(${_DEPLOY_GIT_IN_REPO} tag --list | grep ${_DEPLOY_TAG} | wc -l)

    if [ "${_DEPLOY_TAG_NUMBER}" -gt 0 ]; then

      _DEPLOY_TAG="${_DEPLOY_TAG}.${_DEPLOY_TAG_NUMBER}"

    fi

    ${_DEPLOY_GIT_IN_REPO} tag ${_DEPLOY_TAG}

    ${_DEPLOY_GIT_IN_REPO} push -u ${_DEPLOY_REPO_REMOTE} ${_DEPLOY_TAG}

  fi

  ssh ${_DEPLOY_SERVER} "cd ${_DEPLOY_APP_SERVER_DIR} && git pull && git checkout ${_DEPLOY_TAG}"

else

  echo "Setupe the configuration file before start ${_DEPLOY_CONFIG_FILE}: cp deploy.config.bash.dist deploy.config.bash"

fi
