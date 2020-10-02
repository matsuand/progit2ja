%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Graphical Interfaces
@y
=== Graphical Interfaces
@z

@x
(((GUIs)))(((Graphical tools)))
Git's native environment is in the terminal.
New features show up there first, and only at the command line is the full power of Git completely at your disposal.
But plain text isn't the best choice for all tasks; sometimes a visual representation is what you need, and some users are much more comfortable with a point-and-click interface.
@y
(((GUIs)))(((Graphical tools)))
Git's native environment is in the terminal.
New features show up there first, and only at the command line is the full power of Git completely at your disposal.
But plain text isn't the best choice for all tasks; sometimes a visual representation is what you need, and some users are much more comfortable with a point-and-click interface.
@z

@x
It's important to note that different interfaces are tailored for different workflows.
Some clients expose only a carefully curated subset of Git functionality, in order to support a specific way of working that the author considers effective.
When viewed in this light, none of these tools can be called ``better'' than any of the others, they're simply more fit for their intended purpose.
Also note that there's nothing these graphical clients can do that the command-line client can't; the command-line is still where you'll have the most power and control when working with your repositories.
@y
It's important to note that different interfaces are tailored for different workflows.
Some clients expose only a carefully curated subset of Git functionality, in order to support a specific way of working that the author considers effective.
When viewed in this light, none of these tools can be called ``better'' than any of the others, they're simply more fit for their intended purpose.
Also note that there's nothing these graphical clients can do that the command-line client can't; the command-line is still where you'll have the most power and control when working with your repositories.
@z

@x
==== `gitk` and `git-gui`
@y
==== `gitk` and `git-gui`
@z

@x
(((git commands, gitk)))(((git commands, gui)))(((gitk)))
When you install Git, you also get its visual tools, `gitk` and `git-gui`.
@y
(((git commands, gitk)))(((git commands, gui)))(((gitk)))
When you install Git, you also get its visual tools, `gitk` and `git-gui`.
@z

@x
`gitk` is a graphical history viewer.
Think of it like a powerful GUI shell over `git log` and `git grep`.
This is the tool to use when you're trying to find something that happened in the past, or visualize your project's history.
@y
`gitk` is a graphical history viewer.
Think of it like a powerful GUI shell over `git log` and `git grep`.
This is the tool to use when you're trying to find something that happened in the past, or visualize your project's history.
@z

@x
Gitk is easiest to invoke from the command-line.
Just `cd` into a Git repository, and type:
@y
Gitk is easiest to invoke from the command-line.
Just `cd` into a Git repository, and type:
@z

@x
[source,console]
----
$ gitk [git log options]
----
@y
[source,console]
----
$ gitk [git log options]
----
@z

@x
Gitk accepts many command-line options, most of which are passed through to the underlying `git log` action.
Probably one of the most useful is the `--all` flag, which tells gitk to show commits reachable from _any_ ref, not just HEAD.
Gitk's interface looks like this:
@y
Gitk accepts many command-line options, most of which are passed through to the underlying `git log` action.
Probably one of the most useful is the `--all` flag, which tells gitk to show commits reachable from _any_ ref, not just HEAD.
Gitk's interface looks like this:
@z

@x
.The `gitk` history viewer
image::images/gitk.png[The `gitk` history viewer]
@y
.The `gitk` history viewer
image::images/gitk.png[The `gitk` history viewer]
@z

@x
On the top is something that looks a bit like the output of `git log --graph`; each dot represents a commit, the lines represent parent relationships, and refs are shown as colored boxes.
The yellow dot represents HEAD, and the red dot represents changes that are yet to become a commit.
At the bottom is a view of the selected commit; the comments and patch on the left, and a summary view on the right.
In between is a collection of controls used for searching history.
@y
On the top is something that looks a bit like the output of `git log --graph`; each dot represents a commit, the lines represent parent relationships, and refs are shown as colored boxes.
The yellow dot represents HEAD, and the red dot represents changes that are yet to become a commit.
At the bottom is a view of the selected commit; the comments and patch on the left, and a summary view on the right.
In between is a collection of controls used for searching history.
@z

