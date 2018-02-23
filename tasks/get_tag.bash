#!/usr/bin/env bash

# Access SSh and get TAG.
function get_tag() {

    out_info "Connecting server via SSH..." 1
    # TODO: Connect first, then get git pull.
    out_success "SSH Connected successfully!" 1

    out_info "Getting generated TAG..." 1
    ssh ${_DEPLOY_SERVER}; "cd ${_DEPLOY_APP_SERVER_DIR} && git pull && git checkout ${_DEPLOY_TAG}" > /dev/null 2>&1

    out_success "TAG created and pushed successfully!" 1
}
