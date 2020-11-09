%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ref_rerere]]
=== Rerere
@y
[[ref_rerere]]
=== Rerere
@z

@x
The `git rerere` functionality is a bit of a hidden feature.
The name stands for "`reuse recorded resolution`" and, as the name implies, it allows you to ask Git to remember how you've resolved a hunk conflict so that the next time it sees the same conflict, Git can resolve it for you automatically.
@y
The `git rerere` functionality is a bit of a hidden feature.
The name stands for "`reuse recorded resolution`" and, as the name implies, it allows you to ask Git to remember how you've resolved a hunk conflict so that the next time it sees the same conflict, Git can resolve it for you automatically.
@z

@x
There are a number of scenarios in which this functionality might be really handy.
One of the examples that is mentioned in the documentation is when you want to make sure a long-lived topic branch will ultimately merge cleanly, but you don't want to have a bunch of intermediate merge commits cluttering up your commit history.
With `rerere` enabled, you can attempt the occasional merge, resolve the conflicts, then back out of the merge.
If you do this continuously, then the final merge should be easy because `rerere` can just do everything for you automatically.
@y
There are a number of scenarios in which this functionality might be really handy.
One of the examples that is mentioned in the documentation is when you want to make sure a long-lived topic branch will ultimately merge cleanly, but you don't want to have a bunch of intermediate merge commits cluttering up your commit history.
With `rerere` enabled, you can attempt the occasional merge, resolve the conflicts, then back out of the merge.
If you do this continuously, then the final merge should be easy because `rerere` can just do everything for you automatically.
@z

@x
This same tactic can be used if you want to keep a branch rebased so you don't have to deal with the same rebasing conflicts each time you do it.
Or if you want to take a branch that you merged and fixed a bunch of conflicts and then decide to rebase it instead -- you likely won't have to do all the same conflicts again.
@y
This same tactic can be used if you want to keep a branch rebased so you don't have to deal with the same rebasing conflicts each time you do it.
Or if you want to take a branch that you merged and fixed a bunch of conflicts and then decide to rebase it instead -- you likely won't have to do all the same conflicts again.
@z

@x
Another application of `rerere` is where you merge a bunch of evolving topic branches together into a testable head occasionally, as the Git project itself often does.
If the tests fail, you can rewind the merges and re-do them without the topic branch that made the tests fail without having to re-resolve the conflicts again.
@y
Another application of `rerere` is where you merge a bunch of evolving topic branches together into a testable head occasionally, as the Git project itself often does.
If the tests fail, you can rewind the merges and re-do them without the topic branch that made the tests fail without having to re-resolve the conflicts again.
@z

@x
To enable `rerere` functionality, you simply have to run this config setting:
@y
To enable `rerere` functionality, you simply have to run this config setting:
@z

@x
[source,console]
----
$ git config --global rerere.enabled true
----
@y
[source,console]
----
$ git config --global rerere.enabled true
----
@z

@x
You can also turn it on by creating the `.git/rr-cache` directory in a specific repository, but the config setting is clearer and enables that feature globally for you.
@y
You can also turn it on by creating the `.git/rr-cache` directory in a specific repository, but the config setting is clearer and enables that feature globally for you.
@z

@x
Now let's see a simple example, similar to our previous one.
Let's say we have a file named `hello.rb` that looks like this:
@y
Now let's see a simple example, similar to our previous one.
Let's say we have a file named `hello.rb` that looks like this:
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
----
@y
def hello
  puts 'hello world'
end
----
@z

@x
In one branch we change the word "`hello`" to "`hola`", then in another branch we change the "`world`" to "`mundo`", just like before.
@y
In one branch we change the word "`hello`" to "`hola`", then in another branch we change the "`world`" to "`mundo`", just like before.
@z

@x
image::images/rerere1.png[]
@y
image::images/rerere1.png[]
@z

@x
When we merge the two branches together, we'll get a merge conflict:
@y
When we merge the two branches together, we'll get a merge conflict:
@z

@x
[source,console]
----
$ git merge i18n-world
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Recorded preimage for 'hello.rb'
Automatic merge failed; fix conflicts and then commit the result.
----
@y
[source,console]
----
$ git merge i18n-world
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Recorded preimage for 'hello.rb'
Automatic merge failed; fix conflicts and then commit the result.
----
@z

@x
You should notice the new line `Recorded preimage for FILE` in there.
Otherwise it should look exactly like a normal merge conflict.
At this point, `rerere` can tell us a few things.
Normally, you might run `git status` at this point to see what all conflicted:
@y
You should notice the new line `Recorded preimage for FILE` in there.
Otherwise it should look exactly like a normal merge conflict.
At this point, `rerere` can tell us a few things.
Normally, you might run `git status` at this point to see what all conflicted:
@z

