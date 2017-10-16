#!/usr/bin/env bash

bindir=$(cd $(dirname $0); pwd)
cd ${bindir}
source ../include/common-bash.sh

tst_help=$(get_tmp_file).sh

cat > ${tst_help} << TST_HELP
#!/bin/bash
cd ${bindir}
cd ..
bindir=\$(pwd)
# echo "pwd: \$(pwd), bindir: \${bindir}"
source include/common-bash.sh
safe_source biggest-dir

exit_code=0
[ $# -gt 0 ] && \
  exit_code=\$1

dohelp \${exit_code} &> /dev/null
TST_HELP

chmod +x ${tst_help}
for ec in -1 0 1 2 3
do
  echo '-------------------------------------------------------'
  ${tst_help} ${ec}
  rvalue=$?
  if [ "${ec}"="${rvalue}" ]
  then
    echo "test ${ec} OK"
  else
    echo "test ${ec} BAAAD"
  fi
done

rm -fv ${tst_help}
exit 0
