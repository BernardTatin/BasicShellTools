#!/usr/bin/env bash

script=$0
ici=$(cd $(dirname ${script}); pwd)
echo "DEBUG ici : ${ici}"
base=$(dirname ${ici})
echo "DEBUG base : ${base}"
include=${base}/include 
echo "DEBUG include : ${include}"
common=${base}/common

# scrip name
script_name=$(basename ${script})
# help text
help_text="${script_name} [-h|--help] : this message
${script_name} space-name [author]: create a new noweb space in the current dir"

echo "DEBUG 1"
. ${include}/common-bash.sh
echo "DEBUG 2"

# no parameters, show help
[ $# -eq 0 ] && dohelp
# parameters in -h, --help, show help
case $1 in
  -h|--help)
    dohelp
    ;;
esac
echo "DEBUG 3"

author=${USER}
space_name=$1
shift
[ $# -ne 0 ] && author=$1
echo "DEBUG author : ${author}"
echo "DEBUG space_name : ${space_name}"

for f in ${common} ${base}/annexes.nw ${base}/Makefile
do 
    cp -Ra ${f} .
done 
echo "DEBUG 4"


# PROJECT = shell-tools
# MORENW = common.nw annexes.nw
sed -i "s/^PROJECT = .*$/PROJECT = ${space_name}/" Makefile
sed -i "s/^MORENW = .*/MORENW = annexes.nw/" Makefile
echo "DEBUG 5"

cat > ${space_name}.nw << NW
\documentclass{scrartcl}

\input{common/prelude.tex}

\author{${author}}
\date{$(date "+%Y")}
\title{Le titre}
\begin{document}

\maketitle
\abstract{Le choix de \texttt{noweb} provient du simple fait que documentation et sources sont conçus en même temps.}

\tableofcontents

NW

echo "DEBUG 6"

