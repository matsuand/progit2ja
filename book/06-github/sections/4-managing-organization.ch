%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ch06-github_orgs]]
=== Managing an organization
@y
[[ch06-github_orgs]]
=== Managing an organization
@z

@x
(((GitHub, organizations)))
In addition to single-user accounts, GitHub has what are called Organizations.
Like personal accounts, Organizational accounts have a namespace where all their projects exist, but many other things are different.
These accounts represent a group of people with shared ownership of projects, and there are many tools to manage subgroups of those people.
Normally these accounts are used for Open Source groups (such as "`perl`" or "`rails`") or companies (such as "`google`" or "`twitter`").
@y
(((GitHub, organizations)))
In addition to single-user accounts, GitHub has what are called Organizations.
Like personal accounts, Organizational accounts have a namespace where all their projects exist, but many other things are different.
These accounts represent a group of people with shared ownership of projects, and there are many tools to manage subgroups of those people.
Normally these accounts are used for Open Source groups (such as "`perl`" or "`rails`") or companies (such as "`google`" or "`twitter`").
@z

@x
==== Organization Basics
@y
==== Organization Basics
@z

@x
An organization is pretty easy to create; just click on the "`+`" icon at the top-right of any GitHub page, and select "`New organization`" from the menu.
@y
An organization is pretty easy to create; just click on the "`+`" icon at the top-right of any GitHub page, and select "`New organization`" from the menu.
@z

@x
.The "`New organization`" menu item
image::images/neworg.png[The "`New organization`" menu item]
@y
.The "`New organization`" menu item
image::images/neworg.png[The "`New organization`" menu item]
@z

@x
First you'll need to name your organization and provide an email address for a main point of contact for the group.
Then you can invite other users to be co-owners of the account if you want to.
@y
First you'll need to name your organization and provide an email address for a main point of contact for the group.
Then you can invite other users to be co-owners of the account if you want to.
@z

@x
Follow these steps and you'll soon be the owner of a brand-new organization.
Like personal accounts, organizations are free if everything you plan to store there will be open source.
@y
Follow these steps and you'll soon be the owner of a brand-new organization.
Like personal accounts, organizations are free if everything you plan to store there will be open source.
@z

@x
As an owner in an organization, when you fork a repository, you'll have the choice of forking it to your organization's namespace.
When you create new repositories you can create them either under your personal account or under any of the organizations that you are an owner in.
You also automatically "`watch`" any new repository created under these organizations.
@y
As an owner in an organization, when you fork a repository, you'll have the choice of forking it to your organization's namespace.
When you create new repositories you can create them either under your personal account or under any of the organizations that you are an owner in.
You also automatically "`watch`" any new repository created under these organizations.
@z

@x
Just like in <<_personal_avatar>>, you can upload an avatar for your organization to personalize it a bit.
Also just like personal accounts, you have a landing page for the organization that lists all of your repositories and can be viewed by other people.
@y
Just like in <<_personal_avatar>>, you can upload an avatar for your organization to personalize it a bit.
Also just like personal accounts, you have a landing page for the organization that lists all of your repositories and can be viewed by other people.
@z

@x
Now let's cover some of the things that are a bit different with an organizational account.
@y
Now let's cover some of the things that are a bit different with an organizational account.
@z

@x
==== Teams
@y
==== Teams
@z

@x
Organizations are associated with individual people by way of teams, which are simply a grouping of individual user accounts and repositories within the organization and what kind of access those people have in those repositories.
@y
Organizations are associated with individual people by way of teams, which are simply a grouping of individual user accounts and repositories within the organization and what kind of access those people have in those repositories.
@z

@x
For example, say your company has three repositories: `frontend`, `backend`, and `deployscripts`.
You'd want your HTML/CSS/JavaScript developers to have access to `frontend` and maybe `backend`, and your Operations people to have access to `backend` and `deployscripts`.
Teams make this easy, without having to manage the collaborators for every individual repository.
@y
For example, say your company has three repositories: `frontend`, `backend`, and `deployscripts`.
You'd want your HTML/CSS/JavaScript developers to have access to `frontend` and maybe `backend`, and your Operations people to have access to `backend` and `deployscripts`.
Teams make this easy, without having to manage the collaborators for every individual repository.
@z

@x
The Organization page shows you a simple dashboard of all the repositories, users and teams that are under this organization.
@y
The Organization page shows you a simple dashboard of all the repositories, users and teams that are under this organization.
@z

@x
[[_org_page]]
.The Organization page
image::images/orgs-01-page.png[The Organization page]
@y
[[_org_page]]
.The Organization page
image::images/orgs-01-page.png[The Organization page]
@z

@x
To manage your Teams, you can click on the Teams sidebar on the right hand side of the page in <<_org_page>>.
This will bring you to a page you can use to add members to the team, add repositories to the team or manage the settings and access control levels for the team.
Each team can have read only, read/write or administrative access to the repositories.
You can change that level by clicking the "`Settings`" button in <<_team_page>>.
@y
To manage your Teams, you can click on the Teams sidebar on the right hand side of the page in <<_org_page>>.
This will bring you to a page you can use to add members to the team, add repositories to the team or manage the settings and access control levels for the team.
Each team can have read only, read/write or administrative access to the repositories.
You can change that level by clicking the "`Settings`" button in <<_team_page>>.
@z

@x
[[_team_page]]
.The Team page
image::images/orgs-02-teams.png[The Team page]
@y
[[_team_page]]
.The Team page
image::images/orgs-02-teams.png[The Team page]
@z

@x
When you invite someone to a team, they will get an email letting them know they've been invited.
@y
When you invite someone to a team, they will get an email letting them know they've been invited.
@z

@x
Additionally, team `@mentions` (such as `@acmecorp/frontend`) work much the same as they do with individual users, except that *all* members of the team are then subscribed to the thread.
This is useful if you want the attention from someone on a team, but you don't know exactly who to ask.
@y
Additionally, team `@mentions` (such as `@acmecorp/frontend`) work much the same as they do with individual users, except that *all* members of the team are then subscribed to the thread.
This is useful if you want the attention from someone on a team, but you don't know exactly who to ask.
@z

@x
A user can belong to any number of teams, so don't limit yourself to only access-control teams.
Special-interest teams like `ux`, `css`, or `refactoring` are useful for certain kinds of questions, and others like `legal` and `colorblind` for an entirely different kind.
@y
A user can belong to any number of teams, so don't limit yourself to only access-control teams.
Special-interest teams like `ux`, `css`, or `refactoring` are useful for certain kinds of questions, and others like `legal` and `colorblind` for an entirely different kind.
@z

@x
==== Audit Log
@y
==== Audit Log
@z

@x
Organizations also give owners access to all the information about what went on under the organization.
You can go to the 'Audit Log' tab and see what events have happened at an organization level, who did them and where in the world they were done.
@y
Organizations also give owners access to all the information about what went on under the organization.
You can go to the 'Audit Log' tab and see what events have happened at an organization level, who did them and where in the world they were done.
@z

@x
[[_the_audit_log]]
.The Audit log
image::images/orgs-03-audit.png[The Audit log]
@y
[[_the_audit_log]]
.The Audit log
image::images/orgs-03-audit.png[The Audit log]
@z

@x
You can also filter down to specific types of events, specific places or specific people.
@y
You can also filter down to specific types of events, specific places or specific people.
@z