@x
`git-gui`, on the other hand, is primarily a tool for crafting commits.
It, too, is easiest to invoke from the command line:
@y
`git-gui`, on the other hand, is primarily a tool for crafting commits.
It, too, is easiest to invoke from the command line:
@z

@x
[source,console]
----
$ git gui
----
@y
[source,console]
----
$ git gui
----
@z

@x
And it looks something like this:
@y
And it looks something like this:
@z

@x
.The `git-gui` commit tool
image::images/git-gui.png[The `git-gui` commit tool]
@y
.The `git-gui` commit tool
image::images/git-gui.png[The `git-gui` commit tool]
@z

@x
On the left is the index; unstaged changes are on top, staged changes on the bottom.
You can move entire files between the two states by clicking on their icons, or you can select a file for viewing by clicking on its name.
@y
On the left is the index; unstaged changes are on top, staged changes on the bottom.
You can move entire files between the two states by clicking on their icons, or you can select a file for viewing by clicking on its name.
@z

@x
At top right is the diff view, which shows the changes for the currently-selected file.
You can stage individual hunks (or individual lines) by right-clicking in this area.
@y
At top right is the diff view, which shows the changes for the currently-selected file.
You can stage individual hunks (or individual lines) by right-clicking in this area.
@z

@x
At the bottom right is the message and action area.
Type your message into the text box and click ``Commit'' to do something similar to `git commit`.
You can also choose to amend the last commit by choosing the ``Amend'' radio button, which will update the ``Staged Changes'' area with the contents of the last commit.
Then you can simply stage or unstage some changes, alter the commit message, and click ``Commit'' again to replace the old commit with a new one.
@y
At the bottom right is the message and action area.
Type your message into the text box and click ``Commit'' to do something similar to `git commit`.
You can also choose to amend the last commit by choosing the ``Amend'' radio button, which will update the ``Staged Changes'' area with the contents of the last commit.
Then you can simply stage or unstage some changes, alter the commit message, and click ``Commit'' again to replace the old commit with a new one.
@z

@x
`gitk` and `git-gui` are examples of task-oriented tools.
Each of them is tailored for a specific purpose (viewing history and creating commits, respectively), and omit the features not necessary for that task.
@y
`gitk` and `git-gui` are examples of task-oriented tools.
Each of them is tailored for a specific purpose (viewing history and creating commits, respectively), and omit the features not necessary for that task.
@z

@x
==== GitHub for macOS and Windows
@y
==== GitHub for macOS and Windows
@z

@x
(((GitHub for macOS)))(((GitHub for Windows)))
GitHub has created two workflow-oriented Git clients: one for Windows, and one for macOS.
These clients are a good example of workflow-oriented tools – rather than expose _all_ of Git's functionality, they instead focus on a curated set of commonly-used features that work well together.
They look like this:
@y
(((GitHub for macOS)))(((GitHub for Windows)))
GitHub has created two workflow-oriented Git clients: one for Windows, and one for macOS.
These clients are a good example of workflow-oriented tools – rather than expose _all_ of Git's functionality, they instead focus on a curated set of commonly-used features that work well together.
They look like this:
@z

@x
.GitHub for macOS
image::images/github_mac.png[GitHub for macOS]
@y
.GitHub for macOS
image::images/github_mac.png[GitHub for macOS]
@z

@x
.GitHub for Windows
image::images/github_win.png[GitHub for Windows]
@y
.GitHub for Windows
image::images/github_win.png[GitHub for Windows]
@z

@x
They are designed to look and work very much alike, so we'll treat them like a single product in this chapter.
We won't be doing a detailed rundown of these tools (they have their own documentation), but a quick tour of the ``changes'' view (which is where you'll spend most of your time) is in order.
@y
They are designed to look and work very much alike, so we'll treat them like a single product in this chapter.
We won't be doing a detailed rundown of these tools (they have their own documentation), but a quick tour of the ``changes'' view (which is where you'll spend most of your time) is in order.
@z

