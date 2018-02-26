#!/usr/bin/env bash

# Check if contain more than one Tag.
function increase_tag() {
    
    out_info "Retrieving TAG number..." 1

    _DEPLOY_TAG_NUMBER=$(${_DEPLOY_GIT_IN_REPO} tag --list | grep ${_DEPLOY_TAG} | wc -l)

    out_success "TAG position retrieve successfully!"

    # Generate other tag.
    if [ ${_DEPLOY_TAG_NUMBER} -gt 0 ]; then

        out_info "Adding minor TAG version..." 1

        _DEPLOY_TAG="${_DEPLOY_TAG}.${_DEPLOY_TAG_NUMBER}"

        out_success "Defined minor TAG as ${_DEPLOY_TAG_NUMBER} version!"

    fi
}
