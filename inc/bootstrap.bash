#!/usr/bin/env bash

_ARGUMENT="${1:-}"

function bootstrap_autoload() {

  for _FILE in $@; do

    if [ -n ${_FILE} ] && [ -f ${_FILE} ]; then # -n tests to see if the argument is non empty
      
      source $PWD/${_FILE}

    fi

  done
}

function bootstrap_exit() {

  filesystem_delete_folder ${_SF_STATIC_CACHE_BASE_FOLDER}
  bootstrap_invoke_all "exit"

  local _DURATION=$SECONDS
  out_success "Execution time: $((${_DURATION} / 60))m $((${_DURATION} % 60))s" 1
}

function bootstrap_core() {

  local _LOAD_FILES=tasks/*;
  bootstrap_autoload ${_LOAD_FILES}
}

function bootstrap_load_tasks() {

  local _LOAD_FILES=$(find "${SF_SCRIPTS_HOME}/tasks" -type f -iname "${_TASK_NAME}.sh");
  if [[ -z "${_LOAD_FILES}" ]]; then

    raise FolderNotKnown "[bootstrap_load_tasks] Folder '${_TASK_NAME}' is unknown"

  fi

  local _LOAD_TASK_PARENT_DIR="$(dirname  ${_LOAD_FILES})"
  local _LOAD_TASK_DIR="${SF_SCRIPTS_HOME}/tasks/${_TASK_PARENT_NAME}"
  export _TASK_PARENT_NAME="$(basename ${_LOAD_TASK_PARENT_DIR})"
  if [ -d ${_LOAD_TASK_DIR} ]; then

    # Load also any bash files if available inside the task folder
    _LOAD_FILES="${_LOAD_FILES} $(find "${_LOAD_TASK_DIR}" -type f -iname "*.bash")"

  fi

  bootstrap_autoload ${_LOAD_FILES[@]}
}