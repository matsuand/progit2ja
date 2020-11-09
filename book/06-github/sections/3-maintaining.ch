%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_maintaining_gh_project]]
=== Maintaining a Project
@y
[[_maintaining_gh_project]]
=== Maintaining a Project
@z

@x
Now that we're comfortable contributing to a project, let's look at the other side: creating, maintaining and administering your own project.
@y
Now that we're comfortable contributing to a project, let's look at the other side: creating, maintaining and administering your own project.
@z

@x
==== Creating a New Repository
@y
==== Creating a New Repository
@z

@x
Let's create a new repository to share our project code with.
Start by clicking the "`New repository`" button on the right-hand side of the dashboard, or from the `+` button in the top toolbar next to your username as seen in <<_new_repo_dropdown>>.
@y
Let's create a new repository to share our project code with.
Start by clicking the "`New repository`" button on the right-hand side of the dashboard, or from the `+` button in the top toolbar next to your username as seen in <<_new_repo_dropdown>>.
@z

@x
.The "`Your repositories`" area
image::images/newrepo.png[The "`Your repositories`" area]
@y
.The "`Your repositories`" area
image::images/newrepo.png[The "`Your repositories`" area]
@z

@x
[[_new_repo_dropdown]]
.The "`New repository`" dropdown
image::images/new-repo.png[The "`new repository`" dropdown]
@y
[[_new_repo_dropdown]]
.The "`New repository`" dropdown
image::images/new-repo.png[The "`new repository`" dropdown]
@z

@x
This takes you to the "`new repository`" form:
@y
This takes you to the "`new repository`" form:
@z

@x
.The "`new repository`" form
image::images/newrepoform.png[The "`new repository`" form]
@y
.The "`new repository`" form
image::images/newrepoform.png[The "`new repository`" form]
@z

@x
All you really have to do here is provide a project name; the rest of the fields are completely optional.
For now, just click the "`Create Repository`" button, and boom – you have a new repository on GitHub, named `<user>/<project_name>`.
@y
All you really have to do here is provide a project name; the rest of the fields are completely optional.
For now, just click the "`Create Repository`" button, and boom – you have a new repository on GitHub, named `<user>/<project_name>`.
@z

@x
Since you have no code there yet, GitHub will show you instructions for how to create a brand-new Git repository, or connect an existing Git project.
We won't belabor this here; if you need a refresher, check out <<ch02-git-basics-chapter#ch02-git-basics-chapter>>.
@y
Since you have no code there yet, GitHub will show you instructions for how to create a brand-new Git repository, or connect an existing Git project.
We won't belabor this here; if you need a refresher, check out <<ch02-git-basics-chapter#ch02-git-basics-chapter>>.
@z

@x
Now that your project is hosted on GitHub, you can give the URL to anyone you want to share your project with.
Every project on GitHub is accessible over HTTPS as `https://github.com/<user>/<project_name>`, and over SSH as `git@github.com:<user>/<project_name>`.
Git can fetch from and push to both of these URLs, but they are access-controlled based on the credentials of the user connecting to them.
@y
Now that your project is hosted on GitHub, you can give the URL to anyone you want to share your project with.
Every project on GitHub is accessible over HTTPS as `https://github.com/<user>/<project_name>`, and over SSH as `git@github.com:<user>/<project_name>`.
Git can fetch from and push to both of these URLs, but they are access-controlled based on the credentials of the user connecting to them.
@z

@x
[NOTE]
====
It is often preferable to share the HTTPS based URL for a public project, since the user does not have to have a GitHub account to access it for cloning.
Users will have to have an account and an uploaded SSH key to access your project if you give them the SSH URL.
The HTTPS one is also exactly the same URL they would paste into a browser to view the project there.
====
@y
[NOTE]
====
It is often preferable to share the HTTPS based URL for a public project, since the user does not have to have a GitHub account to access it for cloning.
Users will have to have an account and an uploaded SSH key to access your project if you give them the SSH URL.
The HTTPS one is also exactly the same URL they would paste into a browser to view the project there.
====
@z

@x
==== Adding Collaborators
@y
==== Adding Collaborators
@z

@x
If you're working with other people who you want to give commit access to, you need to add them as "`collaborators`".
If Ben, Jeff, and Louise all sign up for accounts on GitHub, and you want to give them push access to your repository, you can add them to your project.
Doing so will give them "`push`" access, which means they have both read and write access to the project and Git repository.
@y
If you're working with other people who you want to give commit access to, you need to add them as "`collaborators`".
If Ben, Jeff, and Louise all sign up for accounts on GitHub, and you want to give them push access to your repository, you can add them to your project.
Doing so will give them "`push`" access, which means they have both read and write access to the project and Git repository.
@z

@x
Click the "`Settings`" link at the bottom of the right-hand sidebar.
@y
Click the "`Settings`" link at the bottom of the right-hand sidebar.
@z

