# Basic Shell Tools

My personal shell tools, no more, no less.

## set-jdk.sh (`bash`)

Must be sourced. The variable `JDK_VERSION` must be defined with a value of 8 or 9 before sourcing the script. Perhaps you had to modify the variable `JDK_BASE` in the script. This variable is the name of the folder where all jdk versions are installed.

After sourcing, the variables `PATH` and `JAVA_HOME` are updated to the new values for the chosen jdk.

## biggest-dir (`bash`)

This script find the biggest inside a chosen one.
