%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== GitLab
@y
=== GitLab
@z

@x
(((serving repositories, GitLab)))(((GitLab)))
GitWeb is pretty simplistic though.
If you're looking for a modern, fully featured Git server, there are several open source solutions out there that you can install instead.
As GitLab is one of the popular ones, we'll cover installing and using it as an example.
This is harder than the GitWeb option and will require more maintenance, but it is a fully featured option.
@y
(((serving repositories, GitLab)))(((GitLab)))
GitWeb is pretty simplistic though.
If you're looking for a modern, fully featured Git server, there are several open source solutions out there that you can install instead.
As GitLab is one of the popular ones, we'll cover installing and using it as an example.
This is harder than the GitWeb option and will require more maintenance, but it is a fully featured option.
@z

@x
==== Installation
@y
==== Installation
@z

@x
GitLab is a database-backed web application, so its installation is more involved than some other Git servers.
Fortunately, this process is well-documented and supported.
GitLab strongly recommends installing GitLab on your server via the official Omnibus GitLab package.
@y
GitLab is a database-backed web application, so its installation is more involved than some other Git servers.
Fortunately, this process is well-documented and supported.
GitLab strongly recommends installing GitLab on your server via the official Omnibus GitLab package.
@z

@x
The other installation options are:
@y
The other installation options are:
@z

@x
* GitLab Helm chart, for use with Kubernetes.
* Dockerized GitLab packages for use with Docker.
* From the source files.
* Cloud provider such as AWS, Google Cloud Platform, Azure, OpenShift and Digital Ocean.
@y
* GitLab Helm chart, for use with Kubernetes.
* Dockerized GitLab packages for use with Docker.
* From the source files.
* Cloud provider such as AWS, Google Cloud Platform, Azure, OpenShift and Digital Ocean.
@z

@x
For more information read the https://gitlab.com/gitlab-org/gitlab-foss/-/blob/master/README.md[GitLab Community Edition (CE) readme].
@y
For more information read the https://gitlab.com/gitlab-org/gitlab-foss/-/blob/master/README.md[GitLab Community Edition (CE) readme].
@z

@x
==== Administration
@y
==== Administration
@z

@x
GitLab's administration interface is accessed over the web.
Simply point your browser to the hostname or IP address where GitLab is installed, and log in as the admin user.
The default username is `admin@local.host`, and the default password is `5iveL!fe` (which you must change right away).
After you've logged in, click the ``Admin area'' icon in the menu at the top right.
@y
GitLab's administration interface is accessed over the web.
Simply point your browser to the hostname or IP address where GitLab is installed, and log in as the admin user.
The default username is `admin@local.host`, and the default password is `5iveL!fe` (which you must change right away).
After you've logged in, click the ``Admin area'' icon in the menu at the top right.
@z

@x
[[gitlab_menu]]
.The ``Admin area'' item in the GitLab menu
image::images/gitlab-menu.png[The ``Admin area'' item in the GitLab menu]
@y
[[gitlab_menu]]
.The ``Admin area'' item in the GitLab menu
image::images/gitlab-menu.png[The ``Admin area'' item in the GitLab menu]
@z

@x
===== Users
@y
===== Users
@z

@x
Everybody using your GitLab server must have an user account.
User accounts are quite simple, they mainly contain personal information attached to login data.
Each user account has a *namespace*, which is a logical grouping of projects that belong to that user.
If the user +jane+ had a project named +project+, that project's url would be `http://server/jane/project`.
@y
Everybody using your GitLab server must have an user account.
User accounts are quite simple, they mainly contain personal information attached to login data.
Each user account has a *namespace*, which is a logical grouping of projects that belong to that user.
If the user +jane+ had a project named +project+, that project's url would be `http://server/jane/project`.
@z

@x
[[gitlab_users]]
.The GitLab user administration screen
image::images/gitlab-users.png[The GitLab user administration screen]
@y
[[gitlab_users]]
.The GitLab user administration screen
image::images/gitlab-users.png[The GitLab user administration screen]
@z

@x
You can remove a user account in two ways:
``Blocking'' a user prevents them from logging into the GitLab instance, but all of the data under that user's namespace will be preserved, and commits signed with that user's email address will still link back to their profile.
@y
You can remove a user account in two ways:
``Blocking'' a user prevents them from logging into the GitLab instance, but all of the data under that user's namespace will be preserved, and commits signed with that user's email address will still link back to their profile.
@z

