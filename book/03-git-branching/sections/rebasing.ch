%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_rebasing]]
=== Rebasing
@y
[[_rebasing]]
=== Rebasing
@z

@x
(((rebasing)))
In Git, there are two main ways to integrate changes from one branch into another: the `merge` and the `rebase`.
In this section you'll learn what rebasing is, how to do it, why it's a pretty amazing tool, and in what cases you won't want to use it.
@y
(((rebasing)))
In Git, there are two main ways to integrate changes from one branch into another: the `merge` and the `rebase`.
In this section you'll learn what rebasing is, how to do it, why it's a pretty amazing tool, and in what cases you won't want to use it.
@z

@x
==== The Basic Rebase
@y
==== The Basic Rebase
@z

@x
If you go back to an earlier example from <<_basic_merging>>, you can see that you diverged your work and made commits on two different branches.
@y
If you go back to an earlier example from <<_basic_merging>>, you can see that you diverged your work and made commits on two different branches.
@z

@x
.Simple divergent history
image::images/basic-rebase-1.png[Simple divergent history]
@y
.Simple divergent history
image::images/basic-rebase-1.png[Simple divergent history]
@z

@x
The easiest way to integrate the branches, as we've already covered, is the `merge` command.
It performs a three-way merge between the two latest branch snapshots (`C3` and `C4`) and the most recent common ancestor of the two (`C2`), creating a new snapshot (and commit).
@y
The easiest way to integrate the branches, as we've already covered, is the `merge` command.
It performs a three-way merge between the two latest branch snapshots (`C3` and `C4`) and the most recent common ancestor of the two (`C2`), creating a new snapshot (and commit).
@z

@x
[[rebasing-merging-example]]
.Merging to integrate diverged work history
image::images/basic-rebase-2.png[Merging to integrate diverged work history]
@y
[[rebasing-merging-example]]
.Merging to integrate diverged work history
image::images/basic-rebase-2.png[Merging to integrate diverged work history]
@z

@x
However, there is another way: you can take the patch of the change that was introduced in `C4` and reapply it on top of `C3`.
In Git, this is called _rebasing_.
With the `rebase` command, you can take all the changes that were committed on one branch and replay them on a different branch.(((git commands, rebase)))
@y
However, there is another way: you can take the patch of the change that was introduced in `C4` and reapply it on top of `C3`.
In Git, this is called _rebasing_.
With the `rebase` command, you can take all the changes that were committed on one branch and replay them on a different branch.(((git commands, rebase)))
@z

@x
For this example, you would check out the `experiment` branch, and then rebase it onto the `master` branch as follows:
@y
For this example, you would check out the `experiment` branch, and then rebase it onto the `master` branch as follows:
@z

@x
[source,console]
----
$ git checkout experiment
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: added staged command
----
@y
[source,console]
----
$ git checkout experiment
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: added staged command
----
@z

@x
This operation works by going to the common ancestor of the two branches (the one you're on and the one you're rebasing onto), getting the diff introduced by each commit of the branch you're on, saving those diffs to temporary files, resetting the current branch to the same commit as the branch you are rebasing onto, and finally applying each change in turn.
@y
This operation works by going to the common ancestor of the two branches (the one you're on and the one you're rebasing onto), getting the diff introduced by each commit of the branch you're on, saving those diffs to temporary files, resetting the current branch to the same commit as the branch you are rebasing onto, and finally applying each change in turn.
@z

@x
.Rebasing the change introduced in `C4` onto `C3`
image::images/basic-rebase-3.png[Rebasing the change introduced in `C4` onto `C3`]
@y
.Rebasing the change introduced in `C4` onto `C3`
image::images/basic-rebase-3.png[Rebasing the change introduced in `C4` onto `C3`]
@z

@x
At this point, you can go back to the `master` branch and do a fast-forward merge.
@y
At this point, you can go back to the `master` branch and do a fast-forward merge.
@z

@x
[source,console]
----
$ git checkout master
$ git merge experiment
----
@y
[source,console]
----
$ git checkout master
$ git merge experiment
----
@z

