# Basic Shell Tools

My personal shell tools, no more, no less.

## set-jdk.sh (`bash`)

Must be sourced. The variable `JDK_VERSION` must be defined with a value of 8 or 9 before sourcing the script. Perhaps you had to modify the variable `JDK_BASE` in the script. This variable is the name of the folder where all jdk versions are installed.

After sourcing, the variables `PATH` and `JAVA_HOME` are updated to the new values for the chosen jdk.

## biggest-dir (`bash`)

This script find the biggest dir inside a chosen one. Here is an example :

```shell
$ ./biggest-dir /home/bernard/Pictures/*
/home/bernard/Pictures/100_FUJI                  - 49	/home/bernard/Pictures/100_FUJI/DSCF0465.RAF
/home/bernard/Pictures/2017                      - 8036	/home/bernard/Pictures/2017/08-03
du: cannot access '/home/bernard/Pictures/20170706/*': No such file or directory
/home/bernard/Pictures/20170706                  -
/home/bernard/Pictures/DSCF0406.jpg              - 1	/home/bernard/Pictures/DSCF0406.jpg
/home/bernard/Pictures/DSCF0442.jpg              - 1	/home/bernard/Pictures/DSCF0442.jpg
/home/bernard/Pictures/DSCF0444.jpg              - 1	/home/bernard/Pictures/DSCF0444.jpg
/home/bernard/Pictures/Exports                   - 3	/home/bernard/Pictures/Exports/17 août 2017
/home/bernard/Pictures/SamsungA5                 - 176	/home/bernard/Pictures/SamsungA5/works
/home/bernard/Pictures/tante                     - 6	/home/bernard/Pictures/tante/full2.svg
/home/bernard/Pictures/tmp                       - 1	/home/bernard/Pictures/tmp/Vespa 150 (VBA)- 1961.jpg
/home/bernard/Pictures/Wallpapers                - 7	/home/bernard/Pictures/Wallpapers/DSCF0991.jpg
```
