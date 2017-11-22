# latex-common

Common files for my LaTeX projects. Must be used as a [*LaTeX subtree*](https://www.atlassian.com/blog/git/alternatives-to-git-submodule-git-subtree).

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
