%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_undoing]]
@y
[[_undoing]]
@z

@x
=== Undoing Things
@y
//////////////////////////
=== Undoing Things
//////////////////////////
=== 作業のやり直し
@z

@x
At any stage, you may want to undo something.
Here, we'll review a few basic tools for undoing changes that you've made.
Be careful, because you can't always undo some of these undos.
This is one of the few areas in Git where you may lose some work if you do it wrong.
@y
//////////////////////////
//////////////////////////
どのような場面でも、作業のやり直しを必要とすることがあります。
ここからは、作業をやり直すための基本的なコマンドについて示します。
ただしやり直しのやり直しということは、常にできるわけではないことに注意しておいてください。
Git にとって数少ない例ですが、操作を誤ったときには取り戻せなくなる例です。
@z

@x
One of the common undos takes place when you commit too early and possibly forget to add some files, or you mess up your commit message.
If you want to redo that commit, make the additional changes you forgot, stage them, and commit again using the `--amend` option:
@y
//////////////////////////
//////////////////////////
よくありがちなのは、コミットを早まって行ってしまい、これを取り戻したくなるときです。
たとえばファイルの追加を忘れていたり、コミットメッセージを書き誤ったりしたときです。
コミットをもう一度行いたいときには、忘れていた追加の作業を行ってステージし、再度のコミットの際に `--amend` オプションをつけて実行します。
@z

@x
[source,console]
----
$ git commit --amend
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git commit --amend
----
@z

@x
This command takes your staging area and uses it for the commit.
If you've made no changes since your last commit (for instance, you run this command immediately after your previous commit), then your snapshot will look exactly the same, and all you'll change is your commit message.
@y
//////////////////////////
//////////////////////////
このコマンドはステージングエリアの情報を取得して、これをコミット処理に用います。
最後にコミットをしてから何も変更を加えていない場合（たとえばコミットを行った直後に上のコマンドを実行した場合）、スナップショットの内容は見た目は何も変わりません。
ここからできることといえば、コミットメッセージを変えることだけです。
@z

@x
The same commit-message editor fires up, but it already contains the message of your previous commit.
You can edit the message the same as always, but it overwrites your previous commit.
@y
//////////////////////////
//////////////////////////
今までと変わらずコミットメッセージを編集するエディターが起動します。
ただしこのときには、直前のコミット時のコミットメッセージが、すでにエディター上に記述されています。
ここでいつも通りにコミットメッセージを編集しますが、この編集によって前回のコミットメッセージは上書きされます。
@z

@x
As an example, if you commit and then realize you forgot to stage the changes in a file you wanted to add to this commit, you can do something like this:
@y
//////////////////////////
//////////////////////////
1 つの例としてファイルを修正したのに、これをステージすることを忘れてコミットしてしまったとします。
このファイル修正をコミットに加えたい場合、以下のようにします。
@z

@x
[source,console]
----
$ git commit -m 'Initial commit'
$ git add forgotten_file
$ git commit --amend
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git commit -m 'Initial commit'
$ git add forgotten_file
$ git commit --amend
----
@z

@x
You end up with a single commit -- the second commit replaces the results of the first.
@y
//////////////////////////
//////////////////////////
これは最終的に 1 つのコミットになります。
つまり 2 つめのコミットが 1 つめのコミットを書き換えます。
@z

@x
[NOTE]
====
It's important to understand that when you're amending your last commit, you're not so much fixing it as _replacing_ it entirely with a new, improved commit that pushes the old commit out of the way and puts the new commit in its place.
Effectively, it's as if the previous commit never happened, and it won't show up in your repository history.
@y
//////////////////////////
//////////////////////////
[NOTE]
====
しっかり理解しておくところですが、最後のコミットを修正するとは言っても、十分な修正が行えるわけではありません。
最後のコミットを捨てて、新しく正確なコミットに完全に置き換えるわけでは**ありません**。
効果としては最後のコミットがなかったものとして、つまりリポジトリの履歴に残らないようにするくらいです。
@z

