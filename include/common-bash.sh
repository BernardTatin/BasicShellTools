#!/usr/bin/env bash

export script_name=$(basename $0)
export PRINTF=$(which printf)

# onerror exit_code message ...
function onerror() {
    local exit_code=$1
    shift
    local error_msg="$*"

    echo "ERROR: $error_msg" 1>&2
    exit $exit_code
}

# safe_source file file ...
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
    local exit_value=
    local error_message=

    case "$#" in
        '0')
            exit_value=0
            ;;
        '1')
            exit_value=$1
            ;;
        *)
            exit_value=$1
            shift
            error_message="$*"
            ;;
    esac
    [ -n "$error_message" ] && echo "ERROR : @" 1>&2

    ${PRINTF} "${help_text}"

    exit ${exit_value}
}
