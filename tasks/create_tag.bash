#!/usr/bin/env bash

# Create tag.
function create_tag() {

    out_info "Creating TAG for (${_FOLDER}) named as (${_DEPLOY_TAG})..." 1

    ${_DEPLOY_GIT_IN_REPO} tag ${_DEPLOY_TAG}

    out_check_status $? "TAG for ${_FOLDER} created successfully!" "Error to generate ${_DEPLOY_TAG} TAG."
}