@x
.The repository settings link
image::images/reposettingslink.png[The repository settings link]
@y
.The repository settings link
image::images/reposettingslink.png[The repository settings link]
@z

@x
Then select "`Collaborators`" from the menu on the left-hand side.
Then, just type a username into the box, and click "`Add collaborator.`"
You can repeat this as many times as you like to grant access to everyone you like.
If you need to revoke access, just click the "`X`" on the right-hand side of their row.
@y
Then select "`Collaborators`" from the menu on the left-hand side.
Then, just type a username into the box, and click "`Add collaborator.`"
You can repeat this as many times as you like to grant access to everyone you like.
If you need to revoke access, just click the "`X`" on the right-hand side of their row.
@z

@x
.Repository collaborators
image::images/collaborators.png[The repository collaborators box]
@y
.Repository collaborators
image::images/collaborators.png[The repository collaborators box]
@z

@x
==== Managing Pull Requests
@y
==== Managing Pull Requests
@z

@x
Now that you have a project with some code in it and maybe even a few collaborators who also have push access, let's go over what to do when you get a Pull Request yourself.
@y
Now that you have a project with some code in it and maybe even a few collaborators who also have push access, let's go over what to do when you get a Pull Request yourself.
@z

@x
Pull Requests can either come from a branch in a fork of your repository or they can come from another branch in the same repository.
The only difference is that the ones in a fork are often from people where you can't push to their branch and they can't push to yours, whereas with internal Pull Requests generally both parties can access the branch.
@y
Pull Requests can either come from a branch in a fork of your repository or they can come from another branch in the same repository.
The only difference is that the ones in a fork are often from people where you can't push to their branch and they can't push to yours, whereas with internal Pull Requests generally both parties can access the branch.
@z

@x
For these examples, let's assume you are "`tonychacon`" and you've created a new Arduino code project named "`fade`".
@y
For these examples, let's assume you are "`tonychacon`" and you've created a new Arduino code project named "`fade`".
@z

@x
[[_email_notifications]]
===== Email Notifications
@y
[[_email_notifications]]
===== Email Notifications
@z

@x
Someone comes along and makes a change to your code and sends you a Pull Request.
You should get an email notifying you about the new Pull Request and it should look something like <<_email_pr>>.
@y
Someone comes along and makes a change to your code and sends you a Pull Request.
You should get an email notifying you about the new Pull Request and it should look something like <<_email_pr>>.
@z

@x
[[_email_pr]]
.Email notification of a new Pull Request
image::images/maint-01-email.png[Pull Request email notification]
@y
[[_email_pr]]
.Email notification of a new Pull Request
image::images/maint-01-email.png[Pull Request email notification]
@z

@x
There are a few things to notice about this email.
It will give you a small diffstat -- a list of files that have changed in the Pull Request and by how much.
It gives you a link to the Pull Request on GitHub.
It also gives you a few URLs that you can use from the command line.
@y
There are a few things to notice about this email.
It will give you a small diffstat -- a list of files that have changed in the Pull Request and by how much.
It gives you a link to the Pull Request on GitHub.
It also gives you a few URLs that you can use from the command line.
@z

@x
If you notice the line that says `git pull <url> patch-1`, this is a simple way to merge in a remote branch without having to add a remote.
We went over this quickly in <<ch05-distributed-git#_checking_out_remotes>>.
If you wish, you can create and switch to a topic branch and then run this command to merge in the Pull Request changes.
@y
If you notice the line that says `git pull <url> patch-1`, this is a simple way to merge in a remote branch without having to add a remote.
We went over this quickly in <<ch05-distributed-git#_checking_out_remotes>>.
If you wish, you can create and switch to a topic branch and then run this command to merge in the Pull Request changes.
@z

@x
The other interesting URLs are the `.diff` and `.patch` URLs, which as you may guess, provide unified diff and patch versions of the Pull Request.
You could technically merge in the Pull Request work with something like this:
@y
The other interesting URLs are the `.diff` and `.patch` URLs, which as you may guess, provide unified diff and patch versions of the Pull Request.
You could technically merge in the Pull Request work with something like this:
@z

@x
[source,console]
----
$ curl https://github.com/tonychacon/fade/pull/1.patch | git am
----
@y
[source,console]
----
$ curl https://github.com/tonychacon/fade/pull/1.patch | git am
----
@z

@x
===== Collaborating on the Pull Request
@y
===== Collaborating on the Pull Request
@z

@x
As we covered in <<ch06-github#ch06-github_flow>>, you can now have a conversation with the person who opened the Pull Request.
You can comment on specific lines of code, comment on whole commits or comment on the entire Pull Request itself, using GitHub Flavored Markdown everywhere.
@y
As we covered in <<ch06-github#ch06-github_flow>>, you can now have a conversation with the person who opened the Pull Request.
You can comment on specific lines of code, comment on whole commits or comment on the entire Pull Request itself, using GitHub Flavored Markdown everywhere.
@z

