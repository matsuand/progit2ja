%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_aliases]]
=== Git Aliases
@y
[[_git_aliases]]
=== Git Aliases
@z

@x
(((aliases)))
Before we move on to the next chapter, we want to introduce a feature that can make your Git experience simpler, easier, and more familiar: aliases.
For clarity's sake, we won't be using them anywhere else in this book, but if you go on to use Git with any regularity, aliases are something you should know about.
@y
(((aliases)))
Before we move on to the next chapter, we want to introduce a feature that can make your Git experience simpler, easier, and more familiar: aliases.
For clarity's sake, we won't be using them anywhere else in this book, but if you go on to use Git with any regularity, aliases are something you should know about.
@z

@x
Git doesn't automatically infer your command if you type it in partially.
If you don't want to type the entire text of each of the Git commands, you can easily set up an alias for each command using `git config`.(((git commands, config)))
Here are a couple of examples you may want to set up:
@y
Git doesn't automatically infer your command if you type it in partially.
If you don't want to type the entire text of each of the Git commands, you can easily set up an alias for each command using `git config`.(((git commands, config)))
Here are a couple of examples you may want to set up:
@z

@x
[source,console]
----
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
----
@y
[source,console]
----
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
----
@z

@x
This means that, for example, instead of typing `git commit`, you just need to type `git ci`.
As you go on using Git, you'll probably use other commands frequently as well; don't hesitate to create new aliases.
@y
This means that, for example, instead of typing `git commit`, you just need to type `git ci`.
As you go on using Git, you'll probably use other commands frequently as well; don't hesitate to create new aliases.
@z

@x
This technique can also be very useful in creating commands that you think should exist.
For example, to correct the usability problem you encountered with unstaging a file, you can add your own unstage alias to Git:
@y
This technique can also be very useful in creating commands that you think should exist.
For example, to correct the usability problem you encountered with unstaging a file, you can add your own unstage alias to Git:
@z

@x
[source,console]
----
$ git config --global alias.unstage 'reset HEAD --'
----
@y
[source,console]
----
$ git config --global alias.unstage 'reset HEAD --'
----
@z

@x
This makes the following two commands equivalent:
@y
This makes the following two commands equivalent:
@z

@x
[source,console]
----
$ git unstage fileA
$ git reset HEAD -- fileA
----
@y
[source,console]
----
$ git unstage fileA
$ git reset HEAD -- fileA
----
@z

@x
This seems a bit clearer.
It's also common to add a `last` command, like this:
@y
This seems a bit clearer.
It's also common to add a `last` command, like this:
@z

@x
[source,console]
----
$ git config --global alias.last 'log -1 HEAD'
----
@y
[source,console]
----
$ git config --global alias.last 'log -1 HEAD'
----
@z

@x
This way, you can see the last commit easily:
@y
This way, you can see the last commit easily:
@z

@x
[source,console]
----
$ git last
commit 66938dae3329c7aebe598c2246a8e6af90d04646
Author: Josh Goebel <dreamer3@example.com>
Date:   Tue Aug 26 19:48:51 2008 +0800
@y
[source,console]
----
$ git last
commit 66938dae3329c7aebe598c2246a8e6af90d04646
Author: Josh Goebel <dreamer3@example.com>
Date:   Tue Aug 26 19:48:51 2008 +0800
@z

@x
    Test for current head
@y
    Test for current head
@z

@x
    Signed-off-by: Scott Chacon <schacon@example.com>
----
@y
    Signed-off-by: Scott Chacon <schacon@example.com>
----
@z

@x
As you can tell, Git simply replaces the new command with whatever you alias it for.
However, maybe you want to run an external command, rather than a Git subcommand.
In that case, you start the command with a `!` character.
This is useful if you write your own tools that work with a Git repository.
We can demonstrate by aliasing `git visual` to run `gitk`:
@y
As you can tell, Git simply replaces the new command with whatever you alias it for.
However, maybe you want to run an external command, rather than a Git subcommand.
In that case, you start the command with a `!` character.
This is useful if you write your own tools that work with a Git repository.
We can demonstrate by aliasing `git visual` to run `gitk`:
@z

@x
[source,console]
----
$ git config --global alias.visual '!gitk'
----
@y
[source,console]
----
$ git config --global alias.visual '!gitk'
----
@z
