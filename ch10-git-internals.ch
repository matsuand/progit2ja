%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ch10-git-internals]]
@y
[[ch10-git-internals]]
@z

@x
== Git Internals
@y
//////////////////////////
== Git Internals
//////////////////////////
== Git の内部
@z

@x
You may have skipped to this chapter from a much earlier chapter, or you may have gotten here after sequentially reading the entire book up to this point -- in either case, this is where we'll go over the inner workings and implementation of Git.
We found that understanding this information was fundamentally important to appreciating how useful and powerful Git is, but others have argued to us that it can be confusing and unnecessarily complex for beginners.
Thus, we've made this discussion the last chapter in the book so you could read it early or later in your learning process.
We leave it up to you to decide.
@y
//////////////////////////
You may have skipped to this chapter from a much earlier chapter, or you may have gotten here after sequentially reading the entire book up to this point -- in either case, this is where we'll go over the inner workings and implementation of Git.
We found that understanding this information was fundamentally important to appreciating how useful and powerful Git is, but others have argued to us that it can be confusing and unnecessarily complex for beginners.
Thus, we've made this discussion the last chapter in the book so you could read it early or later in your learning process.
We leave it up to you to decide.
//////////////////////////
You may have skipped to this chapter from a much earlier chapter, or you may have gotten here after sequentially reading the entire book up to this point -- in either case, this is where we'll go over the inner workings and implementation of Git.
We found that understanding this information was fundamentally important to appreciating how useful and powerful Git is, but others have argued to us that it can be confusing and unnecessarily complex for beginners.
Thus, we've made this discussion the last chapter in the book so you could read it early or later in your learning process.
We leave it up to you to decide.
@z

@x
Now that you're here, let's get started.
First, if it isn't yet clear, Git is fundamentally a content-addressable filesystem with a VCS user interface written on top of it.
You'll learn more about what this means in a bit.
@y
//////////////////////////
Now that you're here, let's get started.
First, if it isn't yet clear, Git is fundamentally a content-addressable filesystem with a VCS user interface written on top of it.
You'll learn more about what this means in a bit.
//////////////////////////
Now that you're here, let's get started.
First, if it isn't yet clear, Git is fundamentally a content-addressable filesystem with a VCS user interface written on top of it.
You'll learn more about what this means in a bit.
@z

@x
In the early days of Git (mostly pre 1.5), the user interface was much more complex because it emphasized this filesystem rather than a polished VCS.
In the last few years, the UI has been refined until it's as clean and easy to use as any system out there; however, the stereotype lingers about the early Git UI that was complex and difficult to learn.
@y
//////////////////////////
In the early days of Git (mostly pre 1.5), the user interface was much more complex because it emphasized this filesystem rather than a polished VCS.
In the last few years, the UI has been refined until it's as clean and easy to use as any system out there; however, the stereotype lingers about the early Git UI that was complex and difficult to learn.
//////////////////////////
In the early days of Git (mostly pre 1.5), the user interface was much more complex because it emphasized this filesystem rather than a polished VCS.
In the last few years, the UI has been refined until it's as clean and easy to use as any system out there; however, the stereotype lingers about the early Git UI that was complex and difficult to learn.
@z

@x
The content-addressable filesystem layer is amazingly cool, so we'll cover that first in this chapter; then, you'll learn about the transport mechanisms and the repository maintenance tasks that you may eventually have to deal with.
@y
//////////////////////////
The content-addressable filesystem layer is amazingly cool, so we'll cover that first in this chapter; then, you'll learn about the transport mechanisms and the repository maintenance tasks that you may eventually have to deal with.
//////////////////////////
The content-addressable filesystem layer is amazingly cool, so we'll cover that first in this chapter; then, you'll learn about the transport mechanisms and the repository maintenance tasks that you may eventually have to deal with.
@z

@x
include::book/10-git-internals/sections/plumbing-porcelain.asc[]
@y
include::book/10-git-internals/sections/plumbing-porcelain.asc[]
@z

@x
include::book/10-git-internals/sections/objects.asc[]
@y
include::book/10-git-internals/sections/objects.asc[]
@z

@x
include::book/10-git-internals/sections/refs.asc[]
@y
include::book/10-git-internals/sections/refs.asc[]
@z

@x
include::book/10-git-internals/sections/packfiles.asc[]
@y
include::book/10-git-internals/sections/packfiles.asc[]
@z

@x
include::book/10-git-internals/sections/refspec.asc[]
@y
include::book/10-git-internals/sections/refspec.asc[]
@z

@x
include::book/10-git-internals/sections/transfer-protocols.asc[]
@y
include::book/10-git-internals/sections/transfer-protocols.asc[]
@z

@x
include::book/10-git-internals/sections/maintenance.asc[]
@y
include::book/10-git-internals/sections/maintenance.asc[]
@z

@x
include::book/10-git-internals/sections/environment.asc[]
@y
include::book/10-git-internals/sections/environment.asc[]
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
At this point, you should have a pretty good understanding of what Git does in the background and, to some degree, how it's implemented.
This chapter has covered a number of plumbing commands -- commands that are lower level and simpler than the porcelain commands you've learned about in the rest of the book.
Understanding how Git works at a lower level should make it easier to understand why it's doing what it's doing and also to write your own tools and helper scripts to make your specific workflow work for you.
@y
//////////////////////////
At this point, you should have a pretty good understanding of what Git does in the background and, to some degree, how it's implemented.
This chapter has covered a number of plumbing commands -- commands that are lower level and simpler than the porcelain commands you've learned about in the rest of the book.
Understanding how Git works at a lower level should make it easier to understand why it's doing what it's doing and also to write your own tools and helper scripts to make your specific workflow work for you.
//////////////////////////
At this point, you should have a pretty good understanding of what Git does in the background and, to some degree, how it's implemented.
This chapter has covered a number of plumbing commands -- commands that are lower level and simpler than the porcelain commands you've learned about in the rest of the book.
Understanding how Git works at a lower level should make it easier to understand why it's doing what it's doing and also to write your own tools and helper scripts to make your specific workflow work for you.
@z

@x
Git as a content-addressable filesystem is a very powerful tool that you can easily use as more than just a VCS.
We hope you can use your newfound knowledge of Git internals to implement your own cool application of this technology and feel more comfortable using Git in more advanced ways.
@y
//////////////////////////
Git as a content-addressable filesystem is a very powerful tool that you can easily use as more than just a VCS.
We hope you can use your newfound knowledge of Git internals to implement your own cool application of this technology and feel more comfortable using Git in more advanced ways.
//////////////////////////
Git as a content-addressable filesystem is a very powerful tool that you can easily use as more than just a VCS.
We hope you can use your newfound knowledge of Git internals to implement your own cool application of this technology and feel more comfortable using Git in more advanced ways.
@z