@x
Every time someone else comments on the Pull Request you will continue to get email notifications so you know there is activity happening.
They will each have a link to the Pull Request where the activity is happening and you can also directly respond to the email to comment on the Pull Request thread.
@y
Every time someone else comments on the Pull Request you will continue to get email notifications so you know there is activity happening.
They will each have a link to the Pull Request where the activity is happening and you can also directly respond to the email to comment on the Pull Request thread.
@z

@x
.Responses to emails are included in the thread
image::images/maint-03-email-resp.png[Email response]
@y
.Responses to emails are included in the thread
image::images/maint-03-email-resp.png[Email response]
@z

@x
Once the code is in a place you like and want to merge it in, you can either pull the code down and merge it locally, either with the `git pull <url> <branch>` syntax we saw earlier, or by adding the fork as a remote and fetching and merging.
@y
Once the code is in a place you like and want to merge it in, you can either pull the code down and merge it locally, either with the `git pull <url> <branch>` syntax we saw earlier, or by adding the fork as a remote and fetching and merging.
@z

@x
If the merge is trivial, you can also just hit the "`Merge`" button on the GitHub site.
This will do a "`non-fast-forward`" merge, creating a merge commit even if a fast-forward merge was possible.
This means that no matter what, every time you hit the merge button, a merge commit is created.
As you can see in <<_merge_button>>, GitHub gives you all of this information if you click the hint link.
@y
If the merge is trivial, you can also just hit the "`Merge`" button on the GitHub site.
This will do a "`non-fast-forward`" merge, creating a merge commit even if a fast-forward merge was possible.
This means that no matter what, every time you hit the merge button, a merge commit is created.
As you can see in <<_merge_button>>, GitHub gives you all of this information if you click the hint link.
@z

@x
[[_merge_button]]
.Merge button and instructions for merging a Pull Request manually
image::images/maint-02-merge.png[Merge button]
@y
[[_merge_button]]
.Merge button and instructions for merging a Pull Request manually
image::images/maint-02-merge.png[Merge button]
@z

@x
If you decide you don't want to merge it, you can also just close the Pull Request and the person who opened it will be notified.
@y
If you decide you don't want to merge it, you can also just close the Pull Request and the person who opened it will be notified.
@z

@x
[[_pr_refs]]
===== Pull Request Refs
@y
[[_pr_refs]]
===== Pull Request Refs
@z

@x
If you're dealing with a *lot* of Pull Requests and don't want to add a bunch of remotes or do one time pulls every time, there is a neat trick that GitHub allows you to do.
This is a bit of an advanced trick and we'll go over the details of this a bit more in <<ch10-git-internals#_refspec>>, but it can be pretty useful.
@y
If you're dealing with a *lot* of Pull Requests and don't want to add a bunch of remotes or do one time pulls every time, there is a neat trick that GitHub allows you to do.
This is a bit of an advanced trick and we'll go over the details of this a bit more in <<ch10-git-internals#_refspec>>, but it can be pretty useful.
@z

@x
GitHub actually advertises the Pull Request branches for a repository as sort of pseudo-branches on the server.
By default you don't get them when you clone, but they are there in an obscured way and you can access them pretty easily.
@y
GitHub actually advertises the Pull Request branches for a repository as sort of pseudo-branches on the server.
By default you don't get them when you clone, but they are there in an obscured way and you can access them pretty easily.
@z

@x
To demonstrate this, we're going to use a low-level command (often referred to as a "`plumbing`" command, which we'll read about more in <<ch10-git-internals#_plumbing_porcelain>>) called `ls-remote`.
This command is generally not used in day-to-day Git operations but it's useful to show us what references are present on the server.
@y
To demonstrate this, we're going to use a low-level command (often referred to as a "`plumbing`" command, which we'll read about more in <<ch10-git-internals#_plumbing_porcelain>>) called `ls-remote`.
This command is generally not used in day-to-day Git operations but it's useful to show us what references are present on the server.
@z

@x
If we run this command against the "`blink`" repository we were using earlier, we will get a list of all the branches and tags and other references in the repository.
@y
If we run this command against the "`blink`" repository we were using earlier, we will get a list of all the branches and tags and other references in the repository.
@z