@x
``Destroying'' a user, on the other hand, completely removes them from the database and filesystem.
All projects and data in their namespace is removed, and any groups they own will also be removed.
This is obviously a much more permanent and destructive action, and you will rarely need it.
@y
``Destroying'' a user, on the other hand, completely removes them from the database and filesystem.
All projects and data in their namespace is removed, and any groups they own will also be removed.
This is obviously a much more permanent and destructive action, and you will rarely need it.
@z

@x
[[_gitlab_groups_section]]
===== Groups
@y
[[_gitlab_groups_section]]
===== Groups
@z

@x
A GitLab group is a collection of projects, along with data about how users can access those projects.
Each group has a project namespace (the same way that users do), so if the group +training+ has a project +materials+, its url would be `http://server/training/materials`.
@y
A GitLab group is a collection of projects, along with data about how users can access those projects.
Each group has a project namespace (the same way that users do), so if the group +training+ has a project +materials+, its url would be `http://server/training/materials`.
@z

@x
[[gitlab_groups]]
.The GitLab group administration screen
image::images/gitlab-groups.png[The GitLab group administration screen]
@y
[[gitlab_groups]]
.The GitLab group administration screen
image::images/gitlab-groups.png[The GitLab group administration screen]
@z

@x
Each group is associated with a number of users, each of which has a level of permissions for the group's projects and the group itself.
These range from ``Guest'' (issues and chat only) to ``Owner'' (full control of the group, its members, and its projects).
The types of permissions are too numerous to list here, but GitLab has a helpful link on the administration screen.
@y
Each group is associated with a number of users, each of which has a level of permissions for the group's projects and the group itself.
These range from ``Guest'' (issues and chat only) to ``Owner'' (full control of the group, its members, and its projects).
The types of permissions are too numerous to list here, but GitLab has a helpful link on the administration screen.
@z

@x
===== Projects
@y
===== Projects
@z

@x
A GitLab project roughly corresponds to a single Git repository.
Every project belongs to a single namespace, either a user or a group.
If the project belongs to a user, the owner of the project has direct control over who has access to the project; if the project belongs to a group, the group's user-level permissions will take effect.
@y
A GitLab project roughly corresponds to a single Git repository.
Every project belongs to a single namespace, either a user or a group.
If the project belongs to a user, the owner of the project has direct control over who has access to the project; if the project belongs to a group, the group's user-level permissions will take effect.
@z

@x
Every project has a visibility level, which controls who has read access to that project's pages and repository.
If a project is _Private_, the project's owner must explicitly grant access to specific users.
An _Internal_ project is visible to any logged-in user, and a _Public_ project is visible to anyone.
Note that this controls both `git fetch` access as well as access to the web UI for that project.
@y
Every project has a visibility level, which controls who has read access to that project's pages and repository.
If a project is _Private_, the project's owner must explicitly grant access to specific users.
An _Internal_ project is visible to any logged-in user, and a _Public_ project is visible to anyone.
Note that this controls both `git fetch` access as well as access to the web UI for that project.
@z

@x
===== Hooks
@y
===== Hooks
@z

@x
GitLab includes support for hooks, both at a project or system level.
For either of these, the GitLab server will perform an HTTP POST with some descriptive JSON whenever relevant events occur.
This is a great way to connect your Git repositories and GitLab instance to the rest of your development automation, such as CI servers, chat rooms, or deployment tools.
@y
GitLab includes support for hooks, both at a project or system level.
For either of these, the GitLab server will perform an HTTP POST with some descriptive JSON whenever relevant events occur.
This is a great way to connect your Git repositories and GitLab instance to the rest of your development automation, such as CI servers, chat rooms, or deployment tools.
@z

@x
==== Basic Usage
@y
==== Basic Usage
@z

@x
The first thing you'll want to do with GitLab is create a new project.
You can do this by clicking on the ``+'' icon on the toolbar.
You'll be asked for the project's name, which namespace it should belong to, and what its visibility level should be.
Most of what you specify here isn't permanent, and can be changed later through the settings interface.
Click ``Create Project'', and you're done.
@y
The first thing you'll want to do with GitLab is create a new project.
You can do this by clicking on the ``+'' icon on the toolbar.
You'll be asked for the project's name, which namespace it should belong to, and what its visibility level should be.
Most of what you specify here isn't permanent, and can be changed later through the settings interface.
Click ``Create Project'', and you're done.
@z

