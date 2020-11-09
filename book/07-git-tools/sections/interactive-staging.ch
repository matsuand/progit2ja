%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_interactive_staging]]
=== Interactive Staging
@y
[[_interactive_staging]]
=== Interactive Staging
@z

@x
In this section, you'll look at a few interactive Git commands that can help you craft your commits to include only certain combinations and parts of files.
These tools are helpful if you modify a number of files extensively, then decide that you want those changes to be partitioned into several focused commits rather than one big messy commit.
This way, you can make sure your commits are logically separate changesets and can be reviewed easily by the developers working with you.
@y
In this section, you'll look at a few interactive Git commands that can help you craft your commits to include only certain combinations and parts of files.
These tools are helpful if you modify a number of files extensively, then decide that you want those changes to be partitioned into several focused commits rather than one big messy commit.
This way, you can make sure your commits are logically separate changesets and can be reviewed easily by the developers working with you.
@z

@x
If you run `git add` with the `-i` or `--interactive` option, Git enters an interactive shell mode, displaying something like this:
@y
If you run `git add` with the `-i` or `--interactive` option, Git enters an interactive shell mode, displaying something like this:
@z

@x
[source,console]
----
$ git add -i
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
@y
[source,console]
----
$ git add -i
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
@z

@x
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now>
----
@y
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now>
----
@z

@x
You can see that this command shows you a much different view of your staging area than you're probably used to -- basically, the same information you get with `git status` but a bit more succinct and informative.
It lists the changes you've staged on the left and unstaged changes on the right.
@y
You can see that this command shows you a much different view of your staging area than you're probably used to -- basically, the same information you get with `git status` but a bit more succinct and informative.
It lists the changes you've staged on the left and unstaged changes on the right.
@z

@x
After this comes a "`Commands`" section, which allows you to do a number of things like staging and unstaging files, staging parts of files, adding untracked files, and displaying diffs of what has been staged.
@y
After this comes a "`Commands`" section, which allows you to do a number of things like staging and unstaging files, staging parts of files, adding untracked files, and displaying diffs of what has been staged.
@z

@x
==== Staging and Unstaging Files
@y
==== Staging and Unstaging Files
@z

@x
If you type `u` or `2` (for update) at the `What now>` prompt, you're prompted for which files you want to stage:
@y
If you type `u` or `2` (for update) at the `What now>` prompt, you're prompted for which files you want to stage:
@z

@x
[source,console]
----
What now> u
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
----
@y
[source,console]
----
What now> u
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
----
@z

@x
To stage the `TODO` and `index.html` files, you can type the numbers:
@y
To stage the `TODO` and `index.html` files, you can type the numbers:
@z

@x
[source,console]
----
Update>> 1,2
           staged     unstaged path
* 1:    unchanged        +0/-1 TODO
* 2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
----
@y
[source,console]
----
Update>> 1,2
           staged     unstaged path
* 1:    unchanged        +0/-1 TODO
* 2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
----
@z

@x
The `*` next to each file means the file is selected to be staged.
If you press Enter after typing nothing at the `Update>>` prompt, Git takes anything selected and stages it for you:
@y
The `*` next to each file means the file is selected to be staged.
If you press Enter after typing nothing at the `Update>>` prompt, Git takes anything selected and stages it for you:
@z

@x
[source,console]
----
Update>>
updated 2 paths
@y
[source,console]
----
Update>>
updated 2 paths
@z

@x
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
----
@y
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
----
@z

@x
Now you can see that the `TODO` and `index.html` files are staged and the `simplegit.rb` file is still unstaged.
If you want to unstage the `TODO` file at this point, you use the `r` or `3` (for revert) option:
@y
Now you can see that the `TODO` and `index.html` files are staged and the `simplegit.rb` file is still unstaged.
If you want to unstage the `TODO` file at this point, you use the `r` or `3` (for revert) option:
@z

@x
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> r
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> 1
           staged     unstaged path
* 1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> [enter]
reverted one path
----
@y
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> r
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> 1
           staged     unstaged path
* 1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> [enter]
reverted one path
----
@z

@x
Looking at your Git status again, you can see that you've unstaged the `TODO` file:
@y
Looking at your Git status again, you can see that you've unstaged the `TODO` file:
@z

@x
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
----
@y
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
----
@z

@x
To see the diff of what you've staged, you can use the `d` or `6` (for diff) command.
It shows you a list of your staged files, and you can select the ones for which you would like to see the staged diff.
This is much like specifying `git diff --cached` on the command line:
@y
To see the diff of what you've staged, you can use the `d` or `6` (for diff) command.
It shows you a list of your staged files, and you can select the ones for which you would like to see the staged diff.
This is much like specifying `git diff --cached` on the command line:
@z

@x
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> d
           staged     unstaged path
  1:        +1/-1      nothing index.html
Review diff>> 1
diff --git a/index.html b/index.html
index 4d07108..4335f49 100644
--- a/index.html
+++ b/index.html
@@ -16,7 +16,7 @@ Date Finder
@y
[source,console]
----
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> d
           staged     unstaged path
  1:        +1/-1      nothing index.html