@x
[source,console]
----
$ git ls-remote https://github.com/schacon/blink
10d539600d86723087810ec636870a504f4fee4d	HEAD
10d539600d86723087810ec636870a504f4fee4d	refs/heads/master
6a83107c62950be9453aac297bb0193fd743cd6e	refs/pull/1/head
afe83c2d1a70674c9505cc1d8b7d380d5e076ed3	refs/pull/1/merge
3c8d735ee16296c242be7a9742ebfbc2665adec1	refs/pull/2/head
15c9f4f80973a2758462ab2066b6ad9fe8dcf03d	refs/pull/2/merge
a5a7751a33b7e86c5e9bb07b26001bb17d775d1a	refs/pull/4/head
31a45fc257e8433c8d8804e3e848cf61c9d3166c	refs/pull/4/merge
----
@y
[source,console]
----
$ git ls-remote https://github.com/schacon/blink
10d539600d86723087810ec636870a504f4fee4d	HEAD
10d539600d86723087810ec636870a504f4fee4d	refs/heads/master
6a83107c62950be9453aac297bb0193fd743cd6e	refs/pull/1/head
afe83c2d1a70674c9505cc1d8b7d380d5e076ed3	refs/pull/1/merge
3c8d735ee16296c242be7a9742ebfbc2665adec1	refs/pull/2/head
15c9f4f80973a2758462ab2066b6ad9fe8dcf03d	refs/pull/2/merge
a5a7751a33b7e86c5e9bb07b26001bb17d775d1a	refs/pull/4/head
31a45fc257e8433c8d8804e3e848cf61c9d3166c	refs/pull/4/merge
----
@z

@x
Of course, if you're in your repository and you run `git ls-remote origin` or whatever remote you want to check, it will show you something similar to this.
@y
Of course, if you're in your repository and you run `git ls-remote origin` or whatever remote you want to check, it will show you something similar to this.
@z

@x
If the repository is on GitHub and you have any Pull Requests that have been opened, you'll get these references that are prefixed with `refs/pull/`.
These are basically branches, but since they're not under `refs/heads/` you don't get them normally when you clone or fetch from the server -- the process of fetching ignores them normally.
@y
If the repository is on GitHub and you have any Pull Requests that have been opened, you'll get these references that are prefixed with `refs/pull/`.
These are basically branches, but since they're not under `refs/heads/` you don't get them normally when you clone or fetch from the server -- the process of fetching ignores them normally.
@z

