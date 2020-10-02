%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
==== Git and Bazaar
@y
==== Git and Bazaar
@z

@x
Among the DVCS, another famous one is http://bazaar.canonical.com[Bazaar].
Bazaar is free and open source, and is part of the https://www.gnu.org[GNU Project].
It behaves very differently from Git.
Sometimes, to do the same thing as with Git, you have to use a different keyword, and some keywords that are common don't have the same meaning.
In particular, the branch management is very different and may cause confusion, especially when someone comes from Git's universe.
Nevertheless, it is possible to work on a Bazaar repository from a Git one.
@y
Among the DVCS, another famous one is http://bazaar.canonical.com[Bazaar].
Bazaar is free and open source, and is part of the https://www.gnu.org[GNU Project].
It behaves very differently from Git.
Sometimes, to do the same thing as with Git, you have to use a different keyword, and some keywords that are common don't have the same meaning.
In particular, the branch management is very different and may cause confusion, especially when someone comes from Git's universe.
Nevertheless, it is possible to work on a Bazaar repository from a Git one.
@z

@x
There are many projects that allow you to use Git as a Bazaar client.
Here we'll use Felipe Contreras' project that you may find at https://github.com/felipec/git-remote-bzr[].
To install it, you just have to download the file git-remote-bzr in a folder contained in your `$PATH`:
@y
There are many projects that allow you to use Git as a Bazaar client.
Here we'll use Felipe Contreras' project that you may find at https://github.com/felipec/git-remote-bzr[].
To install it, you just have to download the file git-remote-bzr in a folder contained in your `$PATH`:
@z

@x
[source,console]
----
$ wget https://raw.github.com/felipec/git-remote-bzr/master/git-remote-bzr -O ~/bin/git-remote-bzr
$ chmod +x ~/bin/git-remote-bzr
----
@y
[source,console]
----
$ wget https://raw.github.com/felipec/git-remote-bzr/master/git-remote-bzr -O ~/bin/git-remote-bzr
$ chmod +x ~/bin/git-remote-bzr
----
@z

@x
You also need to have Bazaar installed.
That's all!
@y
You also need to have Bazaar installed.
That's all!
@z

@x
===== Create a Git repository from a Bazaar repository
@y
===== Create a Git repository from a Bazaar repository
@z

@x
It is simple to use.
It is enough to clone a Bazaar repository prefixing it by `bzr::`.
Since Git and Bazaar both do full clones to your machine, it's possible to attach a Git clone to your local Bazaar clone, but it isn't recommended.
It's much easier to attach your Git clone directly to the same place your Bazaar clone is attached to -- the central repository.
@y
It is simple to use.
It is enough to clone a Bazaar repository prefixing it by `bzr::`.
Since Git and Bazaar both do full clones to your machine, it's possible to attach a Git clone to your local Bazaar clone, but it isn't recommended.
It's much easier to attach your Git clone directly to the same place your Bazaar clone is attached to -- the central repository.
@z

@x
Let's suppose that you worked with a remote repository which is at address `bzr+ssh://developer@mybazaarserver:myproject`.
Then you must clone it in the following way:
@y
Let's suppose that you worked with a remote repository which is at address `bzr+ssh://developer@mybazaarserver:myproject`.
Then you must clone it in the following way:
@z

@x
[source,console]
----
$ git clone bzr::bzr+ssh://developer@mybazaarserver:myproject myProject-Git
$ cd myProject-Git
----
@y
[source,console]
----
$ git clone bzr::bzr+ssh://developer@mybazaarserver:myproject myProject-Git
$ cd myProject-Git
----
@z

@x
At this point, your Git repository is created but it is not compacted for optimal disk use.
That's why you should also clean and compact your Git repository, especially if it is a big one:
@y
At this point, your Git repository is created but it is not compacted for optimal disk use.
That's why you should also clean and compact your Git repository, especially if it is a big one:
@z

@x
[source,console]
----
$ git gc --aggressive
----
@y
[source,console]
----
$ git gc --aggressive
----
@z

@x
===== Bazaar branches
@y
===== Bazaar branches
@z

