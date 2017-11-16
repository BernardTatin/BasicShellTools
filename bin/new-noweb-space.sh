#!/usr/bin/env bash

ici=$(cd $(dirname 0) || exit 1; pwd)
base=$(dirname ${ici})
include=${base}/include 
common=${base}/common

# scrip name
script_name=$(basename $0)
# help text
help_text="${script_name} [-h|--help] : this message
${script_name} space-name [author]: create a new noweb space in the current dir"

source ${include}/common-bash.bash

# no parameters, show help
[ $# -eq 0 ] && dohelp
# parameters in -h, --help, show help
case $1 in
  -h|--help)
    dohelp
    ;;
esac

author=${USER}
space_name=$1
shift
[ $# -ne 0 ] && author=$1

for f in ${common} ${base}/annexes.nw ${base}/Makefile
do 
    cp -Ra ${f} .
done 


# PROJECT = shell-tools
# MORENW = common.nw annexes.nw
sed -i "s/^PROJECT = .*$/PROJECT = ${space_name}/" Makefile
sed -i "s/^MORENW = .*/MORENW = annexes.nw/" Makefile

cat > ${space_name}.nw << NW
\documentclass{scrartcl}

\input{common/prelude.tex}

\author{${author}}
\date{$(date "+%y")}
\title{Le titre
\begin{document}

\maketitle
\abstract{Le choix de `noweb` provient du simple fait que documentation et sources sont conçus en même temps.}

\tableofcontents

NW


