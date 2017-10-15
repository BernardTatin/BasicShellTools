#!/bin/bash

JDK_BASE=/usr/local/jdk
SCRIPT=$(basename $0)

function add_to_path() {
	local newpath=$1
	local had_jdk=$(echo ${PATH} | grep ${JDK_BASE})

	# echo "add_to_path <${newpath}> / had_jdk <${had_jdk}>"

	[ -n "${had_jdk}" ] && \
		export PATH=$(echo ${PATH} | sed "s;${JDK_BASE}[^:]*;;g")
	export PATH=${newpath}:${PATH}
	# echo "PATH <${PATH}>"
}

function show_jdk() {
	echo "JAVA_HOME=${JAVA_HOME}"
}

function select_jdk() {
	local version=$1

	echo "select_jdk ${version} ..."
	case $version in
		8)
			jdk_dir=$(ls -rtd ${JDK_BASE}/jdk1.8* | tail -n 1)
			;;
		9)
			jdk_dir=$(ls -rtd ${JDK_BASE}/jdk-9* | tail -n 1)
			;;
		*)
			jdk_dir=
			;;
	esac
	# echo "jdk_dir <${jdk_dir}>"
	[ -n "${jdk_dir}" ] && \
		export JAVA_HOME=${jdk_dir} && \
		add_to_path ${JAVA_HOME}/bin
}

select_jdk ${JDK_VERSION}
show_jdk
