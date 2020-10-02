%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_branch_management]]
=== Branch Management
@y
[[_branch_management]]
=== Branch Management
@z

@x
(((branches, managing)))
Now that you've created, merged, and deleted some branches, let's look at some branch-management tools that will come in handy when you begin using branches all the time.
@y
(((branches, managing)))
Now that you've created, merged, and deleted some branches, let's look at some branch-management tools that will come in handy when you begin using branches all the time.
@z

@x
The `git branch` command does more than just create and delete branches.(((git commands, branch)))
If you run it with no arguments, you get a simple listing of your current branches:
@y
The `git branch` command does more than just create and delete branches.(((git commands, branch)))
If you run it with no arguments, you get a simple listing of your current branches:
@z

@x
[source,console]
----
$ git branch
  iss53
* master
  testing
----
@y
[source,console]
----
$ git branch
  iss53
* master
  testing
----
@z

@x
Notice the `*` character that prefixes the `master` branch: it indicates the branch that you currently have checked out (i.e., the branch that `HEAD` points to).
This means that if you commit at this point, the `master` branch will be moved forward with your new work.
To see the last commit on each branch, you can run `git branch -v`:
@y
Notice the `*` character that prefixes the `master` branch: it indicates the branch that you currently have checked out (i.e., the branch that `HEAD` points to).
This means that if you commit at this point, the `master` branch will be moved forward with your new work.
To see the last commit on each branch, you can run `git branch -v`:
@z

@x
[source,console]
----
$ git branch -v
  iss53   93b412c Fix javascript issue
* master  7a98805 Merge branch 'iss53'
  testing 782fd34 Add scott to the author list in the readme
----
@y
[source,console]
----
$ git branch -v
  iss53   93b412c Fix javascript issue
* master  7a98805 Merge branch 'iss53'
  testing 782fd34 Add scott to the author list in the readme
----
@z

@x
The useful `--merged` and `--no-merged` options can filter this list to branches that you have or have not yet merged into the branch you're currently on.
To see which branches are already merged into the branch you're on, you can run `git branch --merged`:
@y
The useful `--merged` and `--no-merged` options can filter this list to branches that you have or have not yet merged into the branch you're currently on.
To see which branches are already merged into the branch you're on, you can run `git branch --merged`:
@z

@x
[source,console]
----
$ git branch --merged
  iss53
* master
----
@y
[source,console]
----
$ git branch --merged
  iss53
* master
----
@z

@x
Because you already merged in `iss53` earlier, you see it in your list.
Branches on this list without the `*` in front of them are generally fine to delete with `git branch -d`; you've already incorporated their work into another branch, so you're not going to lose anything.
@y
Because you already merged in `iss53` earlier, you see it in your list.
Branches on this list without the `*` in front of them are generally fine to delete with `git branch -d`; you've already incorporated their work into another branch, so you're not going to lose anything.
@z

@x
To see all the branches that contain work you haven't yet merged in, you can run `git branch --no-merged`:
@y
To see all the branches that contain work you haven't yet merged in, you can run `git branch --no-merged`:
@z

@x
[source,console]
----
$ git branch --no-merged
  testing
----
@y
[source,console]
----
$ git branch --no-merged
  testing
----
@z

@x
This shows your other branch.
Because it contains work that isn't merged in yet, trying to delete it with `git branch -d` will fail:
@y
This shows your other branch.
Because it contains work that isn't merged in yet, trying to delete it with `git branch -d` will fail:
@z

@x
[source,console]
----
$ git branch -d testing
error: The branch 'testing' is not fully merged.
If you are sure you want to delete it, run 'git branch -D testing'.
----
@y
[source,console]
----
$ git branch -d testing
error: The branch 'testing' is not fully merged.
If you are sure you want to delete it, run 'git branch -D testing'.
----
@z

@x
If you really do want to delete the branch and lose that work, you can force it with `-D`, as the helpful message points out.
@y
If you really do want to delete the branch and lose that work, you can force it with `-D`, as the helpful message points out.
@z

@x
[TIP]
====
The options described above, `--merged` and `--no-merged` will, if not given a commit or branch name as an argument, show you what is, respectively, merged or not merged into your _current_ branch.
@y
[TIP]
====
The options described above, `--merged` and `--no-merged` will, if not given a commit or branch name as an argument, show you what is, respectively, merged or not merged into your _current_ branch.
@z

@x
You can always provide an additional argument to ask about the merge state with respect to some other branch without checking  that other branch out first, as in, what is not merged into the `master` branch?
[source,console]
----
$ git checkout testing
$ git branch --no-merged master
  topicA
  featureB
----
====
@y
You can always provide an additional argument to ask about the merge state with respect to some other branch without checking  that other branch out first, as in, what is not merged into the `master` branch?
[source,console]
----
$ git checkout testing
$ git branch --no-merged master
  topicA
  featureB
----
====
@z

@x
==== Changing a branch name
@y
==== Changing a branch name
@z

@x
[CAUTION]
====
Do not rename branches that are still in use by other collaborators.
Do not rename a branch like master/main/mainline without having read the section "Changing the master branch name".
====
@y
[CAUTION]
====
Do not rename branches that are still in use by other collaborators.
Do not rename a branch like master/main/mainline without having read the section "Changing the master branch name".
====
@z

@x
Suppose you have a branch that is called _bad-branch-name_ and you want to change it to _corrected-branch-name_, while keeping all history.
You also want to change the branch name on the remote (GitHub, GitLab, other server).
How do you do this?
@y
Suppose you have a branch that is called _bad-branch-name_ and you want to change it to _corrected-branch-name_, while keeping all history.
You also want to change the branch name on the remote (GitHub, GitLab, other server).
How do you do this?
@z