@x
* On the left is the list of repositories the client is tracking; you can add a repository (either by cloning or attaching locally) by clicking the ``+'' icon at the top of this area.
* In the center is a commit-input area, which lets you input a commit message, and select which files should be included.
  On Windows, the commit history is displayed directly below this; on macOS, it's on a separate tab.
* On the right is a diff view, which shows what's changed in your working directory, or which changes were included in the selected commit.
* The last thing to notice is the ``Sync'' button at the top-right, which is the primary way you interact over the network.
@y
* On the left is the list of repositories the client is tracking; you can add a repository (either by cloning or attaching locally) by clicking the ``+'' icon at the top of this area.
* In the center is a commit-input area, which lets you input a commit message, and select which files should be included.
  On Windows, the commit history is displayed directly below this; on macOS, it's on a separate tab.
* On the right is a diff view, which shows what's changed in your working directory, or which changes were included in the selected commit.
* The last thing to notice is the ``Sync'' button at the top-right, which is the primary way you interact over the network.
@z

@x
[NOTE]
====
You don't need a GitHub account to use these tools.
While they're designed to highlight GitHub's service and recommended workflow, they will happily work with any repository, and do network operations with any Git host.
====
@y
[NOTE]
====
You don't need a GitHub account to use these tools.
While they're designed to highlight GitHub's service and recommended workflow, they will happily work with any repository, and do network operations with any Git host.
====
@z

@x
===== Installation
@y
===== Installation
@z

@x
GitHub for Windows can be downloaded from https://windows.github.com[], and GitHub for macOS from https://mac.github.com[].
When the applications are first run, they walk you through all the first-time Git setup, such as configuring your name and email address, and both set up sane defaults for many common configuration options, such as credential caches and CRLF behavior.
@y
GitHub for Windows can be downloaded from https://windows.github.com[], and GitHub for macOS from https://mac.github.com[].
When the applications are first run, they walk you through all the first-time Git setup, such as configuring your name and email address, and both set up sane defaults for many common configuration options, such as credential caches and CRLF behavior.
@z

@x
Both are ``evergreen'' – updates are downloaded and installed in the background while the applications are open.
This helpfully includes a bundled version of Git, which means you probably won't have to worry about manually updating it again.
On Windows, the client includes a shortcut to launch PowerShell with Posh-git, which we'll talk more about later in this chapter.
@y
Both are ``evergreen'' – updates are downloaded and installed in the background while the applications are open.
This helpfully includes a bundled version of Git, which means you probably won't have to worry about manually updating it again.
On Windows, the client includes a shortcut to launch PowerShell with Posh-git, which we'll talk more about later in this chapter.
@z

@x
The next step is to give the tool some repositories to work with.
The client shows you a list of the repositories you have access to on GitHub, and can clone them in one step.
If you already have a local repository, just drag its directory from the Finder or Windows Explorer into the GitHub client window, and it will be included in the list of repositories on the left.
@y
The next step is to give the tool some repositories to work with.
The client shows you a list of the repositories you have access to on GitHub, and can clone them in one step.
If you already have a local repository, just drag its directory from the Finder or Windows Explorer into the GitHub client window, and it will be included in the list of repositories on the left.
@z

@x
===== Recommended Workflow
@y
===== Recommended Workflow
@z

@x
Once it's installed and configured, you can use the GitHub client for many common Git tasks.
The intended workflow for this tool is sometimes called the ``GitHub Flow.''
We cover this in more detail in <<ch06-github#ch06-github_flow>>, but the general gist is that (a) you'll be committing to a branch, and (b) you'll be syncing up with a remote repository fairly regularly.
@y
Once it's installed and configured, you can use the GitHub client for many common Git tasks.
The intended workflow for this tool is sometimes called the ``GitHub Flow.''
We cover this in more detail in <<ch06-github#ch06-github_flow>>, but the general gist is that (a) you'll be committing to a branch, and (b) you'll be syncing up with a remote repository fairly regularly.
@z