@x
.Fast-forwarding the `master` branch
image::images/basic-rebase-4.png[Fast-forwarding the `master` branch]
@y
.Fast-forwarding the `master` branch
image::images/basic-rebase-4.png[Fast-forwarding the `master` branch]
@z

@x
Now, the snapshot pointed to by `C4'` is exactly the same as the one that was pointed to by `C5` in <<rebasing-merging-example,the merge example>>.
There is no difference in the end product of the integration, but rebasing makes for a cleaner history.
If you examine the log of a rebased branch, it looks like a linear history: it appears that all the work happened in series, even when it originally happened in parallel.
@y
Now, the snapshot pointed to by `C4'` is exactly the same as the one that was pointed to by `C5` in <<rebasing-merging-example,the merge example>>.
There is no difference in the end product of the integration, but rebasing makes for a cleaner history.
If you examine the log of a rebased branch, it looks like a linear history: it appears that all the work happened in series, even when it originally happened in parallel.
@z

@x
Often, you'll do this to make sure your commits apply cleanly on a remote branch -- perhaps in a project to which you're trying to contribute but that you don't maintain.
In this case, you'd do your work in a branch and then rebase your work onto `origin/master` when you were ready to submit your patches to the main project.
That way, the maintainer doesn't have to do any integration work -- just a fast-forward or a clean apply.
@y
Often, you'll do this to make sure your commits apply cleanly on a remote branch -- perhaps in a project to which you're trying to contribute but that you don't maintain.
In this case, you'd do your work in a branch and then rebase your work onto `origin/master` when you were ready to submit your patches to the main project.
That way, the maintainer doesn't have to do any integration work -- just a fast-forward or a clean apply.
@z

@x
Note that the snapshot pointed to by the final commit you end up with, whether it's the last of the rebased commits for a rebase or the final merge commit after a merge, is the same snapshot -- it's only the history that is different.
Rebasing replays changes from one line of work onto another in the order they were introduced, whereas merging takes the endpoints and merges them together.
@y
Note that the snapshot pointed to by the final commit you end up with, whether it's the last of the rebased commits for a rebase or the final merge commit after a merge, is the same snapshot -- it's only the history that is different.
Rebasing replays changes from one line of work onto another in the order they were introduced, whereas merging takes the endpoints and merges them together.
@z

@x
==== More Interesting Rebases
@y
==== More Interesting Rebases
@z

@x
You can also have your rebase replay on something other than the rebase target branch.
Take a history like <<rbdiag_e>>, for example.
You branched a topic branch (`server`) to add some server-side functionality to your project, and made a commit.
Then, you branched off that to make the client-side changes (`client`) and committed a few times.
Finally, you went back to your server branch and did a few more commits.
@y
You can also have your rebase replay on something other than the rebase target branch.
Take a history like <<rbdiag_e>>, for example.
You branched a topic branch (`server`) to add some server-side functionality to your project, and made a commit.
Then, you branched off that to make the client-side changes (`client`) and committed a few times.
Finally, you went back to your server branch and did a few more commits.
@z

@x
[[rbdiag_e]]
.A history with a topic branch off another topic branch
image::images/interesting-rebase-1.png[A history with a topic branch off another topic branch]
@y
[[rbdiag_e]]
.A history with a topic branch off another topic branch
image::images/interesting-rebase-1.png[A history with a topic branch off another topic branch]
@z

@x
Suppose you decide that you want to merge your client-side changes into your mainline for a release, but you want to hold off on the server-side changes until it's tested further.
You can take the changes on `client` that aren't on `server` (`C8` and `C9`) and replay them on your `master` branch by using the `--onto` option of `git rebase`:
@y
Suppose you decide that you want to merge your client-side changes into your mainline for a release, but you want to hold off on the server-side changes until it's tested further.
You can take the changes on `client` that aren't on `server` (`C8` and `C9`) and replay them on your `master` branch by using the `--onto` option of `git rebase`:
@z

@x
[source,console]
----
$ git rebase --onto master server client
----
@y
[source,console]
----
$ git rebase --onto master server client
----
@z