@x
[source,console]
----
$ git status
# On branch master
# Unmerged paths:
#   (use "git reset HEAD <file>..." to unstage)
#   (use "git add <file>..." to mark resolution)
#
#	both modified:      hello.rb
#
----
@y
[source,console]
----
$ git status
# On branch master
# Unmerged paths:
#   (use "git reset HEAD <file>..." to unstage)
#   (use "git add <file>..." to mark resolution)
#
#	both modified:      hello.rb
#
----
@z

@x
However, `git rerere` will also tell you what it has recorded the pre-merge state for with `git rerere status`:
@y
However, `git rerere` will also tell you what it has recorded the pre-merge state for with `git rerere status`:
@z

@x
[source,console]
----
$ git rerere status
hello.rb
----
@y
[source,console]
----
$ git rerere status
hello.rb
----
@z

@x
And `git rerere diff` will show the current state of the resolution -- what you started with to resolve and what you've resolved it to.
@y
And `git rerere diff` will show the current state of the resolution -- what you started with to resolve and what you've resolved it to.
@z

@x
[source,console]
----
$ git rerere diff
--- a/hello.rb
+++ b/hello.rb
@@ -1,11 +1,11 @@
 #! /usr/bin/env ruby
@y
[source,console]
----
$ git rerere diff
--- a/hello.rb
+++ b/hello.rb
@@ -1,11 +1,11 @@
 #! /usr/bin/env ruby
@z

@x
 def hello
-<<<<<<<
-  puts 'hello mundo'
-=======
+<<<<<<< HEAD
   puts 'hola world'
->>>>>>>
+=======
+  puts 'hello mundo'
+>>>>>>> i18n-world
 end
----
@y
 def hello
-<<<<<<<
-  puts 'hello mundo'
-=======
+<<<<<<< HEAD
   puts 'hola world'
->>>>>>>
+=======
+  puts 'hello mundo'
+>>>>>>> i18n-world
 end
----
@z

