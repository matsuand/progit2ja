%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_refspec]]
=== The Refspec
@y
[[_refspec]]
=== The Refspec
@z

@x
Throughout this book, we've used simple mappings from remote branches to local references, but they can be more complex.
Suppose you were following along with the last couple sections and had created a small local Git repository, and now wanted to add a _remote_ to it:
@y
Throughout this book, we've used simple mappings from remote branches to local references, but they can be more complex.
Suppose you were following along with the last couple sections and had created a small local Git repository, and now wanted to add a _remote_ to it:
@z

@x
[source,console]
----
$ git remote add origin https://github.com/schacon/simplegit-progit
----
@y
[source,console]
----
$ git remote add origin https://github.com/schacon/simplegit-progit
----
@z

@x
Running the command above adds a section to your repository's `.git/config` file, specifying the name of the remote (`origin`), the URL of the remote repository, and the _refspec_ to be used for fetching:
@y
Running the command above adds a section to your repository's `.git/config` file, specifying the name of the remote (`origin`), the URL of the remote repository, and the _refspec_ to be used for fetching:
@z

@x
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/*:refs/remotes/origin/*
----
@y
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/*:refs/remotes/origin/*
----
@z

@x
The format of the refspec is, first, an optional `+`, followed by `<src>:<dst>`, where `<src>` is the pattern for references on the remote side and `<dst>` is where those references will be tracked locally.
The `+` tells Git to update the reference even if it isn't a fast-forward.
@y
The format of the refspec is, first, an optional `+`, followed by `<src>:<dst>`, where `<src>` is the pattern for references on the remote side and `<dst>` is where those references will be tracked locally.
The `+` tells Git to update the reference even if it isn't a fast-forward.
@z

@x
In the default case that is automatically written by a `git remote add origin` command, Git fetches all the references under `refs/heads/` on the server and writes them to `refs/remotes/origin/` locally.
So, if there is a `master` branch on the server, you can access the log of that branch locally via any of the following:
@y
In the default case that is automatically written by a `git remote add origin` command, Git fetches all the references under `refs/heads/` on the server and writes them to `refs/remotes/origin/` locally.
So, if there is a `master` branch on the server, you can access the log of that branch locally via any of the following:
@z

@x
[source,console]
----
$ git log origin/master
$ git log remotes/origin/master
$ git log refs/remotes/origin/master
----
@y
[source,console]
----
$ git log origin/master
$ git log remotes/origin/master
$ git log refs/remotes/origin/master
----
@z

@x
They're all equivalent, because Git expands each of them to `refs/remotes/origin/master`.
@y
They're all equivalent, because Git expands each of them to `refs/remotes/origin/master`.
@z

@x
If you want Git instead to pull down only the `master` branch each time, and not every other branch on the remote server, you can change the fetch line to refer to that branch only:
@y
If you want Git instead to pull down only the `master` branch each time, and not every other branch on the remote server, you can change the fetch line to refer to that branch only:
@z

@x
[source]
----
fetch = +refs/heads/master:refs/remotes/origin/master
----
@y
[source]
----
fetch = +refs/heads/master:refs/remotes/origin/master
----
@z

@x
This is just the default refspec for `git fetch` for that remote.
If you want to do a one-time only fetch, you can specify the specific refspec on the command line, too.
To pull the `master` branch on the remote down to `origin/mymaster` locally, you can run:
@y
This is just the default refspec for `git fetch` for that remote.
If you want to do a one-time only fetch, you can specify the specific refspec on the command line, too.
To pull the `master` branch on the remote down to `origin/mymaster` locally, you can run:
@z

@x
[source,console]
----
$ git fetch origin master:refs/remotes/origin/mymaster
----
@y
[source,console]
----
$ git fetch origin master:refs/remotes/origin/mymaster
----
@z

@x
You can also specify multiple refspecs.
On the command line, you can pull down several branches like so:
@y
You can also specify multiple refspecs.
On the command line, you can pull down several branches like so:
@z

@x
[source,console]
----
$ git fetch origin master:refs/remotes/origin/mymaster \
	 topic:refs/remotes/origin/topic
From git@github.com:schacon/simplegit
 ! [rejected]        master     -> origin/mymaster  (non fast forward)
 * [new branch]      topic      -> origin/topic
----
@y
[source,console]
----
$ git fetch origin master:refs/remotes/origin/mymaster \
	 topic:refs/remotes/origin/topic
From git@github.com:schacon/simplegit
 ! [rejected]        master     -> origin/mymaster  (non fast forward)
 * [new branch]      topic      -> origin/topic
----
@z

@x
In this case, the `master` branch pull was rejected because it wasn't listed as a fast-forward reference.
You can override that by specifying the `+` in front of the refspec.
@y
In this case, the `master` branch pull was rejected because it wasn't listed as a fast-forward reference.
You can override that by specifying the `+` in front of the refspec.
@z

@x
You can also specify multiple refspecs for fetching in your configuration file.
If you want to always fetch the `master` and `experiment` branches from the `origin` remote, add two lines:
@y
You can also specify multiple refspecs for fetching in your configuration file.
If you want to always fetch the `master` and `experiment` branches from the `origin` remote, add two lines:
@z

@x
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/master:refs/remotes/origin/master
	fetch = +refs/heads/experiment:refs/remotes/origin/experiment
----
@y
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/master:refs/remotes/origin/master
	fetch = +refs/heads/experiment:refs/remotes/origin/experiment
----
@z

@x
Since Git 2.6.0 you can use partial globs in the pattern to match multiple branches, so this works:
@y
Since Git 2.6.0 you can use partial globs in the pattern to match multiple branches, so this works:
@z

@x
[source,ini]
----
fetch = +refs/heads/qa*:refs/remotes/origin/qa*
----
@y
[source,ini]
----
fetch = +refs/heads/qa*:refs/remotes/origin/qa*
----
@z

@x
Even better, you can use namespaces (or directories) to accomplish the same with more structure.
If you have a QA team that pushes a series of branches, and you want to get the `master` branch and any of the QA team's branches but nothing else, you can use a config section like this:
@y
Even better, you can use namespaces (or directories) to accomplish the same with more structure.
If you have a QA team that pushes a series of branches, and you want to get the `master` branch and any of the QA team's branches but nothing else, you can use a config section like this:
@z

@x
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/master:refs/remotes/origin/master
	fetch = +refs/heads/qa/*:refs/remotes/origin/qa/*
----
@y
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/master:refs/remotes/origin/master
	fetch = +refs/heads/qa/*:refs/remotes/origin/qa/*
----
@z

@x
If you have a complex workflow process that has a QA team pushing branches, developers pushing branches, and integration teams pushing and collaborating on remote branches, you can namespace them easily this way.
@y
If you have a complex workflow process that has a QA team pushing branches, developers pushing branches, and integration teams pushing and collaborating on remote branches, you can namespace them easily this way.
@z

@x
[[_pushing_refspecs]]
==== Pushing Refspecs
@y
[[_pushing_refspecs]]
==== Pushing Refspecs
@z

@x
It's nice that you can fetch namespaced references that way, but how does the QA team get their branches into a `qa/` namespace in the first place?
You accomplish that by using refspecs to push.
@y
It's nice that you can fetch namespaced references that way, but how does the QA team get their branches into a `qa/` namespace in the first place?
You accomplish that by using refspecs to push.
@z

@x
If the QA team wants to push their `master` branch to `qa/master` on the remote server, they can run:
@y
If the QA team wants to push their `master` branch to `qa/master` on the remote server, they can run:
@z

@x
[source,console]
----
$ git push origin master:refs/heads/qa/master
----
@y
[source,console]
----
$ git push origin master:refs/heads/qa/master
----
@z

@x
If they want Git to do that automatically each time they run `git push origin`, they can add a `push` value to their config file:
@y
If they want Git to do that automatically each time they run `git push origin`, they can add a `push` value to their config file:
@z

@x
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/*:refs/remotes/origin/*
	push = refs/heads/master:refs/heads/qa/master
----
@y
[source,ini]
----
[remote "origin"]
	url = https://github.com/schacon/simplegit-progit
	fetch = +refs/heads/*:refs/remotes/origin/*
	push = refs/heads/master:refs/heads/qa/master
----
@z

@x
Again, this will cause a `git push origin` to push the local `master` branch to the remote `qa/master` branch by default.
@y
Again, this will cause a `git push origin` to push the local `master` branch to the remote `qa/master` branch by default.
@z

@x
[NOTE]
====
You cannot use the refspec to fetch from one repository and push to another one.
For an example to do so, refer to <<ch06-github#_fetch_and_push_on_different_repositories>>.
====
@y
[NOTE]
====
You cannot use the refspec to fetch from one repository and push to another one.
For an example to do so, refer to <<ch06-github#_fetch_and_push_on_different_repositories>>.
====
@z

@x
==== Deleting References
@y
==== Deleting References
@z

@x
You can also use the refspec to delete references from the remote server by running something like this:
@y
You can also use the refspec to delete references from the remote server by running something like this:
@z

@x
[source,console]
----
$ git push origin :topic
----
@y
[source,console]
----
$ git push origin :topic
----
@z

@x
Because the refspec is `<src>:<dst>`, by leaving off the `<src>` part, this basically says to make the `topic` branch on the remote nothing, which deletes it.
@y
Because the refspec is `<src>:<dst>`, by leaving off the `<src>` part, this basically says to make the `topic` branch on the remote nothing, which deletes it.
@z

@x
Or you can use the newer syntax (available since Git v1.7.0):
@y
Or you can use the newer syntax (available since Git v1.7.0):
@z

@x
[source,console]
----
$ git push origin --delete topic
----
@y
[source,console]
----
$ git push origin --delete topic
----
@z
