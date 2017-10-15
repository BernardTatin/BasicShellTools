#!/usr/bin/env bash

script_name=$(basename $0)

#!/usr/bin/env bash

function onerror() {
    local exit_code=$1
    shift
    local error_msg="$@"

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
  echo $(mktemp /tmp/${root_name}.XXXXXX)
}
