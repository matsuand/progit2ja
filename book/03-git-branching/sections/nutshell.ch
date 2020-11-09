%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_branches_overview]]
@y
[[_git_branches_overview]]
@z

@x
=== Branches in a Nutshell
@y
//////////////////////////
=== Branches in a Nutshell
//////////////////////////
=== ブランチと言えば
@z

@x
To really understand the way Git does branching, we need to take a step back and examine how Git stores its data.
@y
//////////////////////////
To really understand the way Git does branching, we need to take a step back and examine how Git stores its data.
//////////////////////////
Git によるブランチ仕組みをしっかりと理解するには、Git のデータ保存方法に立ち戻って確認することが必要になります。
@z

@x
As you may remember from <<ch01-getting-started#what_is_git_section>>, Git doesn't store data as a series of changesets or differences, but instead as a series of _snapshots_.
@y
//////////////////////////
As you may remember from <<ch01-getting-started#what_is_git_section>>, Git doesn't store data as a series of changesets or differences, but instead as a series of _snapshots_.
//////////////////////////
As you may remember from <<ch01-getting-started#what_is_git_section>>, Git doesn't store data as a series of changesets or differences, but instead as a series of _snapshots_.
@z

@x
When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged.
This object also contains the author's name and email address, the message that you typed, and pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or more branches.
@y
//////////////////////////
//////////////////////////
When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged.
This object also contains the author's name and email address, the message that you typed, and pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or more branches.
@z