@x
This basically says, "`Take the `client` branch, figure out the patches since it diverged from the `server` branch, and replay these patches in the `client` branch as if it was based directly off the `master` branch instead.`"
It's a bit complex, but the result is pretty cool.
@y
This basically says, "`Take the `client` branch, figure out the patches since it diverged from the `server` branch, and replay these patches in the `client` branch as if it was based directly off the `master` branch instead.`"
It's a bit complex, but the result is pretty cool.
@z

@x
.Rebasing a topic branch off another topic branch
image::images/interesting-rebase-2.png[Rebasing a topic branch off another topic branch]
@y
.Rebasing a topic branch off another topic branch
image::images/interesting-rebase-2.png[Rebasing a topic branch off another topic branch]
@z

@x
Now you can fast-forward your `master` branch (see <<rbdiag_g>>):
@y
Now you can fast-forward your `master` branch (see <<rbdiag_g>>):
@z

@x
[source,console]
----
$ git checkout master
$ git merge client
----
@y
[source,console]
----
$ git checkout master
$ git merge client
----
@z

@x
[[rbdiag_g]]
.Fast-forwarding your `master` branch to include the client branch changes
image::images/interesting-rebase-3.png[Fast-forwarding your `master` branch to include the client branch changes]
@y
[[rbdiag_g]]
.Fast-forwarding your `master` branch to include the client branch changes
image::images/interesting-rebase-3.png[Fast-forwarding your `master` branch to include the client branch changes]
@z

@x
Let's say you decide to pull in your server branch as well.
You can rebase the `server` branch onto the `master` branch without having to check it out first by running `git rebase <basebranch> <topicbranch>` -- which checks out the topic branch (in this case, `server`) for you and replays it onto the base branch (`master`):
@y
Let's say you decide to pull in your server branch as well.
You can rebase the `server` branch onto the `master` branch without having to check it out first by running `git rebase <basebranch> <topicbranch>` -- which checks out the topic branch (in this case, `server`) for you and replays it onto the base branch (`master`):
@z

@x
[source,console]
----
$ git rebase master server
----
@y
[source,console]
----
$ git rebase master server
----
@z

@x
This replays your `server` work on top of your `master` work, as shown in <<rbdiag_h>>.
@y
This replays your `server` work on top of your `master` work, as shown in <<rbdiag_h>>.
@z

@x
[[rbdiag_h]]
.Rebasing your server branch on top of your `master` branch
image::images/interesting-rebase-4.png[Rebasing your server branch on top of your `master` branch]
@y
[[rbdiag_h]]
.Rebasing your server branch on top of your `master` branch
image::images/interesting-rebase-4.png[Rebasing your server branch on top of your `master` branch]
@z

@x
Then, you can fast-forward the base branch (`master`):
@y
Then, you can fast-forward the base branch (`master`):
@z

@x
[source,console]
----
$ git checkout master
$ git merge server
----
@y
[source,console]
----
$ git checkout master
$ git merge server
----
@z

@x
You can remove the `client` and `server` branches because all the work is integrated and you don't need them anymore, leaving your history for this entire process looking like <<rbdiag_i>>:
@y
You can remove the `client` and `server` branches because all the work is integrated and you don't need them anymore, leaving your history for this entire process looking like <<rbdiag_i>>:
@z

@x
[source,console]
----
$ git branch -d client
$ git branch -d server
----
@y
[source,console]
----
$ git branch -d client
$ git branch -d server
----
@z

@x
[[rbdiag_i]]
.Final commit history
image::images/interesting-rebase-5.png[Final commit history]
@y
[[rbdiag_i]]
.Final commit history
image::images/interesting-rebase-5.png[Final commit history]
@z

@x
[[_rebase_peril]]
==== The Perils of Rebasing
@y
[[_rebase_peril]]
==== The Perils of Rebasing
@z

@x
(((rebasing, perils of)))
Ahh, but the bliss of rebasing isn't without its drawbacks, which can be summed up in a single line:
@y
(((rebasing, perils of)))
Ahh, but the bliss of rebasing isn't without its drawbacks, which can be summed up in a single line:
@z

