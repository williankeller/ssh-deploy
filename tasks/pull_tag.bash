#!/usr/bin/env bash

# Access SSh and get TAG.
function pull_tag() {

    local _LOCAL_PATH=${_DEPLOY_APP_SERVER_DIR}${_FOLDER}

    out_info "--------------------------------------------" 1
    out_success "Starting SSH remote (${_FOLDER}) folder..."


    out_info "Getting generated TAG for (${_FOLDER}) folder..." 1

    ssh ${_DEPLOY_SERVER} "cd ${_LOCAL_PATH} && git fetch && git checkout ${_DEPLOY_TAG}" > /dev/null 2>&1

    out_check_status $? "Success checkout to (${_FOLDER}) by TAG: ${_DEPLOY_TAG}" "Error to retrieve ${_FOLDER} TAG." 1

    out_success "Released TAG: ${_DEPLOY_TAG}" 1
}
