#!/usr/bin/env bash

ERROR=`tput setaf 1`
SUCCESS=`tput setaf 2`
WARNING=`tput setaf 3`
INFO=`tput setaf 4`
RESET=`tput sgr0`

function out_info() {
  local _LINE_BREAK=""
  [ ${#} -ge 2 ] && [ ${2} -eq 1 ] && _LINE_BREAK="\n"

  printf "${_LINE_BREAK}${INFO}[$(date +%H:%M:%S)][ * ] $1 ${RESET}\n"
}

function out_success() {
  local _LINE_BREAK=""
  [ ${#} -ge 2 ] && [ ${2} -eq 1 ] && _LINE_BREAK="\n"

  printf "${_LINE_BREAK}${SUCCESS}[$(date +%H:%M:%S)][ ✔ ] $1 ${RESET}\n"
}

function out_warning() {
  local _LINE_BREAK=""
  [ ${#} -ge 2 ] && [ ${2} -eq 1 ] && _LINE_BREAK="\n"

  printf "${_LINE_BREAK}${WARNING}[$(date +%H:%M:%S)][ ! ] $1 ${RESET}\n"
}

function out_danger() {
  local _LINE_BREAK=""
  [ ${#} -ge 2 ] && [ ${2} -eq 1 ] && _LINE_BREAK="\n"

  printf "${_LINE_BREAK}${ERROR}[$(date +%H:%M:%S)][ ✘ ] $1 ${RESET}\n"
}

function out_check_status() {
  _LINE_BREAK=""
  [ ${#} -ge 4 ] && [ ${4} -eq 1 ] && _LINE_BREAK="\n"

  _STATUS_CODE=${1}
  #TODO use output api instead of just echo
  [ ${_STATUS_CODE} -eq 0 ] && out_success "$2" && return 0
  [ ${_STATUS_CODE} -ne 0 ] && out_danger "$3" && return 0
}