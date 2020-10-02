%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_advanced_merging]]
=== Advanced Merging
@y
[[_advanced_merging]]
=== Advanced Merging
@z

@x
Merging in Git is typically fairly easy.
Since Git makes it easy to merge another branch multiple times, it means that you can have a very long lived branch but you can keep it up to date as you go, solving small conflicts often, rather than be surprised by one enormous conflict at the end of the series.
@y
Merging in Git is typically fairly easy.
Since Git makes it easy to merge another branch multiple times, it means that you can have a very long lived branch but you can keep it up to date as you go, solving small conflicts often, rather than be surprised by one enormous conflict at the end of the series.
@z

@x
However, sometimes tricky conflicts do occur.
Unlike some other version control systems, Git does not try to be overly clever about merge conflict resolution.
Git's philosophy is to be smart about determining when a merge resolution is unambiguous, but if there is a conflict, it does not try to be clever about automatically resolving it.
Therefore, if you wait too long to merge two branches that diverge quickly, you can run into some issues.
@y
However, sometimes tricky conflicts do occur.
Unlike some other version control systems, Git does not try to be overly clever about merge conflict resolution.
Git's philosophy is to be smart about determining when a merge resolution is unambiguous, but if there is a conflict, it does not try to be clever about automatically resolving it.
Therefore, if you wait too long to merge two branches that diverge quickly, you can run into some issues.
@z

@x
In this section, we'll go over what some of those issues might be and what tools Git gives you to help handle these more tricky situations.
We'll also cover some of the different, non-standard types of merges you can do, as well as see how to back out of merges that you've done.
@y
In this section, we'll go over what some of those issues might be and what tools Git gives you to help handle these more tricky situations.
We'll also cover some of the different, non-standard types of merges you can do, as well as see how to back out of merges that you've done.
@z

@x
==== Merge Conflicts
@y
==== Merge Conflicts
@z

@x
While we covered some basics on resolving merge conflicts in <<ch03-git-branching#_basic_merge_conflicts>>, for more complex conflicts, Git provides a few tools to help you figure out what's going on and how to better deal with the conflict.
@y
While we covered some basics on resolving merge conflicts in <<ch03-git-branching#_basic_merge_conflicts>>, for more complex conflicts, Git provides a few tools to help you figure out what's going on and how to better deal with the conflict.
@z

@x
First of all, if at all possible, try to make sure your working directory is clean before doing a merge that may have conflicts.
If you have work in progress, either commit it to a temporary branch or stash it.
This makes it so that you can undo *anything* you try here.
If you have unsaved changes in your working directory when you try a merge, some of these tips may help you preserve that work.
@y
First of all, if at all possible, try to make sure your working directory is clean before doing a merge that may have conflicts.
If you have work in progress, either commit it to a temporary branch or stash it.
This makes it so that you can undo *anything* you try here.
If you have unsaved changes in your working directory when you try a merge, some of these tips may help you preserve that work.
@z

@x
Let's walk through a very simple example.
We have a super simple Ruby file that prints 'hello world'.
@y
Let's walk through a very simple example.
We have a super simple Ruby file that prints 'hello world'.
@z

@x
[source,ruby]
----
#! /usr/bin/env ruby
@y
[source,ruby]
----
#! /usr/bin/env ruby
@z

@x
def hello
  puts 'hello world'
end
@y
def hello
  puts 'hello world'
end
@z

@x
hello()
----
@y
hello()
----
@z

@x
In our repository, we create a new branch named `whitespace` and proceed to change all the Unix line endings to DOS line endings, essentially changing every line of the file, but just with whitespace.
Then we change the line ``hello world'' to ``hello mundo''.
@y
In our repository, we create a new branch named `whitespace` and proceed to change all the Unix line endings to DOS line endings, essentially changing every line of the file, but just with whitespace.
Then we change the line ``hello world'' to ``hello mundo''.
@z

@x
[source,console]
----
$ git checkout -b whitespace
Switched to a new branch 'whitespace'
@y
[source,console]
----
$ git checkout -b whitespace
Switched to a new branch 'whitespace'
@z

@x
$ unix2dos hello.rb
unix2dos: converting file hello.rb to DOS format ...
$ git commit -am 'Convert hello.rb to DOS'
[whitespace 3270f76] Convert hello.rb to DOS
 1 file changed, 7 insertions(+), 7 deletions(-)
@y
$ unix2dos hello.rb
unix2dos: converting file hello.rb to DOS format ...
$ git commit -am 'Convert hello.rb to DOS'
[whitespace 3270f76] Convert hello.rb to DOS
 1 file changed, 7 insertions(+), 7 deletions(-)
@z

@x
$ vim hello.rb
$ git diff -b
diff --git a/hello.rb b/hello.rb
index ac51efd..e85207e 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,7 +1,7 @@
 #! /usr/bin/env ruby
@y
$ vim hello.rb
$ git diff -b
diff --git a/hello.rb b/hello.rb
index ac51efd..e85207e 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,7 +1,7 @@
 #! /usr/bin/env ruby
@z

@x
 def hello
-  puts 'hello world'
+  puts 'hello mundo'^M
 end
@y
 def hello
-  puts 'hello world'
+  puts 'hello mundo'^M
 end
@z

@x
 hello()
@y
 hello()
@z

@x
$ git commit -am 'Use Spanish instead of English'
[whitespace 6d338d2] Use Spanish instead of English
 1 file changed, 1 insertion(+), 1 deletion(-)
----
@y
$ git commit -am 'Use Spanish instead of English'
[whitespace 6d338d2] Use Spanish instead of English
 1 file changed, 1 insertion(+), 1 deletion(-)
----
@z

@x
Now we switch back to our `master` branch and add some documentation for the function.
@y
Now we switch back to our `master` branch and add some documentation for the function.
@z

@x
[source,console]
----
$ git checkout master
Switched to branch 'master'
@y
[source,console]
----
$ git checkout master
Switched to branch 'master'
@z

@x
$ vim hello.rb
$ git diff
diff --git a/hello.rb b/hello.rb
index ac51efd..36c06c8 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,5 +1,6 @@
 #! /usr/bin/env ruby
@y
$ vim hello.rb
$ git diff
diff --git a/hello.rb b/hello.rb
index ac51efd..36c06c8 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,5 +1,6 @@
 #! /usr/bin/env ruby
@z

@x
+# prints out a greeting
 def hello
   puts 'hello world'
 end
@y
+# prints out a greeting
 def hello
   puts 'hello world'
 end
@z

@x
$ git commit -am 'Add comment documenting the function'
[master bec6336] Add comment documenting the function
 1 file changed, 1 insertion(+)
----
@y
$ git commit -am 'Add comment documenting the function'
[master bec6336] Add comment documenting the function
 1 file changed, 1 insertion(+)
----
@z

@x
Now we try to merge in our `whitespace` branch and we'll get conflicts because of the whitespace changes.
@y
Now we try to merge in our `whitespace` branch and we'll get conflicts because of the whitespace changes.
@z

@x
[source,console]
----
$ git merge whitespace
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Automatic merge failed; fix conflicts and then commit the result.
----
@y
[source,console]
----
$ git merge whitespace
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Automatic merge failed; fix conflicts and then commit the result.
----
@z

@x
[[_abort_merge]]
===== Aborting a Merge
@y
[[_abort_merge]]
===== Aborting a Merge
@z

@x
We now have a few options.
First, let's cover how to get out of this situation.
If you perhaps weren't expecting conflicts and don't want to quite deal with the situation yet, you can simply back out of the merge with `git merge --abort`.
@y
We now have a few options.
First, let's cover how to get out of this situation.
If you perhaps weren't expecting conflicts and don't want to quite deal with the situation yet, you can simply back out of the merge with `git merge --abort`.
@z

@x
[source,console]
----
$ git status -sb
## master
UU hello.rb
@y
[source,console]
----
$ git status -sb
## master
UU hello.rb
@z

@x
$ git merge --abort
@y
$ git merge --abort
@z

@x
$ git status -sb
## master
----
@y
$ git status -sb
## master
----
@z

@x
The `git merge --abort` option tries to revert back to your state before you ran the merge.
The only cases where it may not be able to do this perfectly would be if you had unstashed, uncommitted changes in your working directory when you ran it, otherwise it should work fine.
@y
The `git merge --abort` option tries to revert back to your state before you ran the merge.
The only cases where it may not be able to do this perfectly would be if you had unstashed, uncommitted changes in your working directory when you ran it, otherwise it should work fine.
@z

@x
If for some reason you just want to start over, you can also run `git reset --hard HEAD`, and your repository will be back to the last committed state.
Remember that any uncommitted work will be lost, so make sure you don't want any of your changes.
@y
If for some reason you just want to start over, you can also run `git reset --hard HEAD`, and your repository will be back to the last committed state.
Remember that any uncommitted work will be lost, so make sure you don't want any of your changes.
@z

@x
===== Ignoring Whitespace
@y
===== Ignoring Whitespace
@z

@x
In this specific case, the conflicts are whitespace related.
We know this because the case is simple, but it's also pretty easy to tell in real cases when looking at the conflict because every line is removed on one side and added again on the other.
By default, Git sees all of these lines as being changed, so it can't merge the files.
@y
In this specific case, the conflicts are whitespace related.
We know this because the case is simple, but it's also pretty easy to tell in real cases when looking at the conflict because every line is removed on one side and added again on the other.
By default, Git sees all of these lines as being changed, so it can't merge the files.
@z

@x
The default merge strategy can take arguments though, and a few of them are about properly ignoring whitespace changes.
If you see that you have a lot of whitespace issues in a merge, you can simply abort it and do it again, this time with `-Xignore-all-space` or `-Xignore-space-change`.
The first option ignores whitespace *completely* when comparing lines, the second treats sequences of one or more whitespace characters as equivalent.
@y
The default merge strategy can take arguments though, and a few of them are about properly ignoring whitespace changes.
If you see that you have a lot of whitespace issues in a merge, you can simply abort it and do it again, this time with `-Xignore-all-space` or `-Xignore-space-change`.
The first option ignores whitespace *completely* when comparing lines, the second treats sequences of one or more whitespace characters as equivalent.
@z

@x
[source,console]
----
$ git merge -Xignore-space-change whitespace
Auto-merging hello.rb
Merge made by the 'recursive' strategy.
 hello.rb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
----
@y
[source,console]
----
$ git merge -Xignore-space-change whitespace
Auto-merging hello.rb
Merge made by the 'recursive' strategy.
 hello.rb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
----
@z

@x
Since in this case, the actual file changes were not conflicting, once we ignore the whitespace changes, everything merges just fine.
@y
Since in this case, the actual file changes were not conflicting, once we ignore the whitespace changes, everything merges just fine.
@z

@x
This is a lifesaver if you have someone on your team who likes to occasionally reformat everything from spaces to tabs or vice-versa.
@y
This is a lifesaver if you have someone on your team who likes to occasionally reformat everything from spaces to tabs or vice-versa.
@z

@x
[[_manual_remerge]]
===== Manual File Re-merging
@y
[[_manual_remerge]]
===== Manual File Re-merging
@z

@x
Though Git handles whitespace pre-processing pretty well, there are other types of changes that perhaps Git can't handle automatically, but are scriptable fixes.
As an example, let's pretend that Git could not handle the whitespace change and we needed to do it by hand.
@y
Though Git handles whitespace pre-processing pretty well, there are other types of changes that perhaps Git can't handle automatically, but are scriptable fixes.
As an example, let's pretend that Git could not handle the whitespace change and we needed to do it by hand.
@z

@x
What we really need to do is run the file we're trying to merge in through a `dos2unix` program before trying the actual file merge.
So how would we do that?
@y
What we really need to do is run the file we're trying to merge in through a `dos2unix` program before trying the actual file merge.
So how would we do that?
@z

@x
First, we get into the merge conflict state.
Then we want to get copies of my version of the file, their version (from the branch we're merging in) and the common version (from where both sides branched off).
Then we want to fix up either their side or our side and re-try the merge again for just this single file.
@y
First, we get into the merge conflict state.
Then we want to get copies of my version of the file, their version (from the branch we're merging in) and the common version (from where both sides branched off).
Then we want to fix up either their side or our side and re-try the merge again for just this single file.
@z

@x
Getting the three file versions is actually pretty easy.
Git stores all of these versions in the index under ``stages'' which each have numbers associated with them.
Stage 1 is the common ancestor, stage 2 is your version and stage 3 is from the `MERGE_HEAD`, the version you're merging in (``theirs'').
@y
Getting the three file versions is actually pretty easy.
Git stores all of these versions in the index under ``stages'' which each have numbers associated with them.
Stage 1 is the common ancestor, stage 2 is your version and stage 3 is from the `MERGE_HEAD`, the version you're merging in (``theirs'').
@z

@x
You can extract a copy of each of these versions of the conflicted file with the `git show` command and a special syntax.
@y
You can extract a copy of each of these versions of the conflicted file with the `git show` command and a special syntax.
@z

@x
[source,console]
----
$ git show :1:hello.rb > hello.common.rb
$ git show :2:hello.rb > hello.ours.rb
$ git show :3:hello.rb > hello.theirs.rb
----
@y
[source,console]
----
$ git show :1:hello.rb > hello.common.rb
$ git show :2:hello.rb > hello.ours.rb
$ git show :3:hello.rb > hello.theirs.rb
----
@z

@x
If you want to get a little more hard core, you can also use the `ls-files -u` plumbing command to get the actual SHA-1s of the Git blobs for each of these files.
@y
If you want to get a little more hard core, you can also use the `ls-files -u` plumbing command to get the actual SHA-1s of the Git blobs for each of these files.
@z

@x
[source,console]
----
$ git ls-files -u
100755 ac51efdc3df4f4fd328d1a02ad05331d8e2c9111 1	hello.rb
100755 36c06c8752c78d2aff89571132f3bf7841a7b5c3 2	hello.rb
100755 e85207e04dfdd5eb0a1e9febbc67fd837c44a1cd 3	hello.rb
----
@y
[source,console]
----
$ git ls-files -u
100755 ac51efdc3df4f4fd328d1a02ad05331d8e2c9111 1	hello.rb
100755 36c06c8752c78d2aff89571132f3bf7841a7b5c3 2	hello.rb
100755 e85207e04dfdd5eb0a1e9febbc67fd837c44a1cd 3	hello.rb
----
@z

@x
The `:1:hello.rb` is just a shorthand for looking up that blob SHA-1.
@y
The `:1:hello.rb` is just a shorthand for looking up that blob SHA-1.
@z

@x
Now that we have the content of all three stages in our working directory, we can manually fix up theirs to fix the whitespace issue and re-merge the file with the little-known `git merge-file` command which does just that.
@y
Now that we have the content of all three stages in our working directory, we can manually fix up theirs to fix the whitespace issue and re-merge the file with the little-known `git merge-file` command which does just that.
@z

@x
[source,console]
----
$ dos2unix hello.theirs.rb
dos2unix: converting file hello.theirs.rb to Unix format ...
@y
[source,console]
----
$ dos2unix hello.theirs.rb
dos2unix: converting file hello.theirs.rb to Unix format ...
@z

@x
$ git merge-file -p \
    hello.ours.rb hello.common.rb hello.theirs.rb > hello.rb
@y
$ git merge-file -p \
    hello.ours.rb hello.common.rb hello.theirs.rb > hello.rb
@z

@x
$ git diff -b
diff --cc hello.rb
index 36c06c8,e85207e..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,8 -1,7 +1,8 @@@
  #! /usr/bin/env ruby
@y
$ git diff -b
diff --cc hello.rb
index 36c06c8,e85207e..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,8 -1,7 +1,8 @@@
  #! /usr/bin/env ruby
@z

@x
 +# prints out a greeting
  def hello
-   puts 'hello world'
+   puts 'hello mundo'
  end
@y
 +# prints out a greeting
  def hello
-   puts 'hello world'
+   puts 'hello mundo'
  end
@z

@x
  hello()
----
@y
  hello()
----
@z

@x
At this point we have nicely merged the file.
In fact, this actually works better than the `ignore-space-change` option because this actually fixes the whitespace changes before merge instead of simply ignoring them.
In the `ignore-space-change` merge, we actually ended up with a few lines with DOS line endings, making things mixed.
@y
At this point we have nicely merged the file.
In fact, this actually works better than the `ignore-space-change` option because this actually fixes the whitespace changes before merge instead of simply ignoring them.
In the `ignore-space-change` merge, we actually ended up with a few lines with DOS line endings, making things mixed.
@z

@x
If you want to get an idea before finalizing this commit about what was actually changed between one side or the other, you can ask `git diff` to compare what is in your working directory that you're about to commit as the result of the merge to any of these stages.
Let's go through them all.
@y
If you want to get an idea before finalizing this commit about what was actually changed between one side or the other, you can ask `git diff` to compare what is in your working directory that you're about to commit as the result of the merge to any of these stages.
Let's go through them all.
@z

@x
To compare your result to what you had in your branch before the merge, in other words, to see what the merge introduced, you can run `git diff --ours`:
@y
To compare your result to what you had in your branch before the merge, in other words, to see what the merge introduced, you can run `git diff --ours`:
@z

@x
[source,console]
----
$ git diff --ours
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index 36c06c8..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -2,7 +2,7 @@
@y
[source,console]
----
$ git diff --ours
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index 36c06c8..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -2,7 +2,7 @@
@z

@x
 # prints out a greeting
 def hello
-  puts 'hello world'
+  puts 'hello mundo'
 end
@y
 # prints out a greeting
 def hello
-  puts 'hello world'
+  puts 'hello mundo'
 end
@z

@x
 hello()
----
@y
 hello()
----
@z

@x
So here we can easily see that what happened in our branch, what we're actually introducing to this file with this merge, is changing that single line.
@y
So here we can easily see that what happened in our branch, what we're actually introducing to this file with this merge, is changing that single line.
@z

@x
If we want to see how the result of the merge differed from what was on their side, you can run `git diff --theirs`.
In this and the following example, we have to use `-b` to strip out the whitespace because we're comparing it to what is in Git, not our cleaned up `hello.theirs.rb` file.
@y
If we want to see how the result of the merge differed from what was on their side, you can run `git diff --theirs`.
In this and the following example, we have to use `-b` to strip out the whitespace because we're comparing it to what is in Git, not our cleaned up `hello.theirs.rb` file.
@z

@x
[source,console]
----
$ git diff --theirs -b
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index e85207e..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,5 +1,6 @@
 #! /usr/bin/env ruby
@y
[source,console]
----
$ git diff --theirs -b
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index e85207e..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,5 +1,6 @@
 #! /usr/bin/env ruby
@z

@x
+# prints out a greeting
 def hello
   puts 'hello mundo'
 end
----
@y
+# prints out a greeting
 def hello
   puts 'hello mundo'
 end
----
@z

@x
Finally, you can see how the file has changed from both sides with `git diff --base`.
@y
Finally, you can see how the file has changed from both sides with `git diff --base`.
@z

@x
[source,console]
----
$ git diff --base -b
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index ac51efd..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,7 +1,8 @@
 #! /usr/bin/env ruby
@y
[source,console]
----
$ git diff --base -b
* Unmerged path hello.rb
diff --git a/hello.rb b/hello.rb
index ac51efd..44d0a25 100755
--- a/hello.rb
+++ b/hello.rb
@@ -1,7 +1,8 @@
 #! /usr/bin/env ruby
@z

@x
+# prints out a greeting
 def hello
-  puts 'hello world'
+  puts 'hello mundo'
 end
@y
+# prints out a greeting
 def hello
-  puts 'hello world'
+  puts 'hello mundo'
 end
@z

@x
 hello()
----
@y
 hello()
----
@z

@x
At this point we can use the `git clean` command to clear out the extra files we created to do the manual merge but no longer need.
@y
At this point we can use the `git clean` command to clear out the extra files we created to do the manual merge but no longer need.
@z

@x
[source,console]
----
$ git clean -f
Removing hello.common.rb
Removing hello.ours.rb
Removing hello.theirs.rb
----
@y
[source,console]
----
$ git clean -f
Removing hello.common.rb
Removing hello.ours.rb
Removing hello.theirs.rb
----
@z

@x
[[_checking_out_conflicts]]
===== Checking Out Conflicts
@y
[[_checking_out_conflicts]]
===== Checking Out Conflicts
@z

@x
Perhaps we're not happy with the resolution at this point for some reason, or maybe manually editing one or both sides still didn't work well and we need more context.
@y
Perhaps we're not happy with the resolution at this point for some reason, or maybe manually editing one or both sides still didn't work well and we need more context.
@z

@x
Let's change up the example a little.
For this example, we have two longer lived branches that each have a few commits in them but create a legitimate content conflict when merged.
@y
Let's change up the example a little.
For this example, we have two longer lived branches that each have a few commits in them but create a legitimate content conflict when merged.
@z

@x
[source,console]
----
$ git log --graph --oneline --decorate --all
* f1270f7 (HEAD, master) Update README
* 9af9d3b Create README
* 694971d Update phrase to 'hola world'
| * e3eb223 (mundo) Add more tests
| * 7cff591 Create initial testing script
| * c3ffff1 Change text to 'hello mundo'
|/
* b7dcc89 Initial hello world code
----
@y
[source,console]
----
$ git log --graph --oneline --decorate --all
* f1270f7 (HEAD, master) Update README
* 9af9d3b Create README
* 694971d Update phrase to 'hola world'
| * e3eb223 (mundo) Add more tests
| * 7cff591 Create initial testing script
| * c3ffff1 Change text to 'hello mundo'
|/
* b7dcc89 Initial hello world code
----
@z

@x
We now have three unique commits that live only on the `master` branch and three others that live on the `mundo` branch.
If we try to merge the `mundo` branch in, we get a conflict.
@y
We now have three unique commits that live only on the `master` branch and three others that live on the `mundo` branch.
If we try to merge the `mundo` branch in, we get a conflict.
@z

@x
[source,console]
----
$ git merge mundo
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Automatic merge failed; fix conflicts and then commit the result.
----
@y
[source,console]
----
$ git merge mundo
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Automatic merge failed; fix conflicts and then commit the result.
----
@z

@x
We would like to see what the merge conflict is.
If we open up the file, we'll see something like this:
@y
We would like to see what the merge conflict is.
If we open up the file, we'll see something like this:
@z

@x
[source,ruby]
----
#! /usr/bin/env ruby
@y
[source,ruby]
----
#! /usr/bin/env ruby
@z

@x
def hello
<<<<<<< HEAD
  puts 'hola world'
=======
  puts 'hello mundo'
>>>>>>> mundo
end
@y
def hello
<<<<<<< HEAD
  puts 'hola world'
=======
  puts 'hello mundo'
>>>>>>> mundo
end
@z

@x
hello()
----
@y
hello()
----
@z

@x
Both sides of the merge added content to this file, but some of the commits modified the file in the same place that caused this conflict.
@y
Both sides of the merge added content to this file, but some of the commits modified the file in the same place that caused this conflict.
@z

@x
Let's explore a couple of tools that you now have at your disposal to determine how this conflict came to be.
Perhaps it's not obvious how exactly you should fix this conflict.
You need more context.
@y
Let's explore a couple of tools that you now have at your disposal to determine how this conflict came to be.
Perhaps it's not obvious how exactly you should fix this conflict.
You need more context.
@z

@x
One helpful tool is `git checkout` with the `--conflict` option.
This will re-checkout the file again and replace the merge conflict markers.
This can be useful if you want to reset the markers and try to resolve them again.
@y
One helpful tool is `git checkout` with the `--conflict` option.
This will re-checkout the file again and replace the merge conflict markers.
This can be useful if you want to reset the markers and try to resolve them again.
@z

@x
You can pass `--conflict` either `diff3` or `merge` (which is the default).
If you pass it `diff3`, Git will use a slightly different version of conflict markers, not only giving you the ``ours'' and ``theirs'' versions, but also the ``base'' version inline to give you more context.
@y
You can pass `--conflict` either `diff3` or `merge` (which is the default).
If you pass it `diff3`, Git will use a slightly different version of conflict markers, not only giving you the ``ours'' and ``theirs'' versions, but also the ``base'' version inline to give you more context.
@z

@x
[source,console]
----
$ git checkout --conflict=diff3 hello.rb
----
@y
[source,console]
----
$ git checkout --conflict=diff3 hello.rb
----
@z

@x
Once we run that, the file will look like this instead:
@y
Once we run that, the file will look like this instead:
@z

@x
[source,ruby]
----
#! /usr/bin/env ruby
@y
[source,ruby]
----
#! /usr/bin/env ruby
@z

@x
def hello
<<<<<<< ours
  puts 'hola world'
||||||| base
  puts 'hello world'
=======
  puts 'hello mundo'
>>>>>>> theirs
end
@y
def hello
<<<<<<< ours
  puts 'hola world'
||||||| base
  puts 'hello world'
=======
  puts 'hello mundo'
>>>>>>> theirs
end
@z

@x
hello()
----
@y
hello()
----
@z

@x
If you like this format, you can set it as the default for future merge conflicts by setting the `merge.conflictstyle` setting to `diff3`.
@y
If you like this format, you can set it as the default for future merge conflicts by setting the `merge.conflictstyle` setting to `diff3`.
@z

@x
[source,console]
----
$ git config --global merge.conflictstyle diff3
----
@y
[source,console]
----
$ git config --global merge.conflictstyle diff3
----
@z

@x
The `git checkout` command can also take `--ours` and `--theirs` options, which can be a really fast way of just choosing either one side or the other without merging things at all.
@y
The `git checkout` command can also take `--ours` and `--theirs` options, which can be a really fast way of just choosing either one side or the other without merging things at all.
@z

@x
This can be particularly useful for conflicts of binary files where you can simply choose one side, or where you only want to merge certain files in from another branch -- you can do the merge and then checkout certain files from one side or the other before committing.
@y
This can be particularly useful for conflicts of binary files where you can simply choose one side, or where you only want to merge certain files in from another branch -- you can do the merge and then checkout certain files from one side or the other before committing.
@z

@x
[[_merge_log]]
===== Merge Log
@y
[[_merge_log]]
===== Merge Log
@z

@x
Another useful tool when resolving merge conflicts is `git log`.
This can help you get context on what may have contributed to the conflicts.
Reviewing a little bit of history to remember why two lines of development were touching the same area of code can be really helpful sometimes.
@y
Another useful tool when resolving merge conflicts is `git log`.
This can help you get context on what may have contributed to the conflicts.
Reviewing a little bit of history to remember why two lines of development were touching the same area of code can be really helpful sometimes.
@z

@x
To get a full list of all of the unique commits that were included in either branch involved in this merge, we can use the ``triple dot'' syntax that we learned in <<ch07-git-tools#_triple_dot>>.
@y
To get a full list of all of the unique commits that were included in either branch involved in this merge, we can use the ``triple dot'' syntax that we learned in <<ch07-git-tools#_triple_dot>>.
@z

@x
[source,console]
----
$ git log --oneline --left-right HEAD...MERGE_HEAD
< f1270f7 Update README
< 9af9d3b Create README
< 694971d Update phrase to 'hola world'
> e3eb223 Add more tests
> 7cff591 Create initial testing script
> c3ffff1 Change text to 'hello mundo'
----
@y
[source,console]
----
$ git log --oneline --left-right HEAD...MERGE_HEAD
< f1270f7 Update README
< 9af9d3b Create README
< 694971d Update phrase to 'hola world'
> e3eb223 Add more tests
> 7cff591 Create initial testing script
> c3ffff1 Change text to 'hello mundo'
----
@z

@x
That's a nice list of the six total commits involved, as well as which line of development each commit was on.
@y
That's a nice list of the six total commits involved, as well as which line of development each commit was on.
@z

@x
We can further simplify this though to give us much more specific context.
If we add the `--merge` option to `git log`, it will only show the commits in either side of the merge that touch a file that's currently conflicted.
@y
We can further simplify this though to give us much more specific context.
If we add the `--merge` option to `git log`, it will only show the commits in either side of the merge that touch a file that's currently conflicted.
@z

@x
[source,console]
----
$ git log --oneline --left-right --merge
< 694971d Update phrase to 'hola world'
> c3ffff1 Change text to 'hello mundo'
----
@y
[source,console]
----
$ git log --oneline --left-right --merge
< 694971d Update phrase to 'hola world'
> c3ffff1 Change text to 'hello mundo'
----
@z

@x
If you run that with the `-p` option instead, you get just the diffs to the file that ended up in conflict.
This can be *really* helpful in quickly giving you the context you need to help understand why something conflicts and how to more intelligently resolve it.
@y
If you run that with the `-p` option instead, you get just the diffs to the file that ended up in conflict.
This can be *really* helpful in quickly giving you the context you need to help understand why something conflicts and how to more intelligently resolve it.
@z

@x
===== Combined Diff Format
@y
===== Combined Diff Format
@z

@x
Since Git stages any merge results that are successful, when you run `git diff` while in a conflicted merge state, you only get what is currently still in conflict.
This can be helpful to see what you still have to resolve.
@y
Since Git stages any merge results that are successful, when you run `git diff` while in a conflicted merge state, you only get what is currently still in conflict.
This can be helpful to see what you still have to resolve.
@z

@x
When you run `git diff` directly after a merge conflict, it will give you information in a rather unique diff output format.
@y
When you run `git diff` directly after a merge conflict, it will give you information in a rather unique diff output format.
@z

@x
[source,console]
----
$ git diff
diff --cc hello.rb
index 0399cd5,59727f0..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,11 @@@
  #! /usr/bin/env ruby
@y
[source,console]
----
$ git diff
diff --cc hello.rb
index 0399cd5,59727f0..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,11 @@@
  #! /usr/bin/env ruby
@z

@x
  def hello
++<<<<<<< HEAD
 +  puts 'hola world'
++=======
+   puts 'hello mundo'
++>>>>>>> mundo
  end
@y
  def hello
++<<<<<<< HEAD
 +  puts 'hola world'
++=======
+   puts 'hello mundo'
++>>>>>>> mundo
  end
@z

@x
  hello()
----
@y
  hello()
----
@z

@x
The format is called ``Combined Diff'' and gives you two columns of data next to each line.
The first column shows you if that line is different (added or removed) between the ``ours'' branch and the file in your working directory and the second column does the same between the ``theirs'' branch and your working directory copy.
@y
The format is called ``Combined Diff'' and gives you two columns of data next to each line.
The first column shows you if that line is different (added or removed) between the ``ours'' branch and the file in your working directory and the second column does the same between the ``theirs'' branch and your working directory copy.
@z

@x
So in that example you can see that the `<<<<<<<` and `>>>>>>>` lines are in the working copy but were not in either side of the merge.
This makes sense because the merge tool stuck them in there for our context, but we're expected to remove them.
@y
So in that example you can see that the `<<<<<<<` and `>>>>>>>` lines are in the working copy but were not in either side of the merge.
This makes sense because the merge tool stuck them in there for our context, but we're expected to remove them.
@z

@x
If we resolve the conflict and run `git diff` again, we'll see the same thing, but it's a little more useful.
@y
If we resolve the conflict and run `git diff` again, we'll see the same thing, but it's a little more useful.
@z

@x
[source,console]
----
$ vim hello.rb
$ git diff
diff --cc hello.rb
index 0399cd5,59727f0..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,7 @@@
  #! /usr/bin/env ruby
@y
[source,console]
----
$ vim hello.rb
$ git diff
diff --cc hello.rb
index 0399cd5,59727f0..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,7 @@@
  #! /usr/bin/env ruby
@z

@x
  def hello
-   puts 'hola world'
 -  puts 'hello mundo'
++  puts 'hola mundo'
  end
@y
  def hello
-   puts 'hola world'
 -  puts 'hello mundo'
++  puts 'hola mundo'
  end
@z

@x
  hello()
----
@y
  hello()
----
@z

@x
This shows us that ``hola world'' was in our side but not in the working copy, that ``hello mundo'' was in their side but not in the working copy and finally that ``hola mundo'' was not in either side but is now in the working copy.
This can be useful to review before committing the resolution.
@y
This shows us that ``hola world'' was in our side but not in the working copy, that ``hello mundo'' was in their side but not in the working copy and finally that ``hola mundo'' was not in either side but is now in the working copy.
This can be useful to review before committing the resolution.
@z

@x
You can also get this from the `git log` for any merge to see how something was resolved after the fact.
Git will output this format if you run `git show` on a merge commit, or if you add a `--cc` option to a `git log -p` (which by default only shows patches for non-merge commits).
@y
You can also get this from the `git log` for any merge to see how something was resolved after the fact.
Git will output this format if you run `git show` on a merge commit, or if you add a `--cc` option to a `git log -p` (which by default only shows patches for non-merge commits).
@z

@x
[source,console]
----
$ git log --cc -p -1
commit 14f41939956d80b9e17bb8721354c33f8d5b5a79
Merge: f1270f7 e3eb223
Author: Scott Chacon <schacon@gmail.com>
Date:   Fri Sep 19 18:14:49 2014 +0200
@y
[source,console]
----
$ git log --cc -p -1
commit 14f41939956d80b9e17bb8721354c33f8d5b5a79
Merge: f1270f7 e3eb223
Author: Scott Chacon <schacon@gmail.com>
Date:   Fri Sep 19 18:14:49 2014 +0200
@z

@x
    Merge branch 'mundo'
@y
    Merge branch 'mundo'
@z

@x
    Conflicts:
        hello.rb
@y
    Conflicts:
        hello.rb
@z

@x
diff --cc hello.rb
index 0399cd5,59727f0..e1d0799
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,7 @@@
  #! /usr/bin/env ruby
@y
diff --cc hello.rb
index 0399cd5,59727f0..e1d0799
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,7 @@@
  #! /usr/bin/env ruby
@z

@x
  def hello
-   puts 'hola world'
 -  puts 'hello mundo'
++  puts 'hola mundo'
  end
@y
  def hello
-   puts 'hola world'
 -  puts 'hello mundo'
++  puts 'hola mundo'
  end
@z

@x
  hello()
----
@y
  hello()
----
@z

@x
[[_undoing_merges]]
==== Undoing Merges
@y
[[_undoing_merges]]
==== Undoing Merges
@z

@x
Now that you know how to create a merge commit, you'll probably make some by mistake.
One of the great things about working with Git is that it's okay to make mistakes, because it's possible (and in many cases easy) to fix them.
@y
Now that you know how to create a merge commit, you'll probably make some by mistake.
One of the great things about working with Git is that it's okay to make mistakes, because it's possible (and in many cases easy) to fix them.
@z

@x
Merge commits are no different.
Let's say you started work on a topic branch, accidentally merged it into `master`, and now your commit history looks like this:
@y
Merge commits are no different.
Let's say you started work on a topic branch, accidentally merged it into `master`, and now your commit history looks like this:
@z

@x
.Accidental merge commit
image::images/undomerge-start.png[Accidental merge commit]
@y
.Accidental merge commit
image::images/undomerge-start.png[Accidental merge commit]
@z

@x
There are two ways to approach this problem, depending on what your desired outcome is.
@y
There are two ways to approach this problem, depending on what your desired outcome is.
@z

@x
===== Fix the references
@y
===== Fix the references
@z

@x
If the unwanted merge commit only exists on your local repository, the easiest and best solution is to move the branches so that they point where you want them to.
In most cases, if you follow the errant `git merge` with `git reset --hard HEAD~`, this will reset the branch pointers so they look like this:
@y
If the unwanted merge commit only exists on your local repository, the easiest and best solution is to move the branches so that they point where you want them to.
In most cases, if you follow the errant `git merge` with `git reset --hard HEAD~`, this will reset the branch pointers so they look like this:
@z

@x
.History after `git reset --hard HEAD~`
image::images/undomerge-reset.png[History after `git reset --hard HEAD~`]
@y
.History after `git reset --hard HEAD~`
image::images/undomerge-reset.png[History after `git reset --hard HEAD~`]
@z

@x
We covered `reset` back in <<ch07-git-tools#_git_reset>>, so it shouldn't be too hard to figure out what's going on here.
Here's a quick refresher: `reset --hard` usually goes through three steps:
@y
We covered `reset` back in <<ch07-git-tools#_git_reset>>, so it shouldn't be too hard to figure out what's going on here.
Here's a quick refresher: `reset --hard` usually goes through three steps:
@z

@x
. Move the branch HEAD points to.
  In this case, we want to move `master` to where it was before the merge commit (`C6`).
. Make the index look like HEAD.
. Make the working directory look like the index.
@y
. Move the branch HEAD points to.
  In this case, we want to move `master` to where it was before the merge commit (`C6`).
. Make the index look like HEAD.
. Make the working directory look like the index.
@z

@x
The downside of this approach is that it's rewriting history, which can be problematic with a shared repository.
Check out <<ch03-git-branching#_rebase_peril>> for more on what can happen; the short version is that if other people have the commits you're rewriting, you should probably avoid `reset`.
This approach also won't work if any other commits have been created since the merge; moving the refs would effectively lose those changes.
@y
The downside of this approach is that it's rewriting history, which can be problematic with a shared repository.
Check out <<ch03-git-branching#_rebase_peril>> for more on what can happen; the short version is that if other people have the commits you're rewriting, you should probably avoid `reset`.
This approach also won't work if any other commits have been created since the merge; moving the refs would effectively lose those changes.
@z

@x
[[_reverse_commit]]
===== Reverse the commit
@y
[[_reverse_commit]]
===== Reverse the commit
@z

@x
If moving the branch pointers around isn't going to work for you, Git gives you the option of making a new commit which undoes all the changes from an existing one.
Git calls this operation a ``revert'', and in this particular scenario, you'd invoke it like this:
@y
If moving the branch pointers around isn't going to work for you, Git gives you the option of making a new commit which undoes all the changes from an existing one.
Git calls this operation a ``revert'', and in this particular scenario, you'd invoke it like this:
@z

@x
[source,console]
----
$ git revert -m 1 HEAD
[master b1d8379] Revert "Merge branch 'topic'"
----
@y
[source,console]
----
$ git revert -m 1 HEAD
[master b1d8379] Revert "Merge branch 'topic'"
----
@z

@x
The `-m 1` flag indicates which parent is the ``mainline'' and should be kept.
When you invoke a merge into `HEAD` (`git merge topic`), the new commit has two parents: the first one is `HEAD` (`C6`), and the second is the tip of the branch being merged in (`C4`).
In this case, we want to undo all the changes introduced by merging in parent #2 (`C4`), while keeping all the content from parent #1 (`C6`).
@y
The `-m 1` flag indicates which parent is the ``mainline'' and should be kept.
When you invoke a merge into `HEAD` (`git merge topic`), the new commit has two parents: the first one is `HEAD` (`C6`), and the second is the tip of the branch being merged in (`C4`).
In this case, we want to undo all the changes introduced by merging in parent #2 (`C4`), while keeping all the content from parent #1 (`C6`).
@z

@x
The history with the revert commit looks like this:
@y
The history with the revert commit looks like this:
@z

@x
.History after `git revert -m 1`
image::images/undomerge-revert.png[History after `git revert -m 1`]
@y
.History after `git revert -m 1`
image::images/undomerge-revert.png[History after `git revert -m 1`]
@z

@x
The new commit `^M` has exactly the same contents as `C6`, so starting from here it's as if the merge never happened, except that the now-unmerged commits are still in `HEAD`'s history.
Git will get confused if you try to merge `topic` into `master` again:
@y
The new commit `^M` has exactly the same contents as `C6`, so starting from here it's as if the merge never happened, except that the now-unmerged commits are still in `HEAD`'s history.
Git will get confused if you try to merge `topic` into `master` again:
@z

@x
[source,console]
----
$ git merge topic
Already up-to-date.
----
@y
[source,console]
----
$ git merge topic
Already up-to-date.
----
@z

@x
There's nothing in `topic` that isn't already reachable from `master`.
What's worse, if you add work to `topic` and merge again, Git will only bring in the changes _since_ the reverted merge:
@y
There's nothing in `topic` that isn't already reachable from `master`.
What's worse, if you add work to `topic` and merge again, Git will only bring in the changes _since_ the reverted merge:
@z

@x
.History with a bad merge
image::images/undomerge-revert2.png[History with a bad merge]
@y
.History with a bad merge
image::images/undomerge-revert2.png[History with a bad merge]
@z

@x
The best way around this is to un-revert the original merge, since now you want to bring in the changes that were reverted out, *then* create a new merge commit:
@y
The best way around this is to un-revert the original merge, since now you want to bring in the changes that were reverted out, *then* create a new merge commit:
@z

@x
[source,console]
----
$ git revert ^M
[master 09f0126] Revert "Revert "Merge branch 'topic'""
$ git merge topic
----
@y
[source,console]
----
$ git revert ^M
[master 09f0126] Revert "Revert "Merge branch 'topic'""
$ git merge topic
----
@z

@x
.History after re-merging a reverted merge
image::images/undomerge-revert3.png[History after re-merging a reverted merge]
@y
.History after re-merging a reverted merge
image::images/undomerge-revert3.png[History after re-merging a reverted merge]
@z

@x
In this example, `M` and `^M` cancel out.
`^^M` effectively merges in the changes from `C3` and `C4`, and `C8` merges in the changes from `C7`, so now `topic` is fully merged.
@y
In this example, `M` and `^M` cancel out.
`^^M` effectively merges in the changes from `C3` and `C4`, and `C8` merges in the changes from `C7`, so now `topic` is fully merged.
@z

@x
==== Other Types of Merges
@y
==== Other Types of Merges
@z

@x
So far we've covered the normal merge of two branches, normally handled with what is called the ``recursive'' strategy of merging.
There are other ways to merge branches together however.
Let's cover a few of them quickly.
@y
So far we've covered the normal merge of two branches, normally handled with what is called the ``recursive'' strategy of merging.
There are other ways to merge branches together however.
Let's cover a few of them quickly.
@z

@x
===== Our or Theirs Preference
@y
===== Our or Theirs Preference
@z

@x
First of all, there is another useful thing we can do with the normal ``recursive'' mode of merging.
We've already seen the `ignore-all-space` and `ignore-space-change` options which are passed with a `-X` but we can also tell Git to favor one side or the other when it sees a conflict.
@y
First of all, there is another useful thing we can do with the normal ``recursive'' mode of merging.
We've already seen the `ignore-all-space` and `ignore-space-change` options which are passed with a `-X` but we can also tell Git to favor one side or the other when it sees a conflict.
@z

@x
By default, when Git sees a conflict between two branches being merged, it will add merge conflict markers into your code and mark the file as conflicted and let you resolve it.
If you would prefer for Git to simply choose a specific side and ignore the other side instead of letting you manually resolve the conflict, you can pass the `merge` command either a `-Xours` or `-Xtheirs`.
@y
By default, when Git sees a conflict between two branches being merged, it will add merge conflict markers into your code and mark the file as conflicted and let you resolve it.
If you would prefer for Git to simply choose a specific side and ignore the other side instead of letting you manually resolve the conflict, you can pass the `merge` command either a `-Xours` or `-Xtheirs`.
@z

@x
If Git sees this, it will not add conflict markers.
Any differences that are mergeable, it will merge.
Any differences that conflict, it will simply choose the side you specify in whole, including binary files.
@y
If Git sees this, it will not add conflict markers.
Any differences that are mergeable, it will merge.
Any differences that conflict, it will simply choose the side you specify in whole, including binary files.
@z

@x
If we go back to the ``hello world'' example we were using before, we can see that merging in our branch causes conflicts.
@y
If we go back to the ``hello world'' example we were using before, we can see that merging in our branch causes conflicts.
@z

@x
[source,console]
----
$ git merge mundo
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Resolved 'hello.rb' using previous resolution.
Automatic merge failed; fix conflicts and then commit the result.
----
@y
[source,console]
----
$ git merge mundo
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Resolved 'hello.rb' using previous resolution.
Automatic merge failed; fix conflicts and then commit the result.
----
@z

@x
However if we run it with `-Xours` or `-Xtheirs` it does not.
@y
However if we run it with `-Xours` or `-Xtheirs` it does not.
@z

@x
[source,console]
----
$ git merge -Xours mundo
Auto-merging hello.rb
Merge made by the 'recursive' strategy.
 hello.rb | 2 +-
 test.sh  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 test.sh
----
@y
[source,console]
----
$ git merge -Xours mundo
Auto-merging hello.rb
Merge made by the 'recursive' strategy.
 hello.rb | 2 +-
 test.sh  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 test.sh
----
@z

@x
In that case, instead of getting conflict markers in the file with ``hello mundo'' on one side and ``hola world'' on the other, it will simply pick ``hola world''.
However, all the other non-conflicting changes on that branch are merged successfully in.
@y
In that case, instead of getting conflict markers in the file with ``hello mundo'' on one side and ``hola world'' on the other, it will simply pick ``hola world''.
However, all the other non-conflicting changes on that branch are merged successfully in.
@z

@x
This option can also be passed to the `git merge-file` command we saw earlier by running something like `git merge-file --ours` for individual file merges.
@y
This option can also be passed to the `git merge-file` command we saw earlier by running something like `git merge-file --ours` for individual file merges.
@z

@x
If you want to do something like this but not have Git even try to merge changes from the other side in, there is a more draconian option, which is the ``ours'' merge _strategy_.
This is different from the ``ours'' recursive merge _option_.
@y
If you want to do something like this but not have Git even try to merge changes from the other side in, there is a more draconian option, which is the ``ours'' merge _strategy_.
This is different from the ``ours'' recursive merge _option_.
@z

@x
This will basically do a fake merge.
It will record a new merge commit with both branches as parents, but it will not even look at the branch you're merging in.
It will simply record as the result of the merge the exact code in your current branch.
@y
This will basically do a fake merge.
It will record a new merge commit with both branches as parents, but it will not even look at the branch you're merging in.
It will simply record as the result of the merge the exact code in your current branch.
@z

@x
[source,console]
----
$ git merge -s ours mundo
Merge made by the 'ours' strategy.
$ git diff HEAD HEAD~
$
----
@y
[source,console]
----
$ git merge -s ours mundo
Merge made by the 'ours' strategy.
$ git diff HEAD HEAD~
$
----
@z

@x
You can see that there is no difference between the branch we were on and the result of the merge.
@y
You can see that there is no difference between the branch we were on and the result of the merge.
@z

@x
This can often be useful to basically trick Git into thinking that a branch is already merged when doing a merge later on.
For example, say you branched off a `release` branch and have done some work on it that you will want to merge back into your `master` branch at some point.
In the meantime some bugfix on `master` needs to be backported into your `release` branch.
You can merge the bugfix branch into the `release` branch and also `merge -s ours` the same branch into your `master` branch (even though the fix is already there) so when you later merge the `release` branch again, there are no conflicts from the bugfix.
@y
This can often be useful to basically trick Git into thinking that a branch is already merged when doing a merge later on.
For example, say you branched off a `release` branch and have done some work on it that you will want to merge back into your `master` branch at some point.
In the meantime some bugfix on `master` needs to be backported into your `release` branch.
You can merge the bugfix branch into the `release` branch and also `merge -s ours` the same branch into your `master` branch (even though the fix is already there) so when you later merge the `release` branch again, there are no conflicts from the bugfix.
@z

@x
include::subtree-merges.asc[]
@y
include::subtree-merges.asc[]
@z
