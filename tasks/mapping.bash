#!/usr/bin/env bash

# Generate and push TAG.
function mapping() {

    _DEPLOY_TAG=$(echo "release-$(date +%Y-%m-%d)")
    _DEPLOY_TAG_NUMBER=0

    # Check if contain arguments.
    if [ $# -eq 0 ]; then

        _DEPLOY_FOLDERS=${_ARGUMENT}
    fi

    # Mapping all folders by default.
    for _FOLDER in ${_DEPLOY_FOLDERS}; do

        _LOCAL_PATH=${_DEPLOY_PROJECT_DIR}${_FOLDER}

        _DEPLOY_GIT_IN_REPO="git -C ${_LOCAL_PATH}"

        # Check if contain more than one Tag.
        increase_tag

        # Create tag.
        create_tag

        # Push tag to repository.
        push_tag

        # Access SSh and get TAG.
        pull_tag

    done
}