@x
*Do not rebase commits that exist outside your repository and that people may have based work on.*
@y
*Do not rebase commits that exist outside your repository and that people may have based work on.*
@z

@x
If you follow that guideline, you'll be fine.
If you don't, people will hate you, and you'll be scorned by friends and family.
@y
If you follow that guideline, you'll be fine.
If you don't, people will hate you, and you'll be scorned by friends and family.
@z

@x
When you rebase stuff, you're abandoning existing commits and creating new ones that are similar but different.
If you push commits somewhere and others pull them down and base work on them, and then you rewrite those commits with `git rebase` and push them up again, your collaborators will have to re-merge their work and things will get messy when you try to pull their work back into yours.
@y
When you rebase stuff, you're abandoning existing commits and creating new ones that are similar but different.
If you push commits somewhere and others pull them down and base work on them, and then you rewrite those commits with `git rebase` and push them up again, your collaborators will have to re-merge their work and things will get messy when you try to pull their work back into yours.
@z

@x
Let's look at an example of how rebasing work that you've made public can cause problems.
Suppose you clone from a central server and then do some work off that.
Your commit history looks like this:
@y
Let's look at an example of how rebasing work that you've made public can cause problems.
Suppose you clone from a central server and then do some work off that.
Your commit history looks like this:
@z

@x
.Clone a repository, and base some work on it
image::images/perils-of-rebasing-1.png["Clone a repository, and base some work on it."]
@y
.Clone a repository, and base some work on it
image::images/perils-of-rebasing-1.png["Clone a repository, and base some work on it."]
@z

@x
Now, someone else does more work that includes a merge, and pushes that work to the central server.
You fetch it and merge the new remote branch into your work, making your history look something like this:
@y
Now, someone else does more work that includes a merge, and pushes that work to the central server.
You fetch it and merge the new remote branch into your work, making your history look something like this:
@z

@x
.Fetch more commits, and merge them into your work
image::images/perils-of-rebasing-2.png["Fetch more commits, and merge them into your work."]
@y
.Fetch more commits, and merge them into your work
image::images/perils-of-rebasing-2.png["Fetch more commits, and merge them into your work."]
@z

@x
Next, the person who pushed the merged work decides to go back and rebase their work instead; they do a `git push --force` to overwrite the history on the server.
You then fetch from that server, bringing down the new commits.
@y
Next, the person who pushed the merged work decides to go back and rebase their work instead; they do a `git push --force` to overwrite the history on the server.
You then fetch from that server, bringing down the new commits.
@z

@x
[[_pre_merge_rebase_work]]
.Someone pushes rebased commits, abandoning commits you've based your work on
image::images/perils-of-rebasing-3.png["Someone pushes rebased commits, abandoning commits you've based your work on."]
@y
[[_pre_merge_rebase_work]]
.Someone pushes rebased commits, abandoning commits you've based your work on
image::images/perils-of-rebasing-3.png["Someone pushes rebased commits, abandoning commits you've based your work on."]
@z

@x
Now you're both in a pickle.
If you do a `git pull`, you'll create a merge commit which includes both lines of history, and your repository will look like this:
@y
Now you're both in a pickle.
If you do a `git pull`, you'll create a merge commit which includes both lines of history, and your repository will look like this:
@z

@x
[[_merge_rebase_work]]
.You merge in the same work again into a new merge commit
image::images/perils-of-rebasing-4.png[You merge in the same work again into a new merge commit]
@y
[[_merge_rebase_work]]
.You merge in the same work again into a new merge commit
image::images/perils-of-rebasing-4.png[You merge in the same work again into a new merge commit]
@z

@x
If you run a `git log` when your history looks like this, you'll see two commits that have the same author, date, and message, which will be confusing.
Furthermore, if you push this history back up to the server, you'll reintroduce all those rebased commits to the central server, which can further confuse people.
It's pretty safe to assume that the other developer doesn't want `C4` and `C6` to be in the history; that's why they rebased in the first place.
@y
If you run a `git log` when your history looks like this, you'll see two commits that have the same author, date, and message, which will be confusing.
Furthermore, if you push this history back up to the server, you'll reintroduce all those rebased commits to the central server, which can further confuse people.
It's pretty safe to assume that the other developer doesn't want `C4` and `C6` to be in the history; that's why they rebased in the first place.
@z