@x
The obvious value to amending commits is to make minor improvements to your last commit, without cluttering your repository history with commit messages of the form, "`Oops, forgot to add a file`" or "`Darn, fixing a typo in last commit`".
====
@y
//////////////////////////
//////////////////////////
最後のコミットを修正するのは、わずかでもそのコミットを改める程度の意味しかありません。
コミットメッセージとして「ファイルを追加し忘れたので」とか、「最後のコミットのタイポを修正」といったものが増えてしまうのを防ぐ程度のことです。
====
@z

@x
[[_unstaging]]
@y
[[_unstaging]]
@z

@x
==== Unstaging a Staged File
@y
//////////////////////////
==== Unstaging a Staged File
//////////////////////////
==== ステージされたファイルの取り消し
@z

@x
The next two sections demonstrate how to work with your staging area and working directory changes.
The nice part is that the command you use to determine the state of those two areas also reminds you how to undo changes to them.
For example, let's say you've changed two files and want to commit them as two separate changes, but you accidentally type `git add *` and stage them both.
How can you unstage one of the two?
The `git status` command reminds you:
@y
//////////////////////////
//////////////////////////
ここからの 2 つの節では、ステージングエリアとワーキングディレクトリにおける修正作業を取り扱います。
ステージングエリアとワーキングディレクトリのどちらにあるかを確認するコマンドは、ありがたいことに、取り消しをどのように行えばよいのかも示してくれています。
たとえば 2 つのファイルを編集し、別々の変更としてコミットしようとしているとします。
ところがうっかりして `git add *` と入力し、2 つともステージされた状態にしてしまいました。
2 つのファイルのうち、1 つだけステージされた状態を取り消すにはどうしたらよいでしょう？
その答えは `git status` の出力結果が示してくれます。
@z

@x
[source,console]
----
$ git add *
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git add *
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@z

@x
    renamed:    README.md -> README
    modified:   CONTRIBUTING.md
----
@y
    renamed:    README.md -> README
    modified:   CONTRIBUTING.md
----
@z

@x
Right below the "`Changes to be committed`" text, it says use `git reset HEAD <file>...` to unstage.
So, let's use that advice to unstage the `CONTRIBUTING.md` file:
@y
//////////////////////////
//////////////////////////
"`Changes to be committed`" という見出しの直後に、``use `git reset HEAD <file>...` to unstage''（このコマンドにより unstage する、つまりステージ状態を元に戻します）と書いてあります。
そこで書かれているとおりに、ここでは `CONTRIBUTING.md` ファイルのステージ状態を取り消してみます。
@z

@x
[source,console]
----
$ git reset HEAD CONTRIBUTING.md
Unstaged changes after reset:
M	CONTRIBUTING.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git reset HEAD CONTRIBUTING.md
Unstaged changes after reset:
M	CONTRIBUTING.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@z

@x
    renamed:    README.md -> README
@y
    renamed:    README.md -> README
@z

@x
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@y
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@z

@x
    modified:   CONTRIBUTING.md
----
@y
    modified:   CONTRIBUTING.md
----
@z

@x
The command is a bit strange, but it works.
The `CONTRIBUTING.md` file is modified but once again unstaged.
@y
//////////////////////////
//////////////////////////
このコマンドはよくわからないものかもしれませんが、うまく動作します。
`CONTRIBUTING.md` ファイルは修正されているものの、ステージされていない状態に戻ったことになります。
@z

@x
[NOTE]
=====
It's true that `git reset` can be a dangerous command, especially if you provide the `--hard` flag.
However, in the scenario described above, the file in your working directory is not touched, so it's relatively safe.
=====
@y
//////////////////////////
//////////////////////////
[NOTE]
=====
`git reset` は危険なコマンドとなることがあります。
特に `--hard` フラグをつけて実行するときは要注意です。
ただし上に示した例では、ワーキングディレクトリにあるファイルを触っているわけではないので、比較的安全です。
=====
@z

@x
For now this magic invocation is all you need to know about the `git reset` command.
We'll go into much more detail about what `reset` does and how to master it to do really interesting things in <<ch07-git-tools#_git_reset>>.
@y
//////////////////////////
//////////////////////////
今のところ `git reset` コマンドに関しては、不思議そうに見えるこの実行方法を知っておくだけで十分です。
この後には <<ch07-git-tools#_git_reset>> の章において `reset` が何を行うのかを説明します。
またさらにおもしろい利用方法も示していきます。
@z