@x
Branch management is one of the areas where the two tools diverge.
On macOS, there's a button at the top of the window for creating a new branch:
@y
Branch management is one of the areas where the two tools diverge.
On macOS, there's a button at the top of the window for creating a new branch:
@z

@x
.``Create Branch'' button on macOS
image::images/branch_widget_mac.png[``Create Branch'' button on macOS]
@y
.``Create Branch'' button on macOS
image::images/branch_widget_mac.png[``Create Branch'' button on macOS]
@z

@x
On Windows, this is done by typing the new branch's name in the branch-switching widget:
@y
On Windows, this is done by typing the new branch's name in the branch-switching widget:
@z

@x
.Creating a branch on Windows
image::images/branch_widget_win.png[Creating a branch on Windows]
@y
.Creating a branch on Windows
image::images/branch_widget_win.png[Creating a branch on Windows]
@z

@x
Once your branch is created, making new commits is fairly straightforward.
Make some changes in your working directory, and when you switch to the GitHub client window, it will show you which files changed.
Enter a commit message, select the files you'd like to include, and click the ``Commit'' button (ctrl-enter or ⌘-enter).
@y
Once your branch is created, making new commits is fairly straightforward.
Make some changes in your working directory, and when you switch to the GitHub client window, it will show you which files changed.
Enter a commit message, select the files you'd like to include, and click the ``Commit'' button (ctrl-enter or ⌘-enter).
@z

@x
The main way you interact with other repositories over the network is through the ``Sync'' feature.
Git internally has separate operations for pushing, fetching, merging, and rebasing, but the GitHub clients collapse all of these into one multi-step feature.
Here's what happens when you click the Sync button:
@y
The main way you interact with other repositories over the network is through the ``Sync'' feature.
Git internally has separate operations for pushing, fetching, merging, and rebasing, but the GitHub clients collapse all of these into one multi-step feature.
Here's what happens when you click the Sync button:
@z

@x
. `git pull --rebase`.
  If this fails because of a merge conflict, fall back to `git pull --no-rebase`.
. `git push`.
@y
. `git pull --rebase`.
  If this fails because of a merge conflict, fall back to `git pull --no-rebase`.
. `git push`.
@z

@x
This is the most common sequence of network commands when working in this style, so squashing them into one command saves a lot of time.
@y
This is the most common sequence of network commands when working in this style, so squashing them into one command saves a lot of time.
@z

@x
===== Summary
@y
===== Summary
@z

@x
These tools are very well-suited for the workflow they're designed for.
Developers and non-developers alike can be collaborating on a project within minutes, and many of the best practices for this kind of workflow are baked into the tools.
However, if your workflow is different, or you want more control over how and when network operations are done, we recommend you use another client or the command line.
@y
These tools are very well-suited for the workflow they're designed for.
Developers and non-developers alike can be collaborating on a project within minutes, and many of the best practices for this kind of workflow are baked into the tools.
However, if your workflow is different, or you want more control over how and when network operations are done, we recommend you use another client or the command line.
@z

@x
==== Other GUIs
@y
==== Other GUIs
@z

@x
There are a number of other graphical Git clients, and they run the gamut from specialized, single-purpose tools all the way to apps that try to expose everything Git can do.
The official Git website has a curated list of the most popular clients at https://git-scm.com/downloads/guis[].
A more comprehensive list is available on the Git wiki site, at https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools#Graphical_Interfaces[].
@y
There are a number of other graphical Git clients, and they run the gamut from specialized, single-purpose tools all the way to apps that try to expose everything Git can do.
The official Git website has a curated list of the most popular clients at https://git-scm.com/downloads/guis[].
A more comprehensive list is available on the Git wiki site, at https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools#Graphical_Interfaces[].
@z
