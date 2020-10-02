%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ch03-git-branching]]
== Git Branching
@y
[[ch03-git-branching]]
== Git Branching
@z

@x
(((branches)))
Nearly every VCS has some form of branching support.
Branching means you diverge from the main line of development and continue to do work without messing with that main line.
In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large projects.
@y
(((branches)))
Nearly every VCS has some form of branching support.
Branching means you diverge from the main line of development and continue to do work without messing with that main line.
In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large projects.
@z

@x
Some people refer to Git's branching model as its ``killer feature,'' and it certainly sets Git apart in the VCS community.
Why is it so special?
The way Git branches is incredibly lightweight, making branching operations nearly instantaneous, and switching back and forth between branches generally just as fast.
Unlike many other VCSs, Git encourages workflows that branch and merge often, even multiple times in a day.
Understanding and mastering this feature gives you a powerful and unique tool and can entirely change the way that you develop.
@y
Some people refer to Git's branching model as its ``killer feature,'' and it certainly sets Git apart in the VCS community.
Why is it so special?
The way Git branches is incredibly lightweight, making branching operations nearly instantaneous, and switching back and forth between branches generally just as fast.
Unlike many other VCSs, Git encourages workflows that branch and merge often, even multiple times in a day.
Understanding and mastering this feature gives you a powerful and unique tool and can entirely change the way that you develop.
@z

@x
include::book/03-git-branching/sections/nutshell.asc[]
@y
include::book/03-git-branching/sections/nutshell.asc[]
@z

@x
include::book/03-git-branching/sections/basic-branching-and-merging.asc[]
@y
include::book/03-git-branching/sections/basic-branching-and-merging.asc[]
@z

@x
include::book/03-git-branching/sections/branch-management.asc[]
@y
include::book/03-git-branching/sections/branch-management.asc[]
@z

@x
include::book/03-git-branching/sections/workflows.asc[]
@y
include::book/03-git-branching/sections/workflows.asc[]
@z

@x
include::book/03-git-branching/sections/remote-branches.asc[]
@y
include::book/03-git-branching/sections/remote-branches.asc[]
@z

@x
include::book/03-git-branching/sections/rebasing.asc[]
@y
include::book/03-git-branching/sections/rebasing.asc[]
@z

@x
=== Summary
@y
=== Summary
@z

@x
We've covered basic branching and merging in Git.
You should feel comfortable creating and switching to new branches, switching between branches and merging local branches together.
You should also be able to share your branches by pushing them to a shared server, working with others on shared branches and rebasing your branches before they are shared.
Next, we'll cover what you'll need to run your own Git repository-hosting server.
@y
We've covered basic branching and merging in Git.
You should feel comfortable creating and switching to new branches, switching between branches and merging local branches together.
You should also be able to share your branches by pushing them to a shared server, working with others on shared branches and rebasing your branches before they are shared.
Next, we'll cover what you'll need to run your own Git repository-hosting server.
@z
