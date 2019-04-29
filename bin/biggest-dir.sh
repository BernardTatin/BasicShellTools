#!/usr/bin/env bash

# scrip name
script_name=$(basename $0)
# help text
help_text="${script_name} [-h|--help] : this message
${script_name} dir dir ... : search biggest directory in each of the dir\n"

# directory where this script is
bindir="$(cd $(dirname $0) || exit 1; pwd)"
basedir=$(dirname ${bindir})
tosource="${basedir}/include/common-bash.sh"
# source tools
[ -f "${tosource}" ] \
    && source ${tosource}

# we don't use aliases
DU=$(which du)
SORT=$(which sort)
TAIL=$(which tail)
# see common-bash.sh
PRINTF=$(which printf)

# no parameters, show help
[ $# -eq 0 ] && dohelp
# parameters in -h, --help, show help
case $1 in
    -h|--help)
        dohelp
        ;;
esac

# do the real work for each parameter
while [ $# -gt 0 ]
do
    # current parameter is the file system object to look at
    current_dir="$1"
    shift

    # if it's a directoy, search all childs
    if [ -d "${current_dir}" ]
    then
        file_mask="${current_dir}/*"
    else
        file_mask="${current_dir}"
    fi
    # run du, sort the result by size, get the greatest
    du_result=$(${DU} -sm ${file_mask} 2> /dev/null | ${SORT} -n | ${TAIL} -1)
    # for tabulations, see :
    #   https://stackoverflow.com/questions/40709605/bash-parameter-substitution-replace-tab-with-space
    # get object name
    du_name="${du_result#*[[:blank:]]}"
    # get object size
    du_size="${du_result%%[[:blank:]]*}"
    # print the corresponding line
    ${PRINTF} "%-48s - %8d Mo %s\n" "${current_dir}" "${du_size}" "${du_name}"
done
