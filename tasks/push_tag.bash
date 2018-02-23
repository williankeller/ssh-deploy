#!/usr/bin/env bash

# Push tag to repository.
function push_tag() {

    out_info "Pushing (${_DEPLOY_TAG}) TAG to (${_FOLDER}) repository..." 1

    ${_DEPLOY_GIT_IN_REPO} push origin ${_DEPLOY_TAG} > /dev/null 2>&1

    out_check_status $? "Successfully pushed TAG to (${_FOLDER}) folder!" "Error to push (${_DEPLOY_TAG}) TAG to (${_FOLDER}) folder."
}