@x
To visualize this, let's assume that you have a directory containing three files, and you stage them all and commit.
Staging the files computes a checksum for each one (the SHA-1 hash we mentioned in <<ch01-getting-started#what_is_git_section>>), stores that version of the file in the Git repository (Git refers to them as _blobs_), and adds that checksum to the staging area:
@y
//////////////////////////
//////////////////////////
To visualize this, let's assume that you have a directory containing three files, and you stage them all and commit.
Staging the files computes a checksum for each one (the SHA-1 hash we mentioned in <<ch01-getting-started#what_is_git_section>>), stores that version of the file in the Git repository (Git refers to them as _blobs_), and adds that checksum to the staging area:
@z

@x
[source,console]
----
$ git add README test.rb LICENSE
$ git commit -m 'Initial commit'
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git add README test.rb LICENSE
$ git commit -m 'Initial commit'
----
@z

@x
When you create the commit by running `git commit`, Git checksums each subdirectory (in this case, just the root project directory) and stores them as a tree object in the Git repository.
Git then creates a commit object that has the metadata and a pointer to the root project tree so it can re-create that snapshot when needed.(((git commands, commit)))
@y
//////////////////////////
//////////////////////////
When you create the commit by running `git commit`, Git checksums each subdirectory (in this case, just the root project directory) and stores them as a tree object in the Git repository.
Git then creates a commit object that has the metadata and a pointer to the root project tree so it can re-create that snapshot when needed.(((git commands, commit)))
@z

@x
Your Git repository now contains five objects: three _blobs_ (each representing the contents of one of the three files), one _tree_ that lists the contents of the directory and specifies which file names are stored as which blobs, and one _commit_ with the pointer to that root tree and all the commit metadata.
@y
//////////////////////////
//////////////////////////
Your Git repository now contains five objects: three _blobs_ (each representing the contents of one of the three files), one _tree_ that lists the contents of the directory and specifies which file names are stored as which blobs, and one _commit_ with the pointer to that root tree and all the commit metadata.
@z

@x
.A commit and its tree
image::images/commit-and-tree.png[A commit and its tree]
@y
//////////////////////////
//////////////////////////
.A commit and its tree
image::images/commit-and-tree.png[A commit and its tree]
@z

@x
If you make some changes and commit again, the next commit stores a pointer to the commit that came immediately before it.
@y
//////////////////////////
//////////////////////////
If you make some changes and commit again, the next commit stores a pointer to the commit that came immediately before it.
@z

@x
.Commits and their parents
image::images/commits-and-parents.png[Commits and their parents]
@y
//////////////////////////
//////////////////////////
.Commits and their parents
image::images/commits-and-parents.png[Commits and their parents]
@z

@x
A branch in Git is simply a lightweight movable pointer to one of these commits.
The default branch name in Git is `master`.
As you start making commits, you're given a `master` branch that points to the last commit you made.
Every time you commit, the `master` branch pointer moves forward automatically.
@y
//////////////////////////
//////////////////////////
A branch in Git is simply a lightweight movable pointer to one of these commits.
The default branch name in Git is `master`.
As you start making commits, you're given a `master` branch that points to the last commit you made.
Every time you commit, the `master` branch pointer moves forward automatically.
@z

@x
[NOTE]
====
The "`master`" branch in Git is not a special branch.(((master)))
It is exactly like any other branch.
The only reason nearly every repository has one is that the `git init` command creates it by default and most people don't bother to change it.
====
@y
//////////////////////////
[NOTE]
====
The "`master`" branch in Git is not a special branch.(((master)))
It is exactly like any other branch.
The only reason nearly every repository has one is that the `git init` command creates it by default and most people don't bother to change it.
====
//////////////////////////
[NOTE]
====
The "`master`" branch in Git is not a special branch.(((master)))
It is exactly like any other branch.
The only reason nearly every repository has one is that the `git init` command creates it by default and most people don't bother to change it.
====
@z

@x
.A branch and its commit history
image::images/branch-and-history.png[A branch and its commit history]
@y
//////////////////////////
//////////////////////////
.A branch and its commit history
image::images/branch-and-history.png[A branch and its commit history]
@z

@x
[[_create_new_branch]]
==== Creating a New Branch
@y
//////////////////////////
//////////////////////////
[[_create_new_branch]]
==== Creating a New Branch
@z

@x
(((branches, creating)))
What happens when you create a new branch?
Well, doing so creates a new pointer for you to move around.
Let's say you want to create a new branch called `testing`.
You do this with the `git branch` command:(((git commands, branch)))
@y
//////////////////////////
//////////////////////////
(((branches, creating)))
What happens when you create a new branch?
Well, doing so creates a new pointer for you to move around.
Let's say you want to create a new branch called `testing`.
You do this with the `git branch` command:(((git commands, branch)))
@z

@x
[source,console]
----
$ git branch testing
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git branch testing
----
@z

@x
This creates a new pointer to the same commit you're currently on.
@y
//////////////////////////
//////////////////////////
This creates a new pointer to the same commit you're currently on.
@z

@x
.Two branches pointing into the same series of commits
image::images/two-branches.png[Two branches pointing into the same series of commits]
@y
//////////////////////////
//////////////////////////
.Two branches pointing into the same series of commits
image::images/two-branches.png[Two branches pointing into the same series of commits]
@z

@x
How does Git know what branch you're currently on?
It keeps a special pointer called `HEAD`.
Note that this is a lot different than the concept of `HEAD` in other VCSs you may be used to, such as Subversion or CVS.
In Git, this is a pointer to the local branch you're currently on.
In this case, you're still on `master`.
The `git branch` command only _created_ a new branch -- it didn't switch to that branch.
@y
//////////////////////////
//////////////////////////
How does Git know what branch you're currently on?
It keeps a special pointer called `HEAD`.
Note that this is a lot different than the concept of `HEAD` in other VCSs you may be used to, such as Subversion or CVS.
In Git, this is a pointer to the local branch you're currently on.
In this case, you're still on `master`.
The `git branch` command only _created_ a new branch -- it didn't switch to that branch.
@z

@x
.HEAD pointing to a branch
image::images/head-to-master.png[HEAD pointing to a branch]
@y
//////////////////////////
//////////////////////////
.HEAD pointing to a branch
image::images/head-to-master.png[HEAD pointing to a branch]
@z

@x
You can easily see this by running a simple `git log` command that shows you where the branch pointers are pointing.
This option is called `--decorate`.
@y
//////////////////////////
//////////////////////////
You can easily see this by running a simple `git log` command that shows you where the branch pointers are pointing.
This option is called `--decorate`.
@z

@x
[source,console]
----
$ git log --oneline --decorate
f30ab (HEAD -> master, testing) Add feature #32 - ability to add new formats to the central interface
34ac2 Fix bug #1328 - stack overflow under certain conditions
98ca9 Initial commit
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git log --oneline --decorate
f30ab (HEAD -> master, testing) Add feature #32 - ability to add new formats to the central interface
34ac2 Fix bug #1328 - stack overflow under certain conditions
98ca9 Initial commit
----
@z

@x
You can see the `master` and `testing` branches that are right there next to the `f30ab` commit.
@y
//////////////////////////
//////////////////////////
You can see the `master` and `testing` branches that are right there next to the `f30ab` commit.
@z

@x
[[_switching_branches]]
==== Switching Branches
@y
//////////////////////////
//////////////////////////
[[_switching_branches]]
==== Switching Branches
@z

@x
(((branches, switching)))
To switch to an existing branch, you run the `git checkout` command.(((git commands, checkout)))
Let's switch to the new `testing` branch:
@y
//////////////////////////
//////////////////////////
(((branches, switching)))
To switch to an existing branch, you run the `git checkout` command.(((git commands, checkout)))
Let's switch to the new `testing` branch:
@z

@x
[source,console]
----
$ git checkout testing
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git checkout testing
----
@z

@x
This moves `HEAD` to point to the `testing` branch.
@y
//////////////////////////
//////////////////////////
This moves `HEAD` to point to the `testing` branch.
@z

@x
.HEAD points to the current branch
image::images/head-to-testing.png[HEAD points to the current branch]
@y
//////////////////////////
//////////////////////////
.HEAD points to the current branch
image::images/head-to-testing.png[HEAD points to the current branch]
@z

@x
What is the significance of that?
Well, let's do another commit:
@y
//////////////////////////
//////////////////////////
What is the significance of that?
Well, let's do another commit:
@z

@x
[source,console]
----
$ vim test.rb
$ git commit -a -m 'made a change'
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ vim test.rb
$ git commit -a -m 'made a change'
----
@z

@x
.The HEAD branch moves forward when a commit is made
image::images/advance-testing.png[The HEAD branch moves forward when a commit is made]
@y
//////////////////////////
//////////////////////////
.The HEAD branch moves forward when a commit is made
image::images/advance-testing.png[The HEAD branch moves forward when a commit is made]
@z

@x
This is interesting, because now your `testing` branch has moved forward, but your `master` branch still points to the commit you were on when you ran `git checkout` to switch branches.
Let's switch back to the `master` branch:
@y
//////////////////////////
//////////////////////////
This is interesting, because now your `testing` branch has moved forward, but your `master` branch still points to the commit you were on when you ran `git checkout` to switch branches.
Let's switch back to the `master` branch:
@z

@x
[source,console]
----
$ git checkout master
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git checkout master
----
@z

@x
[NOTE]
.`git log` doesn't show _all_ the branches _all_ the time
====
If you were to run `git log` right now, you might wonder where the "testing" branch you just created went, as it would not appear in the output.
@y
//////////////////////////
//////////////////////////
[NOTE]
.`git log` doesn't show _all_ the branches _all_ the time
====
If you were to run `git log` right now, you might wonder where the "testing" branch you just created went, as it would not appear in the output.
@z

@x
The branch hasn't disappeared; Git just doesn't know that you're interested in that branch and it is trying to show you what it thinks you're interested in.
In other words, by default, `git log` will only show commit history below the branch you've checked out.
@y
//////////////////////////
//////////////////////////
The branch hasn't disappeared; Git just doesn't know that you're interested in that branch and it is trying to show you what it thinks you're interested in.
In other words, by default, `git log` will only show commit history below the branch you've checked out.
@z

@x
To show commit history for the desired branch you have to explicitly specify it: `git log testing`.
To show all of the branches, add `--all` to your `git log` command.
====
@y
//////////////////////////
//////////////////////////
To show commit history for the desired branch you have to explicitly specify it: `git log testing`.
To show all of the branches, add `--all` to your `git log` command.
====
@z

@x
.HEAD moves when you checkout
image::images/checkout-master.png[HEAD moves when you checkout]
@y
//////////////////////////
//////////////////////////
.HEAD moves when you checkout
image::images/checkout-master.png[HEAD moves when you checkout]
@z

@x
That command did two things.
It moved the HEAD pointer back to point to the `master` branch, and it reverted the files in your working directory back to the snapshot that `master` points to.
This also means the changes you make from this point forward will diverge from an older version of the project.
It essentially rewinds the work you've done in your `testing` branch so you can go in a different direction.
@y
//////////////////////////
//////////////////////////
That command did two things.
It moved the HEAD pointer back to point to the `master` branch, and it reverted the files in your working directory back to the snapshot that `master` points to.
This also means the changes you make from this point forward will diverge from an older version of the project.
It essentially rewinds the work you've done in your `testing` branch so you can go in a different direction.
@z

@x
[NOTE]
.Switching branches changes files in your working directory
====
It's important to note that when you switch branches in Git, files in your working directory will change.
If you switch to an older branch, your working directory will be reverted to look like it did the last time you committed on that branch.
If Git cannot do it cleanly, it will not let you switch at all.
====
@y
//////////////////////////
//////////////////////////
[NOTE]
.Switching branches changes files in your working directory
====
It's important to note that when you switch branches in Git, files in your working directory will change.
If you switch to an older branch, your working directory will be reverted to look like it did the last time you committed on that branch.
If Git cannot do it cleanly, it will not let you switch at all.
====
@z

@x
Let's make a few changes and commit again:
@y
//////////////////////////
//////////////////////////
Let's make a few changes and commit again:
@z

@x
[source,console]
----
$ vim test.rb
$ git commit -a -m 'made other changes'
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ vim test.rb
$ git commit -a -m 'made other changes'
----
@z

@x
Now your project history has diverged (see <<divergent_history>>).
You created and switched to a branch, did some work on it, and then switched back to your main branch and did other work.
Both of those changes are isolated in separate branches: you can switch back and forth between the branches and merge them together when you're ready.
And you did all that with simple `branch`, `checkout`, and `commit` commands.
@y
//////////////////////////
//////////////////////////
Now your project history has diverged (see <<divergent_history>>).
You created and switched to a branch, did some work on it, and then switched back to your main branch and did other work.
Both of those changes are isolated in separate branches: you can switch back and forth between the branches and merge them together when you're ready.
And you did all that with simple `branch`, `checkout`, and `commit` commands.
@z

@x
[[divergent_history]]
.Divergent history
image::images/advance-master.png[Divergent history]
@y
//////////////////////////
//////////////////////////
[[divergent_history]]
.Divergent history
image::images/advance-master.png[Divergent history]
@z

@x
You can also see this easily with the `git log` command.
If you run `git log --oneline --decorate --graph --all` it will print out the history of your commits, showing where your branch pointers are and how your history has diverged.
@y
//////////////////////////
//////////////////////////
You can also see this easily with the `git log` command.
If you run `git log --oneline --decorate --graph --all` it will print out the history of your commits, showing where your branch pointers are and how your history has diverged.
@z

@x
[source,console]
----
$ git log --oneline --decorate --graph --all
* c2b9e (HEAD, master) Made other changes
| * 87ab2 (testing) Made a change
|/
* f30ab Add feature #32 - ability to add new formats to the central interface
* 34ac2 Fix bug #1328 - stack overflow under certain conditions
* 98ca9 initial commit of my project
----
@y
//////////////////////////
//////////////////////////
[source,console]
----
$ git log --oneline --decorate --graph --all
* c2b9e (HEAD, master) Made other changes
| * 87ab2 (testing) Made a change
|/
* f30ab Add feature #32 - ability to add new formats to the central interface
* 34ac2 Fix bug #1328 - stack overflow under certain conditions
* 98ca9 initial commit of my project
----
@z

@x
Because a branch in Git is actually a simple file that contains the 40 character SHA-1 checksum of the commit it points to, branches are cheap to create and destroy.
Creating a new branch is as quick and simple as writing 41 bytes to a file (40 characters and a newline).
@y
//////////////////////////
//////////////////////////
Because a branch in Git is actually a simple file that contains the 40 character SHA-1 checksum of the commit it points to, branches are cheap to create and destroy.
Creating a new branch is as quick and simple as writing 41 bytes to a file (40 characters and a newline).
@z

@x
This is in sharp contrast to the way most older VCS tools branch, which involves copying all of the project's files into a second directory.
This can take several seconds or even minutes, depending on the size of the project, whereas in Git the process is always instantaneous.
Also, because we're recording the parents when we commit, finding a proper merge base for merging is automatically done for us and is generally very easy to do.
These features help encourage developers to create and use branches often.
@y
//////////////////////////
//////////////////////////
This is in sharp contrast to the way most older VCS tools branch, which involves copying all of the project's files into a second directory.
This can take several seconds or even minutes, depending on the size of the project, whereas in Git the process is always instantaneous.
Also, because we're recording the parents when we commit, finding a proper merge base for merging is automatically done for us and is generally very easy to do.
These features help encourage developers to create and use branches often.
@z

@x
Let's see why you should do so.
@y
//////////////////////////
//////////////////////////
Let's see why you should do so.
@z

@x
[NOTE]
.Creating a new branch and switching to it at the same time
====
It's typical to create a new branch and want to switch to that new branch at the same time -- this can be done in one operation with `git checkout -b <newbranchname>`.
====
@y
//////////////////////////
//////////////////////////
[NOTE]
.Creating a new branch and switching to it at the same time
====
It's typical to create a new branch and want to switch to that new branch at the same time -- this can be done in one operation with `git checkout -b <newbranchname>`.
====
@z

@x
[NOTE]
====
From Git version 2.23 onwards you can use `git switch` instead of `git checkout` to:

- Switch to an existing branch: `git switch testing-branch`.
- Create a new branch and switch to it: `git switch -c new-branch`. The `-c` flag stands for create, you can also use the full flag: `--create`.
- Return to your previously checked out branch: `git switch -`.
====
@y
//////////////////////////
//////////////////////////
[NOTE]
====
From Git version 2.23 onwards you can use `git switch` instead of `git checkout` to:

- Switch to an existing branch: `git switch testing-branch`.
- Create a new branch and switch to it: `git switch -c new-branch`. The `-c` flag stands for create, you can also use the full flag: `--create`.
- Return to your previously checked out branch: `git switch -`.
====
@z