@x
There are two references per Pull Request - the one that ends in `/head` points to exactly the same commit as the last commit in the Pull Request branch.
So if someone opens a Pull Request in our repository and their branch is named `bug-fix` and it points to commit `a5a775`, then in *our* repository we will not have a `bug-fix` branch (since that's in their fork), but we _will_ have `pull/<pr#>/head` that points to `a5a775`.
This means that we can pretty easily pull down every Pull Request branch in one go without having to add a bunch of remotes.
@y
There are two references per Pull Request - the one that ends in `/head` points to exactly the same commit as the last commit in the Pull Request branch.
So if someone opens a Pull Request in our repository and their branch is named `bug-fix` and it points to commit `a5a775`, then in *our* repository we will not have a `bug-fix` branch (since that's in their fork), but we _will_ have `pull/<pr#>/head` that points to `a5a775`.
This means that we can pretty easily pull down every Pull Request branch in one go without having to add a bunch of remotes.
@z

@x
Now, you could do something like fetching the reference directly.
@y
Now, you could do something like fetching the reference directly.
@z

@x
[source,console]
----
$ git fetch origin refs/pull/958/head
From https://github.com/libgit2/libgit2
 * branch            refs/pull/958/head -> FETCH_HEAD
----
@y
[source,console]
----
$ git fetch origin refs/pull/958/head
From https://github.com/libgit2/libgit2
 * branch            refs/pull/958/head -> FETCH_HEAD
----
@z

@x
This tells Git, "`Connect to the `origin` remote, and download the ref named `refs/pull/958/head`.`"
Git happily obeys, and downloads everything you need to construct that ref, and puts a pointer to the commit you want under `.git/FETCH_HEAD`.
You can follow that up with `git merge FETCH_HEAD` into a branch you want to test it in, but that merge commit message looks a bit weird.
Also, if you're reviewing a *lot* of pull requests, this gets tedious.
@y
This tells Git, "`Connect to the `origin` remote, and download the ref named `refs/pull/958/head`.`"
Git happily obeys, and downloads everything you need to construct that ref, and puts a pointer to the commit you want under `.git/FETCH_HEAD`.
You can follow that up with `git merge FETCH_HEAD` into a branch you want to test it in, but that merge commit message looks a bit weird.
Also, if you're reviewing a *lot* of pull requests, this gets tedious.
@z

@x
There's also a way to fetch _all_ of the pull requests, and keep them up to date whenever you connect to the remote.
Open up `.git/config` in your favorite editor, and look for the `origin` remote.
It should look a bit like this:
@y
There's also a way to fetch _all_ of the pull requests, and keep them up to date whenever you connect to the remote.
Open up `.git/config` in your favorite editor, and look for the `origin` remote.
It should look a bit like this:
@z

@x
[source,ini]
----
[remote "origin"]
    url = https://github.com/libgit2/libgit2
    fetch = +refs/heads/*:refs/remotes/origin/*
----
@y
[source,ini]
----
[remote "origin"]
    url = https://github.com/libgit2/libgit2
    fetch = +refs/heads/*:refs/remotes/origin/*
----
@z

@x
That line that begins with `fetch =` is a "`refspec.`"
It's a way of mapping names on the remote with names in your local `.git` directory.
This particular one tells Git, "the things on the remote that are under `refs/heads` should go in my local repository under `refs/remotes/origin`."
You can modify this section to add another refspec:
@y
That line that begins with `fetch =` is a "`refspec.`"
It's a way of mapping names on the remote with names in your local `.git` directory.
This particular one tells Git, "the things on the remote that are under `refs/heads` should go in my local repository under `refs/remotes/origin`."
You can modify this section to add another refspec:
@z

@x
[source,ini]
----
[remote "origin"]
    url = https://github.com/libgit2/libgit2.git
    fetch = +refs/heads/*:refs/remotes/origin/*
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
----
@y
[source,ini]
----
[remote "origin"]
    url = https://github.com/libgit2/libgit2.git
    fetch = +refs/heads/*:refs/remotes/origin/*
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
----
@z

@x
That last line tells Git, "`All the refs that look like `refs/pull/123/head` should be stored locally like `refs/remotes/origin/pr/123`.`"
Now, if you save that file, and do a `git fetch`:
@y
That last line tells Git, "`All the refs that look like `refs/pull/123/head` should be stored locally like `refs/remotes/origin/pr/123`.`"
Now, if you save that file, and do a `git fetch`:
@z

@x
[source,console]
----
$ git fetch
# …
 * [new ref]         refs/pull/1/head -> origin/pr/1
 * [new ref]         refs/pull/2/head -> origin/pr/2
 * [new ref]         refs/pull/4/head -> origin/pr/4
# …
----
@y
[source,console]
----
$ git fetch
# …
 * [new ref]         refs/pull/1/head -> origin/pr/1
 * [new ref]         refs/pull/2/head -> origin/pr/2
 * [new ref]         refs/pull/4/head -> origin/pr/4
# …
----
@z

@x
Now all of the remote pull requests are represented locally with refs that act much like tracking branches; they're read-only, and they update when you do a fetch.
This makes it super easy to try the code from a pull request locally:
@y
Now all of the remote pull requests are represented locally with refs that act much like tracking branches; they're read-only, and they update when you do a fetch.
This makes it super easy to try the code from a pull request locally:
@z

@x
[source,console]
----
$ git checkout pr/2
Checking out files: 100% (3769/3769), done.
Branch pr/2 set up to track remote branch pr/2 from origin.
Switched to a new branch 'pr/2'
----
@y
[source,console]
----
$ git checkout pr/2
Checking out files: 100% (3769/3769), done.
Branch pr/2 set up to track remote branch pr/2 from origin.
Switched to a new branch 'pr/2'
----
@z

@x
The eagle-eyed among you would note the `head` on the end of the remote portion of the refspec.
There's also a `refs/pull/#/merge` ref on the GitHub side, which represents the commit that would result if you push the "`merge`" button on the site.
This can allow you to test the merge before even hitting the button.
@y
The eagle-eyed among you would note the `head` on the end of the remote portion of the refspec.
There's also a `refs/pull/#/merge` ref on the GitHub side, which represents the commit that would result if you push the "`merge`" button on the site.
This can allow you to test the merge before even hitting the button.
@z

@x
===== Pull Requests on Pull Requests
@y
===== Pull Requests on Pull Requests
@z

@x
Not only can you open Pull Requests that target the main or `master` branch, you can actually open a Pull Request targeting any branch in the network.
In fact, you can even target another Pull Request.
@y
Not only can you open Pull Requests that target the main or `master` branch, you can actually open a Pull Request targeting any branch in the network.
In fact, you can even target another Pull Request.
@z

@x
If you see a Pull Request that is moving in the right direction and you have an idea for a change that depends on it or you're not sure is a good idea, or you just don't have push access to the target branch, you can open a Pull Request directly to it.
@y
If you see a Pull Request that is moving in the right direction and you have an idea for a change that depends on it or you're not sure is a good idea, or you just don't have push access to the target branch, you can open a Pull Request directly to it.
@z

@x
When you go to open a Pull Request, there is a box at the top of the page that specifies which branch you're requesting to pull to and which you're requesting to pull from.
If you hit the "`Edit`" button at the right of that box you can change not only the branches but also which fork.
@y
When you go to open a Pull Request, there is a box at the top of the page that specifies which branch you're requesting to pull to and which you're requesting to pull from.
If you hit the "`Edit`" button at the right of that box you can change not only the branches but also which fork.
@z

@x
[[_pr_targets]]
.Manually change the Pull Request target fork and branch
image::images/maint-04-target.png[PR targets]
@y
[[_pr_targets]]
.Manually change the Pull Request target fork and branch
image::images/maint-04-target.png[PR targets]
@z

@x
Here you can fairly easily specify to merge your new branch into another Pull Request or another fork of the project.
@y
Here you can fairly easily specify to merge your new branch into another Pull Request or another fork of the project.
@z

@x
==== Mentions and Notifications
@y
==== Mentions and Notifications
@z

@x
GitHub also has a pretty nice notifications system built in that can come in handy when you have questions or need feedback from specific individuals or teams.
@y
GitHub also has a pretty nice notifications system built in that can come in handy when you have questions or need feedback from specific individuals or teams.
@z

@x
In any comment you can start typing a `@` character and it will begin to autocomplete with the names and usernames of people who are collaborators or contributors in the project.
@y
In any comment you can start typing a `@` character and it will begin to autocomplete with the names and usernames of people who are collaborators or contributors in the project.
@z

@x
.Start typing @ to mention someone
image::images/maint-05-mentions.png[Mentions]
@y
.Start typing @ to mention someone
image::images/maint-05-mentions.png[Mentions]
@z

@x
You can also mention a user who is not in that dropdown, but often the autocompleter can make it faster.
@y
You can also mention a user who is not in that dropdown, but often the autocompleter can make it faster.
@z

@x
Once you post a comment with a user mention, that user will be notified.
This means that this can be a really effective way of pulling people into conversations rather than making them poll.
Very often in  Pull Requests on GitHub people will pull in other people on their teams or in their company to review an Issue or Pull Request.
@y
Once you post a comment with a user mention, that user will be notified.
This means that this can be a really effective way of pulling people into conversations rather than making them poll.
Very often in  Pull Requests on GitHub people will pull in other people on their teams or in their company to review an Issue or Pull Request.
@z

@x
If someone gets mentioned on a Pull Request or Issue, they will be "`subscribed`" to it and will continue getting notifications any time some activity occurs on it.
You will also be subscribed to something if you opened it, if you're watching the repository or if you comment on something.
If you no longer wish to receive notifications, there is an "`Unsubscribe`" button on the page you can click to stop receiving updates on it.
@y
If someone gets mentioned on a Pull Request or Issue, they will be "`subscribed`" to it and will continue getting notifications any time some activity occurs on it.
You will also be subscribed to something if you opened it, if you're watching the repository or if you comment on something.
If you no longer wish to receive notifications, there is an "`Unsubscribe`" button on the page you can click to stop receiving updates on it.
@z

@x
.Unsubscribe from an Issue or Pull Request
image::images/maint-06-unsubscribe.png[Unsubscribe]
@y
.Unsubscribe from an Issue or Pull Request
image::images/maint-06-unsubscribe.png[Unsubscribe]
@z

@x
===== The Notifications Page
@y
===== The Notifications Page
@z

@x
When we mention "`notifications`" here with respect to GitHub, we mean a specific way that GitHub tries to get in touch with you when events happen and there are a few different ways you can configure them.
If you go to the "`Notification center`" tab from the settings page, you can see some of the options you have.
@y
When we mention "`notifications`" here with respect to GitHub, we mean a specific way that GitHub tries to get in touch with you when events happen and there are a few different ways you can configure them.
If you go to the "`Notification center`" tab from the settings page, you can see some of the options you have.
@z

@x
.Notification center options
image::images/maint-07-notifications.png[Notification center]
@y
.Notification center options
image::images/maint-07-notifications.png[Notification center]
@z

@x
The two choices are to get notifications over "`Email`" and over "`Web`" and you can choose either, neither or both for when you actively participate in things and for activity on repositories you are watching.
@y
The two choices are to get notifications over "`Email`" and over "`Web`" and you can choose either, neither or both for when you actively participate in things and for activity on repositories you are watching.
@z

@x
====== Web Notifications
@y
====== Web Notifications
@z

@x
Web notifications only exist on GitHub and you can only check them on GitHub.
If you have this option selected in your preferences and a notification is triggered for you, you will see a small blue dot over your notifications icon at the top of your screen as seen in <<_not_center>>.
@y
Web notifications only exist on GitHub and you can only check them on GitHub.
If you have this option selected in your preferences and a notification is triggered for you, you will see a small blue dot over your notifications icon at the top of your screen as seen in <<_not_center>>.
@z

@x
[[_not_center]]
.Notification center
image::images/maint-08-notifications-page.png[Notification center]
@y
[[_not_center]]
.Notification center
image::images/maint-08-notifications-page.png[Notification center]
@z

@x
If you click on that, you will see a list of all the items you have been notified about, grouped by project.
You can filter to the notifications of a specific project by clicking on its name in the left hand sidebar.
You can also acknowledge the notification by clicking the checkmark icon next to any notification, or acknowledge _all_ of the notifications in a project by clicking the checkmark at the top of the group.
There is also a mute button next to each checkmark that you can click to not receive any further notifications on that item.
@y
If you click on that, you will see a list of all the items you have been notified about, grouped by project.
You can filter to the notifications of a specific project by clicking on its name in the left hand sidebar.
You can also acknowledge the notification by clicking the checkmark icon next to any notification, or acknowledge _all_ of the notifications in a project by clicking the checkmark at the top of the group.
There is also a mute button next to each checkmark that you can click to not receive any further notifications on that item.
@z

@x
All of these tools are very useful for handling large numbers of notifications.
Many GitHub power users will simply turn off email notifications entirely and manage all of their notifications through this screen.
@y
All of these tools are very useful for handling large numbers of notifications.
Many GitHub power users will simply turn off email notifications entirely and manage all of their notifications through this screen.
@z

@x
====== Email Notifications
@y
====== Email Notifications
@z

@x
Email notifications are the other way you can handle notifications through GitHub.
If you have this turned on you will get emails for each notification.
We saw examples of this in <<_email_notification>> and <<_email_pr>>.
The emails will also be threaded properly, which is nice if you're using a threading email client.
@y
Email notifications are the other way you can handle notifications through GitHub.
If you have this turned on you will get emails for each notification.
We saw examples of this in <<_email_notification>> and <<_email_pr>>.
The emails will also be threaded properly, which is nice if you're using a threading email client.
@z

@x
There is also a fair amount of metadata embedded in the headers of the emails that GitHub sends you, which can be really helpful for setting up custom filters and rules.
@y
There is also a fair amount of metadata embedded in the headers of the emails that GitHub sends you, which can be really helpful for setting up custom filters and rules.
@z

@x
For instance, if we look at the actual email headers sent to Tony in the email shown in <<_email_pr>>, we will see the following among the information sent:
@y
For instance, if we look at the actual email headers sent to Tony in the email shown in <<_email_pr>>, we will see the following among the information sent:
@z

@x
[source,mbox]
----
To: tonychacon/fade <fade@noreply.github.com>
Message-ID: <tonychacon/fade/pull/1@github.com>
Subject: [fade] Wait longer to see the dimming effect better (#1)
X-GitHub-Recipient: tonychacon
List-ID: tonychacon/fade <fade.tonychacon.github.com>
List-Archive: https://github.com/tonychacon/fade
List-Post: <mailto:reply+i-4XXX@reply.github.com>
List-Unsubscribe: <mailto:unsub+i-XXX@reply.github.com>,...
X-GitHub-Recipient-Address: tchacon@example.com
----
@y
[source,mbox]
----
To: tonychacon/fade <fade@noreply.github.com>
Message-ID: <tonychacon/fade/pull/1@github.com>
Subject: [fade] Wait longer to see the dimming effect better (#1)
X-GitHub-Recipient: tonychacon
List-ID: tonychacon/fade <fade.tonychacon.github.com>
List-Archive: https://github.com/tonychacon/fade
List-Post: <mailto:reply+i-4XXX@reply.github.com>
List-Unsubscribe: <mailto:unsub+i-XXX@reply.github.com>,...
X-GitHub-Recipient-Address: tchacon@example.com
----
@z

@x
There are a couple of interesting things here.
If you want to highlight or re-route emails to this particular project or even Pull Request, the information in `Message-ID` gives you all the data in `<user>/<project>/<type>/<id>` format.
If this were an issue, for example, the `<type>` field would have been "`issues`" rather than "`pull`".
@y
There are a couple of interesting things here.
If you want to highlight or re-route emails to this particular project or even Pull Request, the information in `Message-ID` gives you all the data in `<user>/<project>/<type>/<id>` format.
If this were an issue, for example, the `<type>` field would have been "`issues`" rather than "`pull`".
@z

@x
The `List-Post` and `List-Unsubscribe` fields mean that if you have a mail client that understands those, you can easily post to the list or "`Unsubscribe`" from the thread.
That would be essentially the same as clicking the "`mute`" button on the web version of the notification or "`Unsubscribe`" on the Issue or Pull Request page itself.
@y
The `List-Post` and `List-Unsubscribe` fields mean that if you have a mail client that understands those, you can easily post to the list or "`Unsubscribe`" from the thread.
That would be essentially the same as clicking the "`mute`" button on the web version of the notification or "`Unsubscribe`" on the Issue or Pull Request page itself.
@z

@x
It's also worth noting that if you have both email and web notifications enabled and you read the email version of the notification, the web version will be marked as read as well if you have images allowed in your mail client.
@y
It's also worth noting that if you have both email and web notifications enabled and you read the email version of the notification, the web version will be marked as read as well if you have images allowed in your mail client.
@z

@x
==== Special Files
@y
==== Special Files
@z

@x
There are a couple of special files that GitHub will notice if they are present in your repository.
@y
There are a couple of special files that GitHub will notice if they are present in your repository.
@z

@x
==== README
@y
==== README
@z

@x
The first is the `README` file, which can be of nearly any format that GitHub recognizes as prose.
For example, it could be `README`, `README.md`, `README.asciidoc`, etc.
If GitHub sees a README file in your source, it will render it on the landing page of the project.
@y
The first is the `README` file, which can be of nearly any format that GitHub recognizes as prose.
For example, it could be `README`, `README.md`, `README.asciidoc`, etc.
If GitHub sees a README file in your source, it will render it on the landing page of the project.
@z

@x
Many teams use this file to hold all the relevant project information for someone who might be new to the repository or project.
This generally includes things like:
@y
Many teams use this file to hold all the relevant project information for someone who might be new to the repository or project.
This generally includes things like:
@z

@x
* What the project is for
* How to configure and install it
* An example of how to use it or get it running
* The license that the project is offered under
* How to contribute to it
@y
* What the project is for
* How to configure and install it
* An example of how to use it or get it running
* The license that the project is offered under
* How to contribute to it
@z

@x
Since GitHub will render this file, you can embed images or links in it for added ease of understanding.
@y
Since GitHub will render this file, you can embed images or links in it for added ease of understanding.
@z

@x
==== CONTRIBUTING
@y
==== CONTRIBUTING
@z

@x
The other special file that GitHub recognizes is the `CONTRIBUTING` file.
If you have a file named `CONTRIBUTING` with any file extension, GitHub will show <<_contrib_file>> when anyone starts opening a Pull Request.
@y
The other special file that GitHub recognizes is the `CONTRIBUTING` file.
If you have a file named `CONTRIBUTING` with any file extension, GitHub will show <<_contrib_file>> when anyone starts opening a Pull Request.
@z

@x
[[_contrib_file]]
.Opening a Pull Request when a CONTRIBUTING file exists
image::images/maint-09-contrib.png[Contributing notice]
@y
[[_contrib_file]]
.Opening a Pull Request when a CONTRIBUTING file exists
image::images/maint-09-contrib.png[Contributing notice]
@z

@x
The idea here is that you can specify specific things you want or don't want in a Pull Request sent to your project.
This way people may actually read the guidelines before opening the Pull Request.
@y
The idea here is that you can specify specific things you want or don't want in a Pull Request sent to your project.
This way people may actually read the guidelines before opening the Pull Request.
@z

@x
==== Project Administration
@y
==== Project Administration
@z

@x
Generally there are not a lot of administrative things you can do with a single project, but there are a couple of items that might be of interest.
@y
Generally there are not a lot of administrative things you can do with a single project, but there are a couple of items that might be of interest.
@z

@x
===== Changing the Default Branch
@y
===== Changing the Default Branch
@z

@x
If you are using a branch other than "`master`" as your default branch that you want people to open Pull Requests on or see by default, you can change that in your repository's settings page under the "`Options`" tab.
@y
If you are using a branch other than "`master`" as your default branch that you want people to open Pull Requests on or see by default, you can change that in your repository's settings page under the "`Options`" tab.
@z

@x
[[_default_branch]]
.Change the default branch for a project
image::images/maint-10-default-branch.png[Default branch]
@y
[[_default_branch]]
.Change the default branch for a project
image::images/maint-10-default-branch.png[Default branch]
@z

@x
Simply change the default branch in the dropdown and that will be the default for all major operations from then on, including which branch is checked out by default when someone clones the repository.
@y
Simply change the default branch in the dropdown and that will be the default for all major operations from then on, including which branch is checked out by default when someone clones the repository.
@z

@x
===== Transferring a Project
@y
===== Transferring a Project
@z

@x
If you would like to transfer a project to another user or an organization in GitHub, there is a "`Transfer ownership`" option at the bottom of the same "`Options`" tab of your repository settings page that allows you to do this.
@y
If you would like to transfer a project to another user or an organization in GitHub, there is a "`Transfer ownership`" option at the bottom of the same "`Options`" tab of your repository settings page that allows you to do this.
@z

@x
[[_transfer_project]]
.Transfer a project to another GitHub user or Organization
image::images/maint-11-transfer.png[Transfer]
@y
[[_transfer_project]]
.Transfer a project to another GitHub user or Organization
image::images/maint-11-transfer.png[Transfer]
@z

@x
This is helpful if you are abandoning a project and someone wants to take it over, or if your project is getting bigger and want to move it into an organization.
@y
This is helpful if you are abandoning a project and someone wants to take it over, or if your project is getting bigger and want to move it into an organization.
@z

@x
Not only does this move the repository along with all its watchers and stars to another place, it also sets up a redirect from your URL to the new place.
It will also redirect clones and fetches from Git, not just web requests.
@y
Not only does this move the repository along with all its watchers and stars to another place, it also sets up a redirect from your URL to the new place.
It will also redirect clones and fetches from Git, not just web requests.
@z
