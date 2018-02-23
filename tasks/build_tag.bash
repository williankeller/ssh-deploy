#!/usr/bin/env bash

# Generate and push TAG.
function build_tag() {

    _DEPLOY_TAG=${1:-}

    if [ -z "${_DEPLOY_TAG}" ]; then
        out_info "Creating local TAG named as: release-$(date +%Y-%m-%d)..." 1

        _DEPLOY_TAG=$(echo "release-$(date +%Y-%m-%d)")

        _DEPLOY_GIT_IN_REPO="git -C ${_DEPLOY_PROJECT_DIR}"

        out_info "Retrieving TAG number..." 1
        _DEPLOY_TAG_NUMBER=$(${_DEPLOY_GIT_IN_REPO} tag --list | grep ${_DEPLOY_TAG} | wc -l)

        if [ "${_DEPLOY_TAG_NUMBER}" -gt 0 ]; then
            out_info "Adding minor TAG version..." 1
            _DEPLOY_TAG="${_DEPLOY_TAG}.${_DEPLOY_TAG_NUMBER}"
        fi

        ${_DEPLOY_GIT_IN_REPO} tag ${_DEPLOY_TAG}

        out_info "Pushing TAG to repository..." 1
        ${_DEPLOY_GIT_IN_REPO} push -u ${_DEPLOY_REPO_REMOTE} ${_DEPLOY_TAG} > /dev/null 2>&1

        out_success "TAG created and pushed successfully!" 1

    fi
}
