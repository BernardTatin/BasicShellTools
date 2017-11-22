#!/usr/bin/env bash

## The MIT License (MIT)
##
## Copyright (c) 2017 Bernard Tatin
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
##

export script_name=$(basename $0)

function onerror() {
    local exit_code=$1
    shift
    local error_msg="$*"

    echo "ERROR: $error_msg" 1>&2
    exit $exit_code
}
function safe_source() {
  local file=
  while [ $# -gt 0 ]
  do
  file=$1
    if [ -f ${file} ]
    then
      source ${file}
    else
      onerror 1 "Cannot source ${file}"
    fi
    shift
  done
}

function get_tmp_file() {
  local root_name='another-tmp-file'
  [ $# -gt 0 ] && \
    root_name=$1
  $(mktemp /tmp/${root_name}.XXXXXX)
}

function dohelp() {
  local exit_value=0
  local error_message=

  case "$#" in
    '1')
      exit_value=$1
      ;;
    '2')
      exit_value=$1
      shift
      error_message="$*"
      ;;
  esac
  [ -n "$error_message" ] && \
    echo "ERROR : @" 1>&2

  /usr/bin/printf "${help_text}"

  exit ${exit_value}
}