@x
Bazaar only allows you to clone branches, but a repository may contain several branches, and `git-remote-bzr` can clone both.
For example, to clone a branch:
@y
Bazaar only allows you to clone branches, but a repository may contain several branches, and `git-remote-bzr` can clone both.
For example, to clone a branch:
@z

@x
[source,console]
----
$ git clone bzr::bzr://bzr.savannah.gnu.org/emacs/trunk emacs-trunk
----
@y
[source,console]
----
$ git clone bzr::bzr://bzr.savannah.gnu.org/emacs/trunk emacs-trunk
----
@z

@x
And to clone the whole repository:
@y
And to clone the whole repository:
@z

@x
[source,console]
----
$ git clone bzr::bzr://bzr.savannah.gnu.org/emacs emacs
----
@y
[source,console]
----
$ git clone bzr::bzr://bzr.savannah.gnu.org/emacs emacs
----
@z

@x
The second command clones all the branches contained in the emacs repository; nevertheless, it is possible to point out some branches:
@y
The second command clones all the branches contained in the emacs repository; nevertheless, it is possible to point out some branches:
@z

@x
[source,console]
----
$ git config remote-bzr.branches 'trunk, xwindow'
----
@y
[source,console]
----
$ git config remote-bzr.branches 'trunk, xwindow'
----
@z

@x
Some remote repositories don't allow you to list their branches, in which case you have to manually specify them, and even though you could specify the configuration in the cloning command, you may find this easier:
@y
Some remote repositories don't allow you to list their branches, in which case you have to manually specify them, and even though you could specify the configuration in the cloning command, you may find this easier:
@z

@x
[source,console]
----
$ git init emacs
$ git remote add origin bzr::bzr://bzr.savannah.gnu.org/emacs
$ git config remote-bzr.branches 'trunk, xwindow'
$ git fetch
----
@y
[source,console]
----
$ git init emacs
$ git remote add origin bzr::bzr://bzr.savannah.gnu.org/emacs
$ git config remote-bzr.branches 'trunk, xwindow'
$ git fetch
----
@z

@x
===== Ignore what is ignored with .bzrignore
@y
===== Ignore what is ignored with .bzrignore
@z

@x
Since you are working on a project managed with Bazaar, you shouldn't create a `.gitignore` file because you _may_ accidentally set it under version control and the other people working with Bazaar would be disturbed.
The solution is to create the `.git/info/exclude` file either as a symbolic link or as a regular file.
We'll see later on how to solve this question.
@y
Since you are working on a project managed with Bazaar, you shouldn't create a `.gitignore` file because you _may_ accidentally set it under version control and the other people working with Bazaar would be disturbed.
The solution is to create the `.git/info/exclude` file either as a symbolic link or as a regular file.
We'll see later on how to solve this question.
@z

@x
Bazaar uses the same model as Git to ignore files, but also has two features which don't have an equivalent into Git.
The complete description may be found in http://doc.bazaar.canonical.com/bzr.2.7/en/user-reference/ignore-help.html[the documentation].
The two features are:
@y
Bazaar uses the same model as Git to ignore files, but also has two features which don't have an equivalent into Git.
The complete description may be found in http://doc.bazaar.canonical.com/bzr.2.7/en/user-reference/ignore-help.html[the documentation].
The two features are:
@z

@x
1. "!!" allows you to ignore certain file patterns even if they're specified using a "!" rule.
2. "RE:" at the beginning of a line allows you to specify a https://docs.python.org/3/library/re.html[Python regular expression] (Git only allows shell globs).
@y
1. "!!" allows you to ignore certain file patterns even if they're specified using a "!" rule.
2. "RE:" at the beginning of a line allows you to specify a https://docs.python.org/3/library/re.html[Python regular expression] (Git only allows shell globs).
@z

@x
As a consequence, there are two different situations to consider:
@y
As a consequence, there are two different situations to consider:
@z