Review diff>> 1
diff --git a/index.html b/index.html
index 4d07108..4335f49 100644
--- a/index.html
+++ b/index.html
@@ -16,7 +16,7 @@ Date Finder
@z

@x
 <p id="out">...</p>
@y
 <p id="out">...</p>
@z

@x
-<div id="footer">contact : support@github.com</div>
+<div id="footer">contact : email.support@github.com</div>
@y
-<div id="footer">contact : support@github.com</div>
+<div id="footer">contact : email.support@github.com</div>
@z

@x
 <script type="text/javascript">
----
@y
 <script type="text/javascript">
----
@z

@x
With these basic commands, you can use the interactive add mode to deal with your staging area a little more easily.
@y
With these basic commands, you can use the interactive add mode to deal with your staging area a little more easily.
@z

@x
==== Staging Patches
@y
==== Staging Patches
@z

@x
It's also possible for Git to stage certain _parts_ of files and not the rest.
For example, if you make two changes to your `simplegit.rb` file and want to stage one of them and not the other, doing so is very easy in Git.
From the same interactive prompt explained in the previous section, type `p` or `5` (for patch).
Git will ask you which files you would like to partially stage; then, for each section of the selected files, it will display hunks of the file diff and ask if you would like to stage them, one by one:
@y
It's also possible for Git to stage certain _parts_ of files and not the rest.
For example, if you make two changes to your `simplegit.rb` file and want to stage one of them and not the other, doing so is very easy in Git.
From the same interactive prompt explained in the previous section, type `p` or `5` (for patch).
Git will ask you which files you would like to partially stage; then, for each section of the selected files, it will display hunks of the file diff and ask if you would like to stage them, one by one:
@z

@x
[source,console]
----
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index dd5ecc4..57399e0 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -22,7 +22,7 @@ class SimpleGit
   end
@y
[source,console]
----
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index dd5ecc4..57399e0 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -22,7 +22,7 @@ class SimpleGit
   end
@z

@x
   def log(treeish = 'master')
-    command("git log -n 25 #{treeish}")
+    command("git log -n 30 #{treeish}")
   end
@y
   def log(treeish = 'master')
-    command("git log -n 25 #{treeish}")
+    command("git log -n 30 #{treeish}")
   end
@z

@x
   def blame(path)
Stage this hunk [y,n,a,d,/,j,J,g,e,?]?
----
@y
   def blame(path)
Stage this hunk [y,n,a,d,/,j,J,g,e,?]?
----
@z

@x
You have a lot of options at this point.
Typing `?` shows a list of what you can do:
@y
You have a lot of options at this point.
Typing `?` shows a list of what you can do:
@z

@x
[source,console]
----
Stage this hunk [y,n,a,d,/,j,J,g,e,?]? ?
y - stage this hunk
n - do not stage this hunk
a - stage this and all the remaining hunks in the file
d - do not stage this hunk nor any of the remaining hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
----
@y
[source,console]
----
Stage this hunk [y,n,a,d,/,j,J,g,e,?]? ?
y - stage this hunk
n - do not stage this hunk
a - stage this and all the remaining hunks in the file
d - do not stage this hunk nor any of the remaining hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
----
@z

@x
Generally, you'll type `y` or `n` if you want to stage each hunk, but staging all of them in certain files or skipping a hunk decision until later can be helpful too.
If you stage one part of the file and leave another part unstaged, your status output will look like this:
@y
Generally, you'll type `y` or `n` if you want to stage each hunk, but staging all of them in certain files or skipping a hunk decision until later can be helpful too.
If you stage one part of the file and leave another part unstaged, your status output will look like this:
@z

@x
[source,console]
----
What now> 1
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:        +1/-1        +4/-0 lib/simplegit.rb
----
@y
[source,console]
----
What now> 1
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:        +1/-1        +4/-0 lib/simplegit.rb
----
@z

@x
The status of the `simplegit.rb` file is interesting.
It shows you that a couple of lines are staged and a couple are unstaged.
You've partially staged this file.
At this point, you can exit the interactive adding script and run `git commit` to commit the partially staged files.
@y
The status of the `simplegit.rb` file is interesting.
It shows you that a couple of lines are staged and a couple are unstaged.
You've partially staged this file.
At this point, you can exit the interactive adding script and run `git commit` to commit the partially staged files.
@z

@x
You also don't need to be in interactive add mode to do the partial-file staging -- you can start the same script by using `git add -p` or `git add --patch` on the command line.
@y
You also don't need to be in interactive add mode to do the partial-file staging -- you can start the same script by using `git add -p` or `git add --patch` on the command line.
@z

@x
Furthermore, you can use patch mode for partially resetting files with the `git reset --patch` command, for checking out parts of files with the `git checkout --patch` command and for stashing parts of files with the `git stash save --patch` command.
We'll go into more details on each of these as we get to more advanced usages of these commands.
@y
Furthermore, you can use patch mode for partially resetting files with the `git reset --patch` command, for checking out parts of files with the `git checkout --patch` command and for stashing parts of files with the `git stash save --patch` command.
We'll go into more details on each of these as we get to more advanced usages of these commands.
@z
