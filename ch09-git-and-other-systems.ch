%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ch09-git-and-other-systems]]
== Git and Other Systems
@y
[[ch09-git-and-other-systems]]
== Git and Other Systems
@z

@x
The world isn't perfect.
Usually, you can't immediately switch every project you come in contact with to Git.
Sometimes you're stuck on a project using another VCS, and wish it was Git.
We'll spend the first part of this chapter learning about ways to use Git as a client when the project you're working on is hosted in a different system.
@y
The world isn't perfect.
Usually, you can't immediately switch every project you come in contact with to Git.
Sometimes you're stuck on a project using another VCS, and wish it was Git.
We'll spend the first part of this chapter learning about ways to use Git as a client when the project you're working on is hosted in a different system.
@z

@x
At some point, you may want to convert your existing project to Git.
The second part of this chapter covers how to migrate your project into Git from several specific systems, as well as a method that will work if no pre-built import tool exists.
@y
At some point, you may want to convert your existing project to Git.
The second part of this chapter covers how to migrate your project into Git from several specific systems, as well as a method that will work if no pre-built import tool exists.
@z

@x
=== Git as a Client
@y
=== Git as a Client
@z

@x
(((Git as a client)))
Git provides such a nice experience for developers that many people have figured out how to use it on their workstation, even if the rest of their team is using an entirely different VCS.
There are a number of these adapters, called ``bridges,'' available.
Here we'll cover the ones you're most likely to run into in the wild.
@y
(((Git as a client)))
Git provides such a nice experience for developers that many people have figured out how to use it on their workstation, even if the rest of their team is using an entirely different VCS.
There are a number of these adapters, called ``bridges,'' available.
Here we'll cover the ones you're most likely to run into in the wild.
@z

@x
include::book/09-git-and-other-scms/sections/client-svn.asc[]
@y
include::book/09-git-and-other-scms/sections/client-svn.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/client-hg.asc[]
@y
include::book/09-git-and-other-scms/sections/client-hg.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/client-bzr.asc[]
@y
include::book/09-git-and-other-scms/sections/client-bzr.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/client-p4.asc[]
@y
include::book/09-git-and-other-scms/sections/client-p4.asc[]
@z

@x
[[_migrating]]
=== Migrating to Git
@y
[[_migrating]]
=== Migrating to Git
@z

@x
(((Migrating to Git)))
If you have an existing codebase in another VCS but you've decided to start using Git, you must migrate your project one way or another.
This section goes over some importers for common systems, and then demonstrates how to develop your own custom importer.
You'll learn how to import data from several of the bigger professionally used SCM systems, because they make up the majority of users who are switching, and because high-quality tools for them are easy to come by.
@y
(((Migrating to Git)))
If you have an existing codebase in another VCS but you've decided to start using Git, you must migrate your project one way or another.
This section goes over some importers for common systems, and then demonstrates how to develop your own custom importer.
You'll learn how to import data from several of the bigger professionally used SCM systems, because they make up the majority of users who are switching, and because high-quality tools for them are easy to come by.
@z

@x
include::book/09-git-and-other-scms/sections/import-svn.asc[]
@y
include::book/09-git-and-other-scms/sections/import-svn.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/import-hg.asc[]
@y
include::book/09-git-and-other-scms/sections/import-hg.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/import-bzr.asc[]
@y
include::book/09-git-and-other-scms/sections/import-bzr.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/import-p4.asc[]
@y
include::book/09-git-and-other-scms/sections/import-p4.asc[]
@z

@x
include::book/09-git-and-other-scms/sections/import-custom.asc[]
@y
include::book/09-git-and-other-scms/sections/import-custom.asc[]
@z

@x
=== Summary
@y
//////////////////////////
=== Summary
//////////////////////////
=== まとめ
@z

@x
You should feel comfortable using Git as a client for other version-control systems, or importing nearly any existing repository into Git without losing data.
In the next chapter, we'll cover the raw internals of Git so you can craft every single byte, if need be.
@y
You should feel comfortable using Git as a client for other version-control systems, or importing nearly any existing repository into Git without losing data.
In the next chapter, we'll cover the raw internals of Git so you can craft every single byte, if need be.
@z