@x
[[_rebase_rebase]]
==== Rebase When You Rebase
@y
[[_rebase_rebase]]
==== Rebase When You Rebase
@z

@x
If you *do* find yourself in a situation like this, Git has some further magic that might help you out.
If someone on your team force pushes changes that overwrite work that you've based work on, your challenge is to figure out what is yours and what they've rewritten.
@y
If you *do* find yourself in a situation like this, Git has some further magic that might help you out.
If someone on your team force pushes changes that overwrite work that you've based work on, your challenge is to figure out what is yours and what they've rewritten.
@z

@x
It turns out that in addition to the commit SHA-1 checksum, Git also calculates a checksum that is based just on the patch introduced with the commit.
This is called a "`patch-id`".
@y
It turns out that in addition to the commit SHA-1 checksum, Git also calculates a checksum that is based just on the patch introduced with the commit.
This is called a "`patch-id`".
@z

@x
If you pull down work that was rewritten and rebase it on top of the new commits from your partner, Git can often successfully figure out what is uniquely yours and apply them back on top of the new branch.
@y
If you pull down work that was rewritten and rebase it on top of the new commits from your partner, Git can often successfully figure out what is uniquely yours and apply them back on top of the new branch.
@z

@x
For instance, in the previous scenario, if instead of doing a merge when we're at <<_pre_merge_rebase_work>> we run `git rebase teamone/master`, Git will:
@y
For instance, in the previous scenario, if instead of doing a merge when we're at <<_pre_merge_rebase_work>> we run `git rebase teamone/master`, Git will:
@z

