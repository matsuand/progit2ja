%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_hooks]]
=== Git Hooks
@y
[[_git_hooks]]
=== Git Hooks
@z

@x
(((hooks)))
Like many other Version Control Systems, Git has a way to fire off custom scripts when certain important actions occur.
There are two groups of these hooks: client-side and server-side.
Client-side hooks are triggered by operations such as committing and merging, while server-side hooks run on network operations such as receiving pushed commits.
You can use these hooks for all sorts of reasons.
@y
(((hooks)))
Like many other Version Control Systems, Git has a way to fire off custom scripts when certain important actions occur.
There are two groups of these hooks: client-side and server-side.
Client-side hooks are triggered by operations such as committing and merging, while server-side hooks run on network operations such as receiving pushed commits.
You can use these hooks for all sorts of reasons.
@z

@x
==== Installing a Hook
@y
==== Installing a Hook
@z

@x
The hooks are all stored in the `hooks` subdirectory of the Git directory.
In most projects, that's `.git/hooks`.
When you initialize a new repository with `git init`, Git populates the hooks directory with a bunch of example scripts, many of which are useful by themselves; but they also document the input values of each script.
All the examples are written as shell scripts, with some Perl thrown in, but any properly named executable scripts will work fine – you can write them in Ruby or Python or whatever language you are familiar with.
If you want to use the bundled hook scripts, you'll have to rename them; their file names all end with `.sample`.
@y
The hooks are all stored in the `hooks` subdirectory of the Git directory.
In most projects, that's `.git/hooks`.
When you initialize a new repository with `git init`, Git populates the hooks directory with a bunch of example scripts, many of which are useful by themselves; but they also document the input values of each script.
All the examples are written as shell scripts, with some Perl thrown in, but any properly named executable scripts will work fine – you can write them in Ruby or Python or whatever language you are familiar with.
If you want to use the bundled hook scripts, you'll have to rename them; their file names all end with `.sample`.
@z

@x
To enable a hook script, put a file in the `hooks` subdirectory of your .git directory that is named appropriately (without any extension) and is executable.
From that point forward, it should be called.
We'll cover most of the major hook filenames here.
@y
To enable a hook script, put a file in the `hooks` subdirectory of your .git directory that is named appropriately (without any extension) and is executable.
From that point forward, it should be called.
We'll cover most of the major hook filenames here.
@z

@x
==== Client-Side Hooks
@y
==== Client-Side Hooks
@z

@x
There are a lot of client-side hooks.
This section splits them into committing-workflow hooks, email-workflow scripts, and everything else.
@y
There are a lot of client-side hooks.
This section splits them into committing-workflow hooks, email-workflow scripts, and everything else.
@z

@x
[NOTE]
====
It's important to note that client-side hooks are *not* copied when you clone a repository.
If your intent with these scripts is to enforce a policy, you'll probably want to do that on the server side; see the example in <<ch08-customizing-git#_an_example_git_enforced_policy>>.
====
@y
[NOTE]
====
It's important to note that client-side hooks are *not* copied when you clone a repository.
If your intent with these scripts is to enforce a policy, you'll probably want to do that on the server side; see the example in <<ch08-customizing-git#_an_example_git_enforced_policy>>.
====
@z

@x
===== Committing-Workflow Hooks
@y
===== Committing-Workflow Hooks
@z

@x
The first four hooks have to do with the committing process.
@y
The first four hooks have to do with the committing process.
@z

@x
The `pre-commit` hook is run first, before you even type in a commit message.
It's used to inspect the snapshot that's about to be committed, to see if you've forgotten something, to make sure tests run, or to examine whatever you need to inspect in the code.
Exiting non-zero from this hook aborts the commit, although you can bypass it with `git commit --no-verify`.
You can do things like check for code style (run `lint` or something equivalent), check for trailing whitespace (the default hook does exactly this), or check for appropriate documentation on new methods.
@y
The `pre-commit` hook is run first, before you even type in a commit message.
It's used to inspect the snapshot that's about to be committed, to see if you've forgotten something, to make sure tests run, or to examine whatever you need to inspect in the code.
Exiting non-zero from this hook aborts the commit, although you can bypass it with `git commit --no-verify`.
You can do things like check for code style (run `lint` or something equivalent), check for trailing whitespace (the default hook does exactly this), or check for appropriate documentation on new methods.
@z

@x
The `prepare-commit-msg` hook is run before the commit message editor is fired up but after the default message is created.
It lets you edit the default message before the commit author sees it.
This hook takes a few parameters: the path to the file that holds the commit message so far, the type of commit, and the commit SHA-1 if this is an amended commit.
This hook generally isn't useful for normal commits; rather, it's good for commits where the default message is auto-generated, such as templated commit messages, merge commits, squashed commits, and amended commits.
You may use it in conjunction with a commit template to programmatically insert information.
@y
The `prepare-commit-msg` hook is run before the commit message editor is fired up but after the default message is created.
It lets you edit the default message before the commit author sees it.
This hook takes a few parameters: the path to the file that holds the commit message so far, the type of commit, and the commit SHA-1 if this is an amended commit.
This hook generally isn't useful for normal commits; rather, it's good for commits where the default message is auto-generated, such as templated commit messages, merge commits, squashed commits, and amended commits.
You may use it in conjunction with a commit template to programmatically insert information.
@z

