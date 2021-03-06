%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_aliases]]
@y
[[_git_aliases]]
@z

@x
=== Git Aliases
@y
//////////////////////////
=== Git Aliases
//////////////////////////
=== Git エイリアス
@z

@x
(((aliases)))
@y
(((aliases)))
@z

@x
Before we move on to the next chapter, we want to introduce a feature that can make your Git experience simpler, easier, and more familiar: aliases.
For clarity's sake, we won't be using them anywhere else in this book, but if you go on to use Git with any regularity, aliases are something you should know about.
@y
//////////////////////////
Before we move on to the next chapter, we want to introduce a feature that can make your Git experience simpler, easier, and more familiar: aliases.
For clarity's sake, we won't be using them anywhere else in this book, but if you go on to use Git with any regularity, aliases are something you should know about.
//////////////////////////
次の章に進む前に、Git 操作をより単純に簡単にする使い勝手のよい機能について説明しておきます。
エイリアスです。
わかりやすくするために、本書の他の場面で使うことはありませんが、Git を普段から使う方にとってエイリアスは知っておく必要があります。
@z

@x
Git doesn't automatically infer your command if you type it in partially.
If you don't want to type the entire text of each of the Git commands, you can easily set up an alias for each command using `git config`.(((git commands, config)))
Here are a couple of examples you may want to set up:
@y
//////////////////////////
Git doesn't automatically infer your command if you type it in partially.
If you don't want to type the entire text of each of the Git commands, you can easily set up an alias for each command using `git config`.(((git commands, config)))
Here are a couple of examples you may want to set up:
//////////////////////////
Git ではコマンドを部分的に入力しても、自動的にコマンド内容を推測することはしません。
Git コマンドの実行のたびに、コマンド文字をすべて入力したくない場合、`git config` を使えば、各コマンドに対するエイリアスを簡単に設定することができます。
(((git commands, config)))
以下に設定したくなるような例をいくつか示します。
@z

@x
[source,console]
----
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
----
@y
//////////////////////////
[source,console]
----
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
----
//////////////////////////
[source,端末]
----
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
----
@z

@x
This means that, for example, instead of typing `git commit`, you just need to type `git ci`.
As you go on using Git, you'll probably use other commands frequently as well; don't hesitate to create new aliases.
@y
//////////////////////////
This means that, for example, instead of typing `git commit`, you just need to type `git ci`.
As you go on using Git, you'll probably use other commands frequently as well; don't hesitate to create new aliases.
//////////////////////////
上が意味するのは、たとえば `git commit` と入力する代わりに、`git ci` と入力しさえすればよいということです。
Git を使い続けていくうちには、同じように何度も利用するコマンドが出てくるはずです。
そんなときには、ためらわずにエイリアスを作成しましょう。
@z

@x
This technique can also be very useful in creating commands that you think should exist.
For example, to correct the usability problem you encountered with unstaging a file, you can add your own unstage alias to Git:
@y
//////////////////////////
This technique can also be very useful in creating commands that you think should exist.
For example, to correct the usability problem you encountered with unstaging a file, you can add your own unstage alias to Git:
//////////////////////////
このやり方を使えば、存在していて欲しいと思うコマンドを作り出すことができるので便利です。
たとえばファイルのステージングを解除する際に、コマンドが使いにくいと思ったら、独自にステージを解除するエイリアスを追加してしまえばよいわけです。
@z

@x
[source,console]
----
$ git config --global alias.unstage 'reset HEAD --'
----
@y
//////////////////////////
[source,console]
----
$ git config --global alias.unstage 'reset HEAD --'
----
//////////////////////////
[source,端末]
----
$ git config --global alias.unstage 'reset HEAD --'
----
@z

@x
This makes the following two commands equivalent:
@y
//////////////////////////
This makes the following two commands equivalent:
//////////////////////////
こうすることで以下の 2 つのコマンドが同じ意味になります。
@z

@x
[source,console]
----
$ git unstage fileA
$ git reset HEAD -- fileA
----
@y
//////////////////////////
[source,console]
----
$ git unstage fileA
$ git reset HEAD -- fileA
----
//////////////////////////
[source,端末]
----
$ git unstage fileA
$ git reset HEAD -- fileA
----
@z

@x
This seems a bit clearer.
It's also common to add a `last` command, like this:
@y
//////////////////////////
This seems a bit clearer.
It's also common to add a `last` command, like this:
//////////////////////////
少しはわかりやすくなりました。
`last` コマンドを使うこともよくあることなので、以下のようにしてみます。
@z

@x
[source,console]
----
$ git config --global alias.last 'log -1 HEAD'
----
@y
//////////////////////////
[source,console]
----
$ git config --global alias.last 'log -1 HEAD'
----
//////////////////////////
[source,端末]
----
$ git config --global alias.last 'log -1 HEAD'
----
@z

@x
This way, you can see the last commit easily:
@y
//////////////////////////
This way, you can see the last commit easily:
//////////////////////////
こうして直近のコミットを簡単に確認できるようになりました。
@z

@x
[source,console]
----
$ git last
commit 66938dae3329c7aebe598c2246a8e6af90d04646
Author: Josh Goebel <dreamer3@example.com>
Date:   Tue Aug 26 19:48:51 2008 +0800

    Test for current head

    Signed-off-by: Scott Chacon <schacon@example.com>
----
@y
//////////////////////////
[source,console]
----
$ git last
commit 66938dae3329c7aebe598c2246a8e6af90d04646
Author: Josh Goebel <dreamer3@example.com>
Date:   Tue Aug 26 19:48:51 2008 +0800

    Test for current head

    Signed-off-by: Scott Chacon <schacon@example.com>
----
//////////////////////////
[source,端末]
----
$ git last
commit 66938dae3329c7aebe598c2246a8e6af90d04646
Author: Josh Goebel <dreamer3@example.com>
Date:   Tue Aug 26 19:48:51 2008 +0800

    Test for current head

    Signed-off-by: Scott Chacon <schacon@example.com>
----
@z

@x
As you can tell, Git simply replaces the new command with whatever you alias it for.
However, maybe you want to run an external command, rather than a Git subcommand.
In that case, you start the command with a `!` character.
This is useful if you write your own tools that work with a Git repository.
We can demonstrate by aliasing `git visual` to run `gitk`:
@y
//////////////////////////
As you can tell, Git simply replaces the new command with whatever you alias it for.
However, maybe you want to run an external command, rather than a Git subcommand.
In that case, you start the command with a `!` character.
This is useful if you write your own tools that work with a Git repository.
We can demonstrate by aliasing `git visual` to run `gitk`:
//////////////////////////
これまでからわかるように、Git は新たなコマンドをエイリアスで設定されたものに置き換えているだけです。
ただ Git のサブコマンドでなく、外部コマンドも実行したいはずです。
その場合は、コマンド名の先頭に `!` 文字をつけます。
Git リポジトリ上で操作する独自ツールを書く場合に使えます。
以下は `git visual` を `gitk` というエイリアスにする例です。
@z

@x
[source,console]
----
$ git config --global alias.visual '!gitk'
----
@y
//////////////////////////
[source,console]
----
$ git config --global alias.visual '!gitk'
----
//////////////////////////
[source,端末]
----
$ git config --global alias.visual '!gitk'
----
@z
