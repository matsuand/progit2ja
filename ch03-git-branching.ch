%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[ch03-git-branching]]
@y
[[ch03-git-branching]]
@z

@x
== Git Branching
@y
//////////////////////////
== Git Branching
//////////////////////////
== Gitのブランチ機能
@z

@x
(((branches)))
@y
(((branches)))
@z

@x
Nearly every VCS has some form of branching support.
Branching means you diverge from the main line of development and continue to do work without messing with that main line.
In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large projects.
@y
//////////////////////////
Nearly every VCS has some form of branching support.
Branching means you diverge from the main line of development and continue to do work without messing with that main line.
In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large projects.
//////////////////////////
ほぼすべての VCS には、ブランチ機能に相当するものがあります。
ブランチ機能というものがあると、メインの開発作業から分岐して、メイン作業をわずらわすことなく作業を進めていくことができます。
VCS ツールにおいて、この作業はわりと面倒である場合が多く、たいていはソースコードディレクトリのコピーを新たに作り出す必要があります。
大きなプロジェクトでは、こういった作業に時間を取られます。
@z

@x
Some people refer to Git's branching model as its "`killer feature,`" and it certainly sets Git apart in the VCS community.
Why is it so special?
The way Git branches is incredibly lightweight, making branching operations nearly instantaneous, and switching back and forth between branches generally just as fast.
Unlike many other VCSs, Git encourages workflows that branch and merge often, even multiple times in a day.
Understanding and mastering this feature gives you a powerful and unique tool and can entirely change the way that you develop.
@y
//////////////////////////
Some people refer to Git's branching model as its "`killer feature,`" and it certainly sets Git apart in the VCS community.
Why is it so special?
The way Git branches is incredibly lightweight, making branching operations nearly instantaneous, and switching back and forth between branches generally just as fast.
Unlike many other VCSs, Git encourages workflows that branch and merge often, even multiple times in a day.
Understanding and mastering this feature gives you a powerful and unique tool and can entirely change the way that you develop.
//////////////////////////
Git のブランチモデルは「決定的にすぐれた機能」という方がいます。
たしかにこれがあることで、Git は VCS コミュニティの中でも際立っています。
では何がすぐれているのでしょう？
Git のブランチ機能は圧倒的に軽量です。
ブランチ操作はあっという間にでき、ブランチ切り替えもほぼ瞬時にできます。
他のVCS とは違って Git では、ブランチによって作業を分岐させ、しかも 1 日のうちに何度でもマージすることを推奨しています。
この機能を理解して活用していけば、他にはない強力なツールとして、開発作業全体を一変させることができます。
@z

@x
include::book/03-git-branching/sections/nutshell.asc[]
@y
include::book/03-git-branching/sections/nutshell.asc[]
@z

@x
include::book/03-git-branching/sections/basic-branching-and-merging.asc[]
@y
include::book/03-git-branching/sections/basic-branching-and-merging.asc[]
@z

@x
include::book/03-git-branching/sections/branch-management.asc[]
@y
include::book/03-git-branching/sections/branch-management.asc[]
@z

@x
include::book/03-git-branching/sections/workflows.asc[]
@y
include::book/03-git-branching/sections/workflows.asc[]
@z

@x
include::book/03-git-branching/sections/remote-branches.asc[]
@y
include::book/03-git-branching/sections/remote-branches.asc[]
@z

@x
include::book/03-git-branching/sections/rebasing.asc[]
@y
include::book/03-git-branching/sections/rebasing.asc[]
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
We've covered basic branching and merging in Git.
You should feel comfortable creating and switching to new branches, switching between branches and merging local branches together.
You should also be able to share your branches by pushing them to a shared server, working with others on shared branches and rebasing your branches before they are shared.
Next, we'll cover what you'll need to run your own Git repository-hosting server.
@y
//////////////////////////
We've covered basic branching and merging in Git.
You should feel comfortable creating and switching to new branches, switching between branches and merging local branches together.
You should also be able to share your branches by pushing them to a shared server, working with others on shared branches and rebasing your branches before they are shared.
Next, we'll cover what you'll need to run your own Git repository-hosting server.
//////////////////////////
We've covered basic branching and merging in Git.
You should feel comfortable creating and switching to new branches, switching between branches and merging local branches together.
You should also be able to share your branches by pushing them to a shared server, working with others on shared branches and rebasing your branches before they are shared.
Next, we'll cover what you'll need to run your own Git repository-hosting server.
@z
