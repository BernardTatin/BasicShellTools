# Basic Shell Tools

My personal shell tools, no more, no less.

<<<<<<< HEAD
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
=======
## using it as a subtree

To use it, follow these commands :

```shell
# adding remote URL
$ git remote add rlatex-common git@github.com:BernardTatin/latex-common.git
# verify
$ git remote -v
...
rlatex-common git@github.com:BernardTatin/latex-common.git (fetch)
rlatex-common git@github.com:BernardTatin/latex-common.git (push)
...
$ git subtree add --prefix=latex-common/ rlatex-common master
git fetch rlatex-common master
From github.com:BernardTatin/latex-common
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> rlatex-common/master
Added dir 'latex-common'
$ ls -lrt
total 99
...
drwxr-xr-x 3 bernard bernard 4096 nov.  20 08:48 latex-common
$
>>>>>>> master
```

After modification in the subtree, first commit, second push :

```shell
# commit all
$ git commit -am "Commit all"
# push current app
$ git push origin current_branch
# push subtree
$ git subtree push --prefix=latex-common latex-common master
git push using:  latex-common master
Counting objects: 10, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 3.87 KiB | 3.87 MiB/s, done.
Total 10 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), completed with 2 local objects.
To github.com:BernardTatin/latex-common.git
   a39909f..11f2681  11f26819b66b0fd72f07d86d83c12a92cf21a2a8 -> master

```