@x
Also (and this isn't really related to `rerere`), you can use `git ls-files -u` to see the conflicted files and the before, left and right versions:
@y
Also (and this isn't really related to `rerere`), you can use `git ls-files -u` to see the conflicted files and the before, left and right versions:
@z

@x
[source,console]
----
$ git ls-files -u
100644 39804c942a9c1f2c03dc7c5ebcd7f3e3a6b97519 1	hello.rb
100644 a440db6e8d1fd76ad438a49025a9ad9ce746f581 2	hello.rb
100644 54336ba847c3758ab604876419607e9443848474 3	hello.rb
----
@y
[source,console]
----
$ git ls-files -u
100644 39804c942a9c1f2c03dc7c5ebcd7f3e3a6b97519 1	hello.rb
100644 a440db6e8d1fd76ad438a49025a9ad9ce746f581 2	hello.rb
100644 54336ba847c3758ab604876419607e9443848474 3	hello.rb
----
@z

@x
Now you can resolve it to just be `puts 'hola mundo'` and you can run `git rerere diff` again to see what rerere will remember:
@y
Now you can resolve it to just be `puts 'hola mundo'` and you can run `git rerere diff` again to see what rerere will remember:
@z

@x
[source,console]
----
$ git rerere diff
--- a/hello.rb
+++ b/hello.rb
@@ -1,11 +1,7 @@
 #! /usr/bin/env ruby
@y
[source,console]
----
$ git rerere diff
--- a/hello.rb
+++ b/hello.rb
@@ -1,11 +1,7 @@
 #! /usr/bin/env ruby
@z

@x
 def hello
-<<<<<<<
-  puts 'hello mundo'
-=======
-  puts 'hola world'
->>>>>>>
+  puts 'hola mundo'
 end
----
@y
 def hello
-<<<<<<<
-  puts 'hello mundo'
-=======
-  puts 'hola world'
->>>>>>>
+  puts 'hola mundo'
 end
----
@z

@x
So that basically says, when Git sees a hunk conflict in a `hello.rb` file that has "`hello mundo`" on one side and "`hola world`" on the other, it will resolve it to "`hola mundo`".
@y
So that basically says, when Git sees a hunk conflict in a `hello.rb` file that has "`hello mundo`" on one side and "`hola world`" on the other, it will resolve it to "`hola mundo`".
@z

@x
Now we can mark it as resolved and commit it:
@y
Now we can mark it as resolved and commit it:
@z

@x
[source,console]
----
$ git add hello.rb
$ git commit
Recorded resolution for 'hello.rb'.
[master 68e16e5] Merge branch 'i18n'
----
@y
[source,console]
----
$ git add hello.rb
$ git commit
Recorded resolution for 'hello.rb'.
[master 68e16e5] Merge branch 'i18n'
----
@z

@x
You can see that it "Recorded resolution for FILE".
@y
You can see that it "Recorded resolution for FILE".
@z

@x
image::images/rerere2.png[]
@y
image::images/rerere2.png[]
@z

@x
Now, let's undo that merge and then rebase it on top of our `master` branch instead.
We can move our branch back by using `git reset` as we saw in <<ch07-git-tools#_git_reset>>.
@y
Now, let's undo that merge and then rebase it on top of our `master` branch instead.
We can move our branch back by using `git reset` as we saw in <<ch07-git-tools#_git_reset>>.
@z

@x
[source,console]
----
$ git reset --hard HEAD^
HEAD is now at ad63f15 i18n the hello
----
@y
[source,console]
----
$ git reset --hard HEAD^
HEAD is now at ad63f15 i18n the hello
----
@z

@x
Our merge is undone.
Now let's rebase the topic branch.
@y
Our merge is undone.
Now let's rebase the topic branch.
@z

@x
[source,console]
----
$ git checkout i18n-world
Switched to branch 'i18n-world'
@y
[source,console]
----
$ git checkout i18n-world
Switched to branch 'i18n-world'
@z

@x
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: i18n one word
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Resolved 'hello.rb' using previous resolution.
Failed to merge in the changes.
Patch failed at 0001 i18n one word
----
@y
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: i18n one word
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging hello.rb
CONFLICT (content): Merge conflict in hello.rb
Resolved 'hello.rb' using previous resolution.
Failed to merge in the changes.
Patch failed at 0001 i18n one word
----
@z

@x
Now, we got the same merge conflict like we expected, but take a look at the `Resolved FILE using previous resolution` line.
If we look at the file, we'll see that it's already been resolved, there are no merge conflict markers in it.
@y
Now, we got the same merge conflict like we expected, but take a look at the `Resolved FILE using previous resolution` line.
If we look at the file, we'll see that it's already been resolved, there are no merge conflict markers in it.
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
  puts 'hola mundo'
end
----
@y
def hello
  puts 'hola mundo'
end
----
@z

@x
Also, `git diff` will show you how it was automatically re-resolved:
@y
Also, `git diff` will show you how it was automatically re-resolved:
@z

@x
[source,console]
----
$ git diff
diff --cc hello.rb
index a440db6,54336ba..0000000
--- a/hello.rb
+++ b/hello.rb
@@@ -1,7 -1,7 +1,7 @@@
  #! /usr/bin/env ruby
@y
[source,console]
----
$ git diff
diff --cc hello.rb
index a440db6,54336ba..0000000
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
----
@y
  def hello
-   puts 'hola world'
 -  puts 'hello mundo'
++  puts 'hola mundo'
  end
----
@z

@x
image::images/rerere3.png[]
@y
image::images/rerere3.png[]
@z

@x
You can also recreate the conflicted file state with `git checkout`:
@y
You can also recreate the conflicted file state with `git checkout`:
@z

@x
[source,console]
----
$ git checkout --conflict=merge hello.rb
$ cat hello.rb
#! /usr/bin/env ruby
@y
[source,console]
----
$ git checkout --conflict=merge hello.rb
$ cat hello.rb
#! /usr/bin/env ruby
@z

@x
def hello
<<<<<<< ours
  puts 'hola world'
=======
  puts 'hello mundo'
>>>>>>> theirs
end
----
@y
def hello
<<<<<<< ours
  puts 'hola world'
=======
  puts 'hello mundo'
>>>>>>> theirs
end
----
@z

@x
We saw an example of this in <<ch07-git-tools#_advanced_merging>>.
For now though, let's re-resolve it by just running `git rerere` again:
@y
We saw an example of this in <<ch07-git-tools#_advanced_merging>>.
For now though, let's re-resolve it by just running `git rerere` again:
@z

@x
[source,console]
----
$ git rerere
Resolved 'hello.rb' using previous resolution.
$ cat hello.rb
#! /usr/bin/env ruby
@y
[source,console]
----
$ git rerere
Resolved 'hello.rb' using previous resolution.
$ cat hello.rb
#! /usr/bin/env ruby
@z

@x
def hello
  puts 'hola mundo'
end
----
@y
def hello
  puts 'hola mundo'
end
----
@z

@x
We have re-resolved the file automatically using the `rerere` cached resolution.
You can now add and continue the rebase to complete it.
@y
We have re-resolved the file automatically using the `rerere` cached resolution.
You can now add and continue the rebase to complete it.
@z

@x
[source,console]
----
$ git add hello.rb
$ git rebase --continue
Applying: i18n one word
----
@y
[source,console]
----
$ git add hello.rb
$ git rebase --continue
Applying: i18n one word
----
@z

@x
So, if you do a lot of re-merges, or want to keep a topic branch up to date with your `master` branch without a ton of merges, or you rebase often, you can turn on `rerere` to help your life out a bit.
@y
So, if you do a lot of re-merges, or want to keep a topic branch up to date with your `master` branch without a ton of merges, or you rebase often, you can turn on `rerere` to help your life out a bit.
@z