@x
The `commit-msg` hook takes one parameter, which again is the path to a temporary file that contains the commit message written by the developer.
If this script exits non-zero, Git aborts the commit process, so you can use it to validate your project state or commit message before allowing a commit to go through.
In the last section of this chapter, we'll demonstrate using this hook to check that your commit message is conformant to a required pattern.
@y
The `commit-msg` hook takes one parameter, which again is the path to a temporary file that contains the commit message written by the developer.
If this script exits non-zero, Git aborts the commit process, so you can use it to validate your project state or commit message before allowing a commit to go through.
In the last section of this chapter, we'll demonstrate using this hook to check that your commit message is conformant to a required pattern.
@z

@x
After the entire commit process is completed, the `post-commit` hook runs.
It doesn't take any parameters, but you can easily get the last commit by running `git log -1 HEAD`.
Generally, this script is used for notification or something similar.
@y
After the entire commit process is completed, the `post-commit` hook runs.
It doesn't take any parameters, but you can easily get the last commit by running `git log -1 HEAD`.
Generally, this script is used for notification or something similar.
@z

@x
[[_email_hooks]]
===== Email Workflow Hooks
@y
[[_email_hooks]]
===== Email Workflow Hooks
@z

@x
You can set up three client-side hooks for an email-based workflow.
They're all invoked by the `git am` command, so if you aren't using that command in your workflow, you can safely skip to the next section.
If you're taking patches over email prepared by `git format-patch`, then some of these may be helpful to you.
@y
You can set up three client-side hooks for an email-based workflow.
They're all invoked by the `git am` command, so if you aren't using that command in your workflow, you can safely skip to the next section.
If you're taking patches over email prepared by `git format-patch`, then some of these may be helpful to you.
@z

@x
The first hook that is run is `applypatch-msg`.
It takes a single argument: the name of the temporary file that contains the proposed commit message.
Git aborts the patch if this script exits non-zero.
You can use this to make sure a commit message is properly formatted, or to normalize the message by having the script edit it in place.
@y
The first hook that is run is `applypatch-msg`.
It takes a single argument: the name of the temporary file that contains the proposed commit message.
Git aborts the patch if this script exits non-zero.
You can use this to make sure a commit message is properly formatted, or to normalize the message by having the script edit it in place.
@z

@x
The next hook to run when applying patches via `git am` is `pre-applypatch`.
Somewhat confusingly, it is run _after_ the patch is applied but before a commit is made, so you can use it to inspect the snapshot before making the commit.
You can run tests or otherwise inspect the working tree with this script.
If something is missing or the tests don't pass, exiting non-zero aborts the `git am` script without committing the patch.
@y
The next hook to run when applying patches via `git am` is `pre-applypatch`.
Somewhat confusingly, it is run _after_ the patch is applied but before a commit is made, so you can use it to inspect the snapshot before making the commit.
You can run tests or otherwise inspect the working tree with this script.
If something is missing or the tests don't pass, exiting non-zero aborts the `git am` script without committing the patch.
@z

@x
The last hook to run during a `git am` operation is `post-applypatch`, which runs after the commit is made.
You can use it to notify a group or the author of the patch you pulled in that you've done so.
You can't stop the patching process with this script.
@y
The last hook to run during a `git am` operation is `post-applypatch`, which runs after the commit is made.
You can use it to notify a group or the author of the patch you pulled in that you've done so.
You can't stop the patching process with this script.
@z

@x
[[_other_client_hooks]]
===== Other Client Hooks
@y
[[_other_client_hooks]]
===== Other Client Hooks
@z

@x
The `pre-rebase` hook runs before you rebase anything and can halt the process by exiting non-zero.
You can use this hook to disallow rebasing any commits that have already been pushed.
The example `pre-rebase` hook that Git installs does this, although it makes some assumptions that may not match with your workflow.
@y
The `pre-rebase` hook runs before you rebase anything and can halt the process by exiting non-zero.
You can use this hook to disallow rebasing any commits that have already been pushed.
The example `pre-rebase` hook that Git installs does this, although it makes some assumptions that may not match with your workflow.
@z

@x
The `post-rewrite` hook is run by commands that replace commits, such as `git commit --amend` and `git rebase` (though not by `git filter-branch`).
Its single argument is which command triggered the rewrite, and it receives a list of rewrites on `stdin`.
This hook has many of the same uses as the `post-checkout` and `post-merge` hooks.
@y
The `post-rewrite` hook is run by commands that replace commits, such as `git commit --amend` and `git rebase` (though not by `git filter-branch`).
Its single argument is which command triggered the rewrite, and it receives a list of rewrites on `stdin`.
This hook has many of the same uses as the `post-checkout` and `post-merge` hooks.
@z