@x
==== Unmodifying a Modified File
@y
//////////////////////////
//////////////////////////
==== 修正されたファイルの取り消し
@z

@x
What if you realize that you don't want to keep your changes to the `CONTRIBUTING.md` file?
How can you easily unmodify it -- revert it back to what it looked like when you last committed (or initially cloned, or however you got it into your working directory)?
Luckily, `git status` tells you how to do that, too.
In the last example output, the unstaged area looks like this:
@y
//////////////////////////
//////////////////////////
`CONTRIBUTING.md` ファイルを修正してみたものの、この修正は取りやめたいと思ったらどうしますか？
簡単に元に戻す方法は？
つまり最後にコミットした直後の状態にまで戻すには？
（あるいはクローンを取得し、ワーキングディレクトリに取り込んだ状態にまで戻すには？）
便利なことですが、ここでも`git status` コマンドを実行すると何をすればよいのか書かれています。
先ほどの出力例において、ステージされていない項目は以下のようになっていました。
@z

@x
[source,console]
----
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@y
//////////////////////////
//////////////////////////
[source,端末]
----
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@z

@x
    modified:   CONTRIBUTING.md
----
@y
    modified:   CONTRIBUTING.md
----
@z

@x
It tells you pretty explicitly how to discard the changes you've made.
Let's do what it says:
@y
//////////////////////////
//////////////////////////
修正した内容を取り消すにはどうするのか、はっきりと書かれています。
ですからそのとおりにやってみます。
@z

@x
[source,console]
----
$ git checkout -- CONTRIBUTING.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git checkout -- CONTRIBUTING.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@z

@x
    renamed:    README.md -> README
@y
    renamed:    README.md -> README
@z

@x
----
@y
----
@z

@x
You can see that the changes have been reverted.
@y
//////////////////////////
//////////////////////////
修正が取り消されたことがわかります。
@z

@x
[IMPORTANT]
=====
It's important to understand that `git checkout -- <file>` is a dangerous command.
Any local changes you made to that file are gone -- Git just replaced that file with the most recently-committed version.
Don't ever use this command unless you absolutely know that you don't want those unsaved local changes.
=====
@y
//////////////////////////
//////////////////////////
[IMPORTANT]
=====
`git checkout -- <file>` は危険なコマンドであることを、ここで十分に理解しておいてください。
ローカル環境においてこのファイルに加えた変更は、すべて取り消されてなくなります。
このとき Git はこのファイルを、直前のコミット内容に戻す処理をします。
したがってこのコマンドは、未保存の内容が失われてもかまわないことが十分にわかっているときに限って実行してください。
=====
@z

@x
If you would like to keep the changes you've made to that file but still need to get it out of the way for now, we'll go over stashing and branching in <<ch03-git-branching#ch03-git-branching>>; these are generally better ways to go.
@y
//////////////////////////
//////////////////////////
ファイルに対して修正を加えてこれを保持しつつ、しばらくは放っておきたいような場合は、「<<ch03-git-branching#ch03-git-branching>>」の章におけるスタッシュ（stashing）やブランチ（branching）の方法があります。
この方法が一般的かもしれません。
@z

@x
Remember, anything that is _committed_ in Git can almost always be recovered.
Even commits that were on branches that were deleted or commits that were overwritten with an `--amend` commit can be recovered (see <<ch10-git-internals#_data_recovery>> for data recovery).
However, anything you lose that was never committed is likely never to be seen again.
@y
//////////////////////////
//////////////////////////
ここでしっかりと覚えてください。
Git において修正した内容をコミットしていれば、それはほぼ間違いなく元に戻すことができます。
ブランチへのコミットであって、しかもそのブランチを削除していたとしても戻せます。
`--amend` を使ってコミットを上書きした場合であっても戻せます。
（データの復元方法に関しては「<<ch10-git-internals#_data_recovery>>」の章を参照してください。）
逆にコミットをせずに消してしまった内容は、どうあっても取り戻すことはできません。
@z