@x
Rename the branch locally with the `git branch --move` command:
@y
Rename the branch locally with the `git branch --move` command:
@z

@x
[source, console]
----
$ git branch --move bad-branch-name corrected-branch-name
----
@y
[source, console]
----
$ git branch --move bad-branch-name corrected-branch-name
----
@z

@x
This replaces your bad-branch-name with corrected-branch-name, but this change is only local for now.
To let others see the corrected branch on the remote, push it:
@y
This replaces your bad-branch-name with corrected-branch-name, but this change is only local for now.
To let others see the corrected branch on the remote, push it:
@z

@x
[source,console]
----
$ git push --set-upstream origin corrected-branch-name
----
@y
[source,console]
----
$ git push --set-upstream origin corrected-branch-name
----
@z

@x
Now we'll take a brief look at where we are now:
@y
Now we'll take a brief look at where we are now:
@z

@x
[source, console]
----
$ git branch --all
* corrected-branch-name
  main
  remotes/origin/bad-branch-name
  remotes/origin/corrected-branch-name
  remotes/origin/main
----
@y
[source, console]
----
$ git branch --all
* corrected-branch-name
  main
  remotes/origin/bad-branch-name
  remotes/origin/corrected-branch-name
  remotes/origin/main
----
@z

@x
Notice that you're on the branch corrected-branch-name.
The corrected branch is available on the remote.
However the bad branch is also still present on the remote.
You can delete the bad branch from the remote:
@y
Notice that you're on the branch corrected-branch-name.
The corrected branch is available on the remote.
However the bad branch is also still present on the remote.
You can delete the bad branch from the remote:
@z

@x
[source,console]
----
$ git push origin --delete bad-branch-name
----
@y
[source,console]
----
$ git push origin --delete bad-branch-name
----
@z

@x
Now the bad branch name is fully replaced with the corrected branch name.
@y
Now the bad branch name is fully replaced with the corrected branch name.
@z

@x
===== Changing the master branch name
@y
===== Changing the master branch name
@z

@x
[WARNING]
====
Changing the name of a branch like master/main/mainline/default will break the integrations, services, helper utilities and build/release scripts that your repository uses.
Before you do this, make sure you consult with your collaborators.
Also make sure you do a thorough search through your repo and update any references to the old branch name in your code or scripts.
====
@y
[WARNING]
====
Changing the name of a branch like master/main/mainline/default will break the integrations, services, helper utilities and build/release scripts that your repository uses.
Before you do this, make sure you consult with your collaborators.
Also make sure you do a thorough search through your repo and update any references to the old branch name in your code or scripts.
====
@z

@x
Rename your local _master_ branch into _main_ with the following command
@y
Rename your local _master_ branch into _main_ with the following command
@z

@x
[source,console]
----
$ git branch --move master main
----
@y
[source,console]
----
$ git branch --move master main
----
@z

@x
There's no _master_ branch locally anymore, because it's renamed to the _main_ branch.
@y
There's no _master_ branch locally anymore, because it's renamed to the _main_ branch.
@z

@x
To let others see the new _main_ branch, you need to push it to the remote.
This makes the renamed branch available on the remote.
@y
To let others see the new _main_ branch, you need to push it to the remote.
This makes the renamed branch available on the remote.
@z

@x
[source,console]
----
$ git push --set-upstream origin main
----
@y
[source,console]
----
$ git push --set-upstream origin main
----
@z

@x
Now we end up with the following state:
@y
Now we end up with the following state:
@z

@x
[source,console]
----
git branch --all
* main
  remotes/origin/HEAD -> origin/master
  remotes/origin/main
  remotes/origin/master
----
@y
[source,console]
----
git branch --all
* main
  remotes/origin/HEAD -> origin/master
  remotes/origin/main
  remotes/origin/master
----
@z

@x
Your local _master_ branch is gone, as it's replaced with the _main_ branch.
The _main_ branch is also available on the remote.
But the remote still has a _master_ branch.
Other collaborators will continue to use the _master_ branch as the base of their work, until you make some further changes.
@y
Your local _master_ branch is gone, as it's replaced with the _main_ branch.
The _main_ branch is also available on the remote.
But the remote still has a _master_ branch.
Other collaborators will continue to use the _master_ branch as the base of their work, until you make some further changes.
@z

@x
Now you have a few more tasks in front of you to complete the transition:
@y
Now you have a few more tasks in front of you to complete the transition:
@z

@x
* Any projects that depend on this one will need to update their code and/or configuration.
* Update any test-runner configuration files.
* Adjust build and release scripts.
* Redirect settings on your repo host for things like the repo's default branch, merge rules, and other things that match branch names.
* Update references to the old branch in documentation.
* Close or merge any pull requests that target the old branch.
@y
* Any projects that depend on this one will need to update their code and/or configuration.
* Update any test-runner configuration files.
* Adjust build and release scripts.
* Redirect settings on your repo host for things like the repo's default branch, merge rules, and other things that match branch names.
* Update references to the old branch in documentation.
* Close or merge any pull requests that target the old branch.
@z

@x
After you've done all these tasks, and are certain the main branch performs just as the _master_ branch, you can delete the _master_ branch:
@y
After you've done all these tasks, and are certain the main branch performs just as the _master_ branch, you can delete the _master_ branch:
@z

@x
[source, console]
----
$ git push origin --delete master
----
@y
[source, console]
----
$ git push origin --delete master
----
@z