@x
Once the project exists, you'll probably want to connect it with a local Git repository.
Each project is accessible over HTTPS or SSH, either of which can be used to configure a Git remote.
The URLs are visible at the top of the project's home page.
For an existing local repository, this command will create a remote named `gitlab` to the hosted location:
@y
Once the project exists, you'll probably want to connect it with a local Git repository.
Each project is accessible over HTTPS or SSH, either of which can be used to configure a Git remote.
The URLs are visible at the top of the project's home page.
For an existing local repository, this command will create a remote named `gitlab` to the hosted location:
@z

@x
[source,console]
----
$ git remote add gitlab https://server/namespace/project.git
----
@y
[source,console]
----
$ git remote add gitlab https://server/namespace/project.git
----
@z

@x
If you don't have a local copy of the repository, you can simply do this:
@y
If you don't have a local copy of the repository, you can simply do this:
@z

@x
[source,console]
----
$ git clone https://server/namespace/project.git
----
@y
[source,console]
----
$ git clone https://server/namespace/project.git
----
@z

@x
The web UI provides access to several useful views of the repository itself.
Each project's home page shows recent activity, and links along the top will lead you to views of the project's files and commit log.
@y
The web UI provides access to several useful views of the repository itself.
Each project's home page shows recent activity, and links along the top will lead you to views of the project's files and commit log.
@z

@x
==== Working Together
@y
==== Working Together
@z

@x
The simplest way of working together on a GitLab project is by giving each user direct push access to the Git repository.
You can add a user to a project by going to the ``Members'' section of that project's settings, and associating the new user with an access level (the different access levels are discussed a bit in <<_gitlab_groups_section>>).
By giving a user an access level of ``Developer'' or above, that user can push commits and branches directly to the repository.
@y
The simplest way of working together on a GitLab project is by giving each user direct push access to the Git repository.
You can add a user to a project by going to the ``Members'' section of that project's settings, and associating the new user with an access level (the different access levels are discussed a bit in <<_gitlab_groups_section>>).
By giving a user an access level of ``Developer'' or above, that user can push commits and branches directly to the repository.
@z

@x
Another, more decoupled way of collaboration is by using merge requests.
This feature enables any user that can see a project to contribute to it in a controlled way.
Users with direct access can simply create a branch, push commits to it, and open a merge request from their branch back into `master` or any other branch.
Users who don't have push permissions for a repository can ``fork'' it to create their own copy, push commits to _their_ copy, and open a merge request from their fork back to the main project.
This model allows the owner to be in full control of what goes into the repository and when, while allowing contributions from untrusted users.
@y
Another, more decoupled way of collaboration is by using merge requests.
This feature enables any user that can see a project to contribute to it in a controlled way.
Users with direct access can simply create a branch, push commits to it, and open a merge request from their branch back into `master` or any other branch.
Users who don't have push permissions for a repository can ``fork'' it to create their own copy, push commits to _their_ copy, and open a merge request from their fork back to the main project.
This model allows the owner to be in full control of what goes into the repository and when, while allowing contributions from untrusted users.
@z

@x
Merge requests and issues are the main units of long-lived discussion in GitLab.
Each merge request allows a line-by-line discussion of the proposed change (which supports a lightweight kind of code review), as well as a general overall discussion thread.
Both can be assigned to users, or organized into milestones.
@y
Merge requests and issues are the main units of long-lived discussion in GitLab.
Each merge request allows a line-by-line discussion of the proposed change (which supports a lightweight kind of code review), as well as a general overall discussion thread.
Both can be assigned to users, or organized into milestones.
@z

@x
This section is focused mainly on the Git-related features of GitLab, but as a mature project, it provides many other features to help your team work together, such as project wikis and system maintenance tools.
One benefit to GitLab is that, once the server is set up and running, you'll rarely need to tweak a configuration file or access the server via SSH; most administration and general usage can be done through the in-browser interface.
@y
This section is focused mainly on the Git-related features of GitLab, but as a mature project, it provides many other features to help your team work together, such as project wikis and system maintenance tools.
One benefit to GitLab is that, once the server is set up and running, you'll rarely need to tweak a configuration file or access the server via SSH; most administration and general usage can be done through the in-browser interface.
@z
