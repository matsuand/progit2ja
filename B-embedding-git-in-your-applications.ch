%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[B-embedding-git-in-your-applications]]
[appendix]
== Embedding Git in your Applications
@y
[[B-embedding-git-in-your-applications]]
[appendix]
== Embedding Git in your Applications
@z

@x
If your application is for developers, chances are good that it could benefit from integration with source control.
Even non-developer applications, such as document editors, could potentially benefit from version-control features, and Git's model works very well for many different scenarios.
@y
If your application is for developers, chances are good that it could benefit from integration with source control.
Even non-developer applications, such as document editors, could potentially benefit from version-control features, and Git's model works very well for many different scenarios.
@z

@x
If you need to integrate Git with your application, you have essentially two options: spawn a shell and call the `git` command-line program, or embed a Git library into your application.
Here we'll cover command-line integration and several of the most popular embeddable Git libraries.
@y
If you need to integrate Git with your application, you have essentially two options: spawn a shell and call the `git` command-line program, or embed a Git library into your application.
Here we'll cover command-line integration and several of the most popular embeddable Git libraries.
@z

@x
include::book/B-embedding-git/sections/command-line.asc[]
@y
include::book/B-embedding-git/sections/command-line.asc[]
@z

@x
include::book/B-embedding-git/sections/libgit2.asc[]
@y
include::book/B-embedding-git/sections/libgit2.asc[]
@z

@x
include::book/B-embedding-git/sections/jgit.asc[]
@y
include::book/B-embedding-git/sections/jgit.asc[]
@z

@x
include::book/B-embedding-git/sections/go-git.asc[]
@y
include::book/B-embedding-git/sections/go-git.asc[]
@z

@x
include::book/B-embedding-git/sections/dulwich.asc[]
@y
include::book/B-embedding-git/sections/dulwich.asc[]
@z