@x
After you run a successful `git checkout`, the `post-checkout` hook runs; you can use it to set up your working directory properly for your project environment.
This may mean moving in large binary files that you don't want source controlled, auto-generating documentation, or something along those lines.
@y
After you run a successful `git checkout`, the `post-checkout` hook runs; you can use it to set up your working directory properly for your project environment.
This may mean moving in large binary files that you don't want source controlled, auto-generating documentation, or something along those lines.
@z

@x
The `post-merge` hook runs after a successful `merge` command.
You can use it to restore data in the working tree that Git can't track, such as permissions data.
This hook can likewise validate the presence of files external to Git control that you may want copied in when the working tree changes.
@y
The `post-merge` hook runs after a successful `merge` command.
You can use it to restore data in the working tree that Git can't track, such as permissions data.
This hook can likewise validate the presence of files external to Git control that you may want copied in when the working tree changes.
@z

@x
The `pre-push` hook runs during `git push`, after the remote refs have been updated but before any objects have been transferred.
It receives the name and location of the remote as parameters, and a list of to-be-updated refs through `stdin`.
You can use it to validate a set of ref updates before a push occurs (a non-zero exit code will abort the push).
@y
The `pre-push` hook runs during `git push`, after the remote refs have been updated but before any objects have been transferred.
It receives the name and location of the remote as parameters, and a list of to-be-updated refs through `stdin`.
You can use it to validate a set of ref updates before a push occurs (a non-zero exit code will abort the push).
@z

@x
Git occasionally does garbage collection as part of its normal operation, by invoking `git gc --auto`.
The `pre-auto-gc` hook is invoked just before the garbage collection takes place, and can be used to notify you that this is happening, or to abort the collection if now isn't a good time.
@y
Git occasionally does garbage collection as part of its normal operation, by invoking `git gc --auto`.
The `pre-auto-gc` hook is invoked just before the garbage collection takes place, and can be used to notify you that this is happening, or to abort the collection if now isn't a good time.
@z

@x
==== Server-Side Hooks
@y
==== Server-Side Hooks
@z

@x
In addition to the client-side hooks, you can use a couple of important server-side hooks as a system administrator to enforce nearly any kind of policy for your project.
These scripts run before and after pushes to the server.
The pre hooks can exit non-zero at any time to reject the push as well as print an error message back to the client; you can set up a push policy that's as complex as you wish.
@y
In addition to the client-side hooks, you can use a couple of important server-side hooks as a system administrator to enforce nearly any kind of policy for your project.
These scripts run before and after pushes to the server.
The pre hooks can exit non-zero at any time to reject the push as well as print an error message back to the client; you can set up a push policy that's as complex as you wish.
@z

@x
===== `pre-receive`
@y
===== `pre-receive`
@z

@x
The first script to run when handling a push from a client is `pre-receive`.
It takes a list of references that are being pushed from stdin; if it exits non-zero, none of them are accepted.
You can use this hook to do things like make sure none of the updated references are non-fast-forwards, or to do access control for all the refs and files they're modifying with the push.
@y
The first script to run when handling a push from a client is `pre-receive`.
It takes a list of references that are being pushed from stdin; if it exits non-zero, none of them are accepted.
You can use this hook to do things like make sure none of the updated references are non-fast-forwards, or to do access control for all the refs and files they're modifying with the push.
@z

@x
===== `update`
@y
===== `update`
@z

@x
The `update` script is very similar to the `pre-receive` script, except that it's run once for each branch the pusher is trying to update.
If the pusher is trying to push to multiple branches, `pre-receive` runs only once, whereas update runs once per branch they're pushing to.
Instead of reading from stdin, this script takes three arguments: the name of the reference (branch), the SHA-1 that reference pointed to before the push, and the SHA-1 the user is trying to push.
If the update script exits non-zero, only that reference is rejected; other references can still be updated.
@y
The `update` script is very similar to the `pre-receive` script, except that it's run once for each branch the pusher is trying to update.
If the pusher is trying to push to multiple branches, `pre-receive` runs only once, whereas update runs once per branch they're pushing to.
Instead of reading from stdin, this script takes three arguments: the name of the reference (branch), the SHA-1 that reference pointed to before the push, and the SHA-1 the user is trying to push.
If the update script exits non-zero, only that reference is rejected; other references can still be updated.
@z

@x
===== `post-receive`
@y
===== `post-receive`
@z

@x
The `post-receive` hook runs after the entire process is completed and can be used to update other services or notify users.
It takes the same stdin data as the `pre-receive` hook.
Examples include emailing a list, notifying a continuous integration server, or updating a ticket-tracking system – you can even parse the commit messages to see if any tickets need to be opened, modified, or closed.
This script can't stop the push process, but the client doesn't disconnect until it has completed, so be careful if you try to do anything that may take a long time.
@y
The `post-receive` hook runs after the entire process is completed and can be used to update other services or notify users.
It takes the same stdin data as the `pre-receive` hook.
Examples include emailing a list, notifying a continuous integration server, or updating a ticket-tracking system – you can even parse the commit messages to see if any tickets need to be opened, modified, or closed.
This script can't stop the push process, but the client doesn't disconnect until it has completed, so be careful if you try to do anything that may take a long time.
@z