@x
1. If the `.bzrignore` file does not contain any of these two specific prefixes, then you can simply make a symbolic link to it in the repository: `ln -s .bzrignore .git/info/exclude`.
2. Otherwise, you must create the `.git/info/exclude` file and adapt it to ignore exactly the same files in `.bzrignore`.
@y
1. If the `.bzrignore` file does not contain any of these two specific prefixes, then you can simply make a symbolic link to it in the repository: `ln -s .bzrignore .git/info/exclude`.
2. Otherwise, you must create the `.git/info/exclude` file and adapt it to ignore exactly the same files in `.bzrignore`.
@z

@x
Whatever the case is, you will have to remain vigilant against any change of `.bzrignore` to make sure that the `.git/info/exclude` file always reflects `.bzrignore`.
Indeed, if the `.bzrignore` file were to change and contained one or more lines starting with "!!" or "RE:", Git not being able to interpret these lines, you'll have to adapt your `.git/info/exclude` file to ignore the same files as the ones ignored with `.bzrignore`.
Moreover, if the `.git/info/exclude` file was a symbolic link, you'll have to first delete the symbolic link, copy `.bzrignore` to `.git/info/exclude` and then adapt the latter.
However, be careful with its creation because with Git it is impossible to re-include a file if a parent directory of that file is excluded.
@y
Whatever the case is, you will have to remain vigilant against any change of `.bzrignore` to make sure that the `.git/info/exclude` file always reflects `.bzrignore`.
Indeed, if the `.bzrignore` file were to change and contained one or more lines starting with "!!" or "RE:", Git not being able to interpret these lines, you'll have to adapt your `.git/info/exclude` file to ignore the same files as the ones ignored with `.bzrignore`.
Moreover, if the `.git/info/exclude` file was a symbolic link, you'll have to first delete the symbolic link, copy `.bzrignore` to `.git/info/exclude` and then adapt the latter.
However, be careful with its creation because with Git it is impossible to re-include a file if a parent directory of that file is excluded.
@z

@x
===== Fetch the changes of the remote repository
@y
===== Fetch the changes of the remote repository
@z

@x
To fetch the changes of the remote, you pull changes as usually, using Git commands.
Supposing that your changes are on the `master` branch, you merge or rebase your work on the `origin/master` branch:
@y
To fetch the changes of the remote, you pull changes as usually, using Git commands.
Supposing that your changes are on the `master` branch, you merge or rebase your work on the `origin/master` branch:
@z

@x
[source,console]
----
$ git pull --rebase origin
----
@y
[source,console]
----
$ git pull --rebase origin
----
@z

@x
===== Push your work on the remote repository
@y
===== Push your work on the remote repository
@z

@x
Because Bazaar also has the concept of merge commits, there will be no problem if you push a merge commit.
So you can work on a branch, merge the changes into `master` and push your work.
Then, you create your branches, you test and commit your work as usual.
You finally push your work to the Bazaar repository:
@y
Because Bazaar also has the concept of merge commits, there will be no problem if you push a merge commit.
So you can work on a branch, merge the changes into `master` and push your work.
Then, you create your branches, you test and commit your work as usual.
You finally push your work to the Bazaar repository:
@z

@x
[source,console]
----
$ git push origin master
----
@y
[source,console]
----
$ git push origin master
----
@z

@x
===== Caveats
@y
===== Caveats
@z

@x
Git's remote-helpers framework has some limitations that apply.
In particular, these commands don't work:
@y
Git's remote-helpers framework has some limitations that apply.
In particular, these commands don't work:
@z

@x
* git push origin :branch-to-delete (Bazaar can't accept ref deletions in this way)
* git push origin old:new (it will push `old`)
* git push --dry-run origin branch (it will push)
@y
* git push origin :branch-to-delete (Bazaar can't accept ref deletions in this way)
* git push origin old:new (it will push `old`)
* git push --dry-run origin branch (it will push)
@z

@x
===== Summary
@y
===== Summary
@z

@x
Since Git's and Bazaar's models are similar, there isn't a lot of resistance when working across the boundary.
As long as you watch out for the limitations, and are always aware that the remote repository isn't natively Git, you'll be fine.
@y
Since Git's and Bazaar's models are similar, there isn't a lot of resistance when working across the boundary.
As long as you watch out for the limitations, and are always aware that the remote repository isn't natively Git, you'll be fine.
@z