@x
* Determine what work is unique to our branch (C2, C3, C4, C6, C7)
* Determine which are not merge commits (C2, C3, C4)
* Determine which have not been rewritten into the target branch (just C2 and C3, since C4 is the same patch as C4')
* Apply those commits to the top of `teamone/master`
@y
* Determine what work is unique to our branch (C2, C3, C4, C6, C7)
* Determine which are not merge commits (C2, C3, C4)
* Determine which have not been rewritten into the target branch (just C2 and C3, since C4 is the same patch as C4')
* Apply those commits to the top of `teamone/master`
@z

@x
So instead of the result we see in <<_merge_rebase_work>>, we would end up with something more like <<_rebase_rebase_work>>.
@y
So instead of the result we see in <<_merge_rebase_work>>, we would end up with something more like <<_rebase_rebase_work>>.
@z

@x
[[_rebase_rebase_work]]
.Rebase on top of force-pushed rebase work
image::images/perils-of-rebasing-5.png[Rebase on top of force-pushed rebase work]
@y
[[_rebase_rebase_work]]
.Rebase on top of force-pushed rebase work
image::images/perils-of-rebasing-5.png[Rebase on top of force-pushed rebase work]
@z

@x
This only works if `C4` and `C4'` that your partner made are almost exactly the same patch.
Otherwise the rebase won't be able to tell that it's a duplicate and will add another C4-like patch (which will probably fail to apply cleanly, since the changes would already be at least somewhat there).
@y
This only works if `C4` and `C4'` that your partner made are almost exactly the same patch.
Otherwise the rebase won't be able to tell that it's a duplicate and will add another C4-like patch (which will probably fail to apply cleanly, since the changes would already be at least somewhat there).
@z

@x
You can also simplify this by running a `git pull --rebase` instead of a normal `git pull`.
Or you could do it manually with a `git fetch` followed by a `git rebase teamone/master` in this case.
@y
You can also simplify this by running a `git pull --rebase` instead of a normal `git pull`.
Or you could do it manually with a `git fetch` followed by a `git rebase teamone/master` in this case.
@z

@x
If you are using `git pull` and want to make `--rebase` the default, you can set the `pull.rebase` config value with something like `git config --global pull.rebase true`.
@y
If you are using `git pull` and want to make `--rebase` the default, you can set the `pull.rebase` config value with something like `git config --global pull.rebase true`.
@z

@x
If you only ever rebase commits that have never left your own computer, you'll be just fine.
If you rebase commits that have been pushed, but that no one else has based commits from, you'll also be fine.
If you rebase commits that have already been pushed publicly, and people may have based work on those commits, then you may be in for some frustrating trouble, and the scorn of your teammates.
@y
If you only ever rebase commits that have never left your own computer, you'll be just fine.
If you rebase commits that have been pushed, but that no one else has based commits from, you'll also be fine.
If you rebase commits that have already been pushed publicly, and people may have based work on those commits, then you may be in for some frustrating trouble, and the scorn of your teammates.
@z

@x
If you or a partner does find it necessary at some point, make sure everyone knows to run `git pull --rebase` to try to make the pain after it happens a little bit simpler.
@y
If you or a partner does find it necessary at some point, make sure everyone knows to run `git pull --rebase` to try to make the pain after it happens a little bit simpler.
@z

@x
==== Rebase vs. Merge
@y
==== Rebase vs. Merge
@z

@x
(((rebasing, vs. merging)))(((merging, vs. rebasing)))
Now that you've seen rebasing and merging in action, you may be wondering which one is better.
Before we can answer this, let's step back a bit and talk about what history means.
@y
(((rebasing, vs. merging)))(((merging, vs. rebasing)))
Now that you've seen rebasing and merging in action, you may be wondering which one is better.
Before we can answer this, let's step back a bit and talk about what history means.
@z

@x
One point of view on this is that your repository's commit history is a *record of what actually happened.*
It's a historical document, valuable in its own right, and shouldn't be tampered with.
From this angle, changing the commit history is almost blasphemous; you're _lying_ about what actually transpired.
So what if there was a messy series of merge commits?
That's how it happened, and the repository should preserve that for posterity.
@y
One point of view on this is that your repository's commit history is a *record of what actually happened.*
It's a historical document, valuable in its own right, and shouldn't be tampered with.
From this angle, changing the commit history is almost blasphemous; you're _lying_ about what actually transpired.
So what if there was a messy series of merge commits?
That's how it happened, and the repository should preserve that for posterity.
@z

@x
The opposing point of view is that the commit history is the *story of how your project was made.*
You wouldn't publish the first draft of a book, so why show your messy work?
When you're working on a project, you may need a record of all your missteps and dead-end paths, but when it's time to show your work to the world, you may want to tell a more coherent story of how to get from A to B.
People in this camp use tools like rebase and filter-branch to rewrite their commits before they're merged into the mainline branch.
They use tools like `rebase` and `filter-branch`, to tell the story in the way that's best for future readers.
@y
The opposing point of view is that the commit history is the *story of how your project was made.*
You wouldn't publish the first draft of a book, so why show your messy work?
When you're working on a project, you may need a record of all your missteps and dead-end paths, but when it's time to show your work to the world, you may want to tell a more coherent story of how to get from A to B.
People in this camp use tools like rebase and filter-branch to rewrite their commits before they're merged into the mainline branch.
They use tools like `rebase` and `filter-branch`, to tell the story in the way that's best for future readers.
@z

@x
Now, to the question of whether merging or rebasing is better: hopefully you'll see that it's not that simple.
Git is a powerful tool, and allows you to do many things to and with your history, but every team and every project is different.
Now that you know how both of these things work, it's up to you to decide which one is best for your particular situation.
@y
Now, to the question of whether merging or rebasing is better: hopefully you'll see that it's not that simple.
Git is a powerful tool, and allows you to do many things to and with your history, but every team and every project is different.
Now that you know how both of these things work, it's up to you to decide which one is best for your particular situation.
@z

@x
You can get the best of both worlds: rebase local changes before pushing to clean up your work, but never rebase anything that you've pushed somewhere.
@y
You can get the best of both worlds: rebase local changes before pushing to clean up your work, but never rebase anything that you've pushed somewhere.
@z
