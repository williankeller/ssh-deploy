#!/usr/bin/env bash

# Start variables validate.
function rename() {

    out_info "Updating CONFIG.info file" 1;

    ssh ${_DEPLOY_SERVER} "mv ${_DEPLOY_APP_SERVER_DIR}web/Web/PROD_config.ini ${_DEPLOY_APP_SERVER_DIR}web/Web/config.ini"
    ssh ${_DEPLOY_SERVER} echo -e "### Verion: ${_DEPLOY_TAG}" > web/Web/config.ini > /dev/null 2>&1

    out_info "Updated with success!";
}