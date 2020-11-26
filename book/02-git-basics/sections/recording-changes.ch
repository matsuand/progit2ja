%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Recording Changes to the Repository
@y
//////////////////////////
=== Recording Changes to the Repository
//////////////////////////
=== 変更内容のリポジトリへの記録
@z

@x
At this point, you should have a _bona fide_ Git repository on your local machine, and a checkout or _working copy_ of all of its files in front of you.
Typically, you'll want to start making changes and committing snapshots of those changes into your repository each time the project reaches a state you want to record.
@y
//////////////////////////
At this point, you should have a _bona fide_ Git repository on your local machine, and a checkout or _working copy_ of all of its files in front of you.
Typically, you'll want to start making changes and committing snapshots of those changes into your repository each time the project reaches a state you want to record.
//////////////////////////
ここまでの作業により、本物の Git リポジトリがローカルマシン内に取得できました。
そしてそのプロジェクトのチェックアウト後の、つまり全ファイルのワーキングコピーが取得できた状態です。
この後はファイル編集を行って、その変更内容のスナップショットをコミットしていきます。
そのたびにプロジェクトには、変更予定の内容が積みあがっていきます。
@z

@x
Remember that each file in your working directory can be in one of two states: _tracked_ or _untracked_.
Tracked files are files that were in the last snapshot; they can be unmodified, modified, or staged.
In short, tracked files are files that Git knows about.
@y
//////////////////////////
Remember that each file in your working directory can be in one of two states: _tracked_ or _untracked_.
Tracked files are files that were in the last snapshot; they can be unmodified, modified, or staged.
In short, tracked files are files that Git knows about.
//////////////////////////
ワーキングコピー内にあるファイルは 2 種類あって、**追跡された**（tracked）ファイルと**追跡されていない**（untracked; 未追跡の）ファイルです。
追跡されたファイルは、最新のスナップショットに存在するファイルです。
このファイルは後の操作によって、修正されていない（unmodified）、修正された（modified）、ステージされた（staged）という状態をとります。
簡単に言うと、追跡されたファイルは Git が認識しているファイルということです。
@z

@x
Untracked files are everything else -- any files in your working directory that were not in your last snapshot and are not in your staging area.
When you first clone a repository, all of your files will be tracked and unmodified because Git just checked them out and you haven't edited anything.
@y
//////////////////////////
Untracked files are everything else -- any files in your working directory that were not in your last snapshot and are not in your staging area.
When you first clone a repository, all of your files will be tracked and unmodified because Git just checked them out and you haven't edited anything.
//////////////////////////
未追跡のファイルは上に該当しないファイルです。
ワーキングディレクトリ内のこの未追跡ファイルは、最新のスナップショットにもなく、ステージングエリアにもありません。
リポジトリのクローンを取得したばかりのときには、ファイルはすべて追跡された状態であり、修正されていない状態です。
Git がファイルを取り出した直後であって、だれも手をつけていないからです。
@z

@x
As you edit files, Git sees them as modified, because you've changed them since your last commit.
As you work, you selectively stage these modified files and then commit all those staged changes, and the cycle repeats.
@y
//////////////////////////
As you edit files, Git sees them as modified, because you've changed them since your last commit.
As you work, you selectively stage these modified files and then commit all those staged changes, and the cycle repeats.
//////////////////////////
ファイルに変更を加えると、Git は修正されたものとして扱います。
最終のコミットの状態から変更が加えられたからです。
作業を進めるにつれて、修正したファイルをステージの状態とし、その後にコミットします。
こうした作業を繰り返し進めていきます。
@z

@x
.The lifecycle of the status of your files
image::images/lifecycle.png[The lifecycle of the status of your files]
@y
//////////////////////////
.The lifecycle of the status of your files
image::images/lifecycle.png[The lifecycle of the status of your files]
//////////////////////////
.ファイル状態のライフサイクル
image::images/lifecycle.png[ファイル状態のライフサイクル]
@z

@x
[[_checking_status]]
@y
[[_checking_status]]
@z

@x
==== Checking the Status of Your Files
@y
//////////////////////////
==== Checking the Status of Your Files
//////////////////////////
==== ファイル状態のチェック
@z

@x
The main tool you use to determine which files are in which state is the `git status` command.(((git commands, status)))
If you run this command directly after a clone, you should see something like this:
@y
//////////////////////////
The main tool you use to determine which files are in which state is the `git status` command.(((git commands, status)))
If you run this command directly after a clone, you should see something like this:
//////////////////////////
ファイルの状態を確認するツールとして用いるのが `git status` です。
(((git commands, status)))
クローンを取得した直後にこのコマンドを実行すると、以下のような出力になります。
@z

@x
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
----
@y
//////////////////////////
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
----
//////////////////////////
[source,端末]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
----
@z

@x
This means you have a clean working directory; in other words, none of your tracked files are modified.
Git also doesn't see any untracked files, or they would be listed here.
Finally, the command tells you which branch you're on and informs you that it has not diverged from the same branch on the server.
For now, that branch is always `master`, which is the default; you won't worry about it here.
<<ch03-git-branching#ch03-git-branching>> will go over branches and references in detail.
@y
//////////////////////////
This means you have a clean working directory; in other words, none of your tracked files are modified.
Git also doesn't see any untracked files, or they would be listed here.
Finally, the command tells you which branch you're on and informs you that it has not diverged from the same branch on the server.
For now, that branch is always `master`, which is the default; you won't worry about it here.
<<ch03-git-branching#ch03-git-branching>> will go over branches and references in detail.
//////////////////////////
この出力メッセージは、ワーキングディレクトリがきれいな状態にあることを示しています。
言いかえると、追跡されているファイルがどれも修正されていない状態です。
また未追跡のファイルは 1 つもなく、もしあれば一覧に表示されているところです。
さらに、今どのブランチを対象としているか、サーバー上にあるそのブランチから分岐していないかどうかが示されています。
今のところブランチは、デフォルトのブランチ `master` になっているものとします。
この段階ではあまり気にしないでください。
<<ch03-git-branching#ch03-git-branching>> の章においてブランチについて詳しく説明します。
@z

@x
Let's say you add a new file to your project, a simple `README` file.
If the file didn't exist before, and you run `git status`, you see your untracked file like so:
@y
//////////////////////////
Let's say you add a new file to your project, a simple `README` file.
If the file didn't exist before, and you run `git status`, you see your untracked file like so:
//////////////////////////
ではプロジェクトに新規のファイルとして、単純な `README` ファイルを追加します。
以前までは、このファイルはなかったとします。
ここで `git status` コマンドを実行すると、未追跡のファイルとして以下のように表示されます。
@z

@x
[source,console]
----
$ echo 'My Project' > README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    README

nothing added to commit but untracked files present (use "git add" to track)
----
@y
//////////////////////////
[source,console]
----
$ echo 'My Project' > README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    README

nothing added to commit but untracked files present (use "git add" to track)
----
//////////////////////////
[source,端末]
----
$ echo 'My Project' > README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    README

nothing added to commit but untracked files present (use "git add" to track)
----
@z

@x
You can see that your new `README` file is untracked, because it's under the "`Untracked files`" heading in your status output.
Untracked basically means that Git sees a file you didn't have in the previous snapshot (commit); Git won't start including it in your commit snapshots until you explicitly tell it to do so.
It does this so you don't accidentally begin including generated binary files or other files that you did not mean to include.
You do want to start including `README`, so let's start tracking the file.
@y
//////////////////////////
You can see that your new `README` file is untracked, because it's under the ``Untracked files'' heading in your status output.
Untracked basically means that Git sees a file you didn't have in the previous snapshot (commit); Git won't start including it in your commit snapshots until you explicitly tell it to do so.
It does this so you don't accidentally begin including generated binary files or other files that you did not mean to include.
You do want to start including `README`, so let's start tracking the file.
//////////////////////////
新規に生成した README ファイルは、未追跡の状態にあることがわかります。
`git status` の出力において、"`Untracked files`" （未追跡ファイル）という見出しのもとにこのファイルが示されているからです。
未追跡という状態は、直前のスナップショット（直前のコミットのとき）には存在していなかったファイルを表わします。
このようなファイルは、Git に対して管理の指示を出さないかぎり、コミットされたスナップショットの中には含まれません。
ですから、生成した実行モジュールであるとか、含めるつもりのないファイルとかを誤って含めてしまうようなことは起きません。
さてこうして README ファイルを含めたので、ここから追跡を始めましょう。
@z

@x
[[_tracking_files]]
@y
[[_tracking_files]]
@z

@x
==== Tracking New Files
@y
//////////////////////////
==== Tracking New Files
//////////////////////////
==== 新規ファイルの追跡
@z

@x
In order to begin tracking a new file, you use the command `git add`.(((git commands, add)))
To begin tracking the `README` file, you can run this:
@y
//////////////////////////
In order to begin tracking a new file, you use the command `git add`.(((git commands, add)))
To begin tracking the `README` file, you can run this:
//////////////////////////
新規生成したファイルを追跡状態にするには `git add` コマンドを実行します。
(((git commands, add)))
`README` ファイルの場合、以下のようになります。
@z

@x
[source,console]
----
$ git add README
----
@y
//////////////////////////
[source,console]
----
$ git add README
----
//////////////////////////
[source,端末]
----
$ git add README
----
@z

@x
If you run your status command again, you can see that your `README` file is now tracked and staged to be committed:
@y
//////////////////////////
If you run your status command again, you can see that your `README` file is now tracked and staged to be committed:
//////////////////////////
再度 `git status` コマンドを実行すると、今度は `README` ファイルが追跡された状態となり、かつステージされた状態となっています。
次にコミットを待っている状態です。
@z

@x
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)

    new file:   README

----
@y
//////////////////////////
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)

    new file:   README

----
//////////////////////////
[source,端末]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)

    new file:   README

----
@z

@x
You can tell that it's staged because it's under the "`Changes to be committed`" heading.
If you commit at this point, the version of the file at the time you ran `git add` is what will be in the subsequent historical snapshot.
You may recall that when you ran `git init` earlier, you then ran `git add <files>` -- that was to begin tracking files in your directory.(((git commands, init)))(((git commands, add)))
The `git add` command takes a path name for either a file or a directory; if it's a directory, the command adds all the files in that directory recursively.
@y
//////////////////////////
You can tell that it's staged because it's under the ``Changes to be committed'' heading.
If you commit at this point, the version of the file at the time you ran `git add` is what will be in the subsequent historical snapshot.
You may recall that when you ran `git init` earlier, you then ran `git add <files>` -- that was to begin tracking files in your directory.(((git commands, init)))(((git commands, add)))
The `git add` command takes a path name for either a file or a directory; if it's a directory, the command adds all the files in that directory recursively.
//////////////////////////
``Changes to be committed''（``コミット待ちの変更''）という見出しのもとに示されているので、ステージされた状態であることがわかります。
この時点でコミットを行うと、`git add` コマンドを行ったときのこのファイルのバージョンが、スナップショットの中に記録されます。
ちょっと前に `git init` に続けて `git add <ファイル>` を実行していました。
そのときも実は、ディレクトリ内のファイルの追跡を開始していたのです。
(((git commands, init)))(((git commands, add)))
`git add` コマンドではパスを指定しますが、パスというのはファイルパスか、あるいはディレクトリパスです。
ディレクトリパスを指定した場合は、そのディレクトリ内にあるファイルがすべて追加されます。
@z

@x
==== Staging Modified Files
@y
//////////////////////////
==== Staging Modified Files
//////////////////////////
==== 修正ファイルのステージング
@z

@x
Let's change a file that was already tracked.
If you change a previously tracked file called `CONTRIBUTING.md` and then run your `git status` command again, you get something that looks like this:
@y
//////////////////////////
Let's change a file that was already tracked.
If you change a previously tracked file called `CONTRIBUTING.md` and then run your `git status` command again, you get something that looks like this:
//////////////////////////
追跡されている状態のファイルを修正してみます。
`CONTRIBUTING.md` というファイルがすでに追跡されている状態にあって、これに変更をかけた場合 `git status` コマンドによる出力結果は以下のようになります。
@z

@x
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
@y
//////////////////////////
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
//////////////////////////
[source,端末]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
@z

@x
The `CONTRIBUTING.md` file appears under a section named "`Changes not staged for commit`" -- which means that a file that is tracked has been modified in the working directory but not yet staged.
To stage it, you run the `git add` command.
`git add` is a multipurpose command -- you use it to begin tracking new files, to stage files, and to do other things like marking merge-conflicted files as resolved.
It may be helpful to think of it more as "`add precisely this content to the next commit`" rather than "`add this file to the project`".(((git commands, add)))
Let's run `git add` now to stage the `CONTRIBUTING.md` file, and then run `git status` again:
@y
//////////////////////////
The `CONTRIBUTING.md` file appears under a section named "`Changes not staged for commit`" -- which means that a file that is tracked has been modified in the working directory but not yet staged.
To stage it, you run the `git add` command.
`git add` is a multipurpose command -- you use it to begin tracking new files, to stage files, and to do other things like marking merge-conflicted files as resolved.
It may be helpful to think of it more as "`add precisely this content to the next commit`" rather than "`add this file to the project`".(((git commands, add)))
Let's run `git add` now to stage the `CONTRIBUTING.md` file, and then run `git status` again:
//////////////////////////
`CONTRIBUTING.md` ファイルは "`Changes not staged for commit`" （未ステージでコミット待ちの変更）という見出しのもとに表示されています。
このファイルが元から追跡された状態にあって、それがワーキングディレクトリ内で修正され、ただしまだステージされていない状態であることを示しています。
これをステージされた状態にするには `git add` コマンドを実行します。
そもそも `git add` コマンドには、いろいろな利用目的があります。
新規ファイルを追跡状態にしたり、ステージ状態にしたりします。
その他にも、マージ時にコンフリクト（競合）が発生したファイルに対して、解決された（resolved）というマークをつける際にも利用します。
このコマンドは「プロジェクトにファイルを追加するもの」と考えるのではなく「次のコミットに向けて指定内容を加える」と考えるのがわかりやすくなります。
(((git commands, add)))
さてそこで `git add` を実行して `CONTRIBUTING.md` ファイルをステージ状態にします。
その直後にまた `git status` を実行してみます。
@z

@x
[source,console]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

----
@y
//////////////////////////
[source,console]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

----
//////////////////////////
[source,端末]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

----
@z

@x
Both files are staged and will go into your next commit.
At this point, suppose you remember one little change that you want to make in `CONTRIBUTING.md` before you commit it.
You open it again and make that change, and you're ready to commit.
However, let's run `git status` one more time:
@y
//////////////////////////
Both files are staged and will go into your next commit.
At this point, suppose you remember one little change that you want to make in `CONTRIBUTING.md` before you commit it.
You open it again and make that change, and you're ready to commit.
However, let's run `git status` one more time:
//////////////////////////
2 つのファイルが、ともにステージされた状態にあって、次のコミットに備えた状態です。
ここで仮に `CONTRIBUTING.md` にはまだ編集したい内容があって、それを終えてからコミットするとしましょう。
ファイルをもう一度開いて編集し、コミットしたとします。
`git status` を実行すると、今度は以下のようになります。
@z

@x
[source,console]
----
$ vim CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
@y
//////////////////////////
[source,console]
----
$ vim CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
//////////////////////////
[source,端末]
----
$ vim CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md

----
@z

@x
What the heck?
Now `CONTRIBUTING.md` is listed as both staged _and_ unstaged.
How is that possible?
It turns out that Git stages a file exactly as it is when you run the `git add` command.
If you commit now, the version of `CONTRIBUTING.md` as it was when you last ran the `git add` command is how it will go into the commit, not the version of the file as it looks in your working directory when you run `git commit`.
If you modify a file after you run `git add`, you have to run `git add` again to stage the latest version of the file:
@y
//////////////////////////
What the heck?
Now `CONTRIBUTING.md` is listed as both staged _and_ unstaged.
How is that possible?
It turns out that Git stages a file exactly as it is when you run the `git add` command.
If you commit now, the version of `CONTRIBUTING.md` as it was when you last ran the `git add` command is how it will go into the commit, not the version of the file as it looks in your working directory when you run `git commit`.
If you modify a file after you run `git add`, you have to run `git add` again to stage the latest version of the file:
//////////////////////////
これはどういうことでしょう？
`CONTRIBUTING.md` がステージされた状態とステージされていない状態の**両方に**あがっているではないですか。
どうしてこんなことになっているのでしょう？
ここからわかることは、ファイルがステージ状態になるときには、`git add` コマンドを実行したそのときのファイル内容がそのまま記録されるということです。
つまりここでコミットを行うと、`git add` コマンドを最後に実行した時点での `CONTRIBUTING.md` ファイルのバージョンが、コミットに向けて採用されるのであって、`git commit` を実行する時点でワーキングディレクトリにある最新の `CONTRIBUTING.md` がコミットされるのではないわけです。
`git add` を実行した後にファイルに編集をかけたら、再度 `git add` を実行しないと、そのファイルの最新バージョンはステージ状態にはなりません。
@z

@x
[source,console]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md
----
@y
//////////////////////////
[source,console]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md
----
//////////////////////////
[source,端末]
----
$ git add CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md
----
@z

@x
==== Short Status
@y
//////////////////////////
==== Short Status
//////////////////////////
==== ステータスの簡略表示
@z

@x
While the `git status` output is pretty comprehensive, it's also quite wordy.
Git also has a short status flag so you can see your changes in a more compact way.
If you run `git status -s` or `git status --short` you get a far more simplified output from the command:
@y
//////////////////////////
While the `git status` output is pretty comprehensive, it's also quite wordy.
Git also has a short status flag so you can see your changes in a more compact way.
If you run `git status -s` or `git status --short` you get a far more simplified output from the command:
//////////////////////////
`git status` による出力は大変わかりやすいものですが、その分、表示される情報も多くなります。
このコマンドには簡略表示するためのフラグが用意されているので、変更内容をもっと簡略に見ることができます。
以下のように `git status -s` または `git status --short` と実行すると、とても簡単な出力となります。
@z

@x
[source,console]
----
$ git status -s
 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
----
@y
//////////////////////////
[source,console]
----
$ git status -s
 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
----
//////////////////////////
[source,端末]
----
$ git status -s
 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
----
@z

@x
New files that aren't tracked have a `??` next to them, new files that have been added to the staging area have an `A`, modified files have an `M` and so on.
There are two columns to the output -- the left-hand column indicates the status of the staging area and the right-hand column indicates the status of the working tree.
So for example in that output, the `README` file is modified in the working directory but not yet staged, while the `lib/simplegit.rb` file is modified and staged.
The `Rakefile` was modified, staged and then modified again, so there are changes to it that are both staged and unstaged.
@y
//////////////////////////
New files that aren't tracked have a `??` next to them, new files that have been added to the staging area have an `A`, modified files have an `M` and so on.
There are two columns to the output -- the left-hand column indicates the status of the staging area and the right-hand column indicates the status of the working tree.
So for example in that output, the `README` file is modified in the working directory but not yet staged, while the `lib/simplegit.rb` file is modified and staged.
The `Rakefile` was modified, staged and then modified again, so there are changes to it that are both staged and unstaged.
//////////////////////////
新規ファイルで未追跡であるものには `??` がつきます。新規ファイルであっても、ステージングエリアに追加されている場合は `A` になります。
また修正されたファイルは `M` といった具合です。その表示箇所は 2 文字からなり、1 文字めはステージングエリアでの状態、2 文字めはワーキングディレクトリでの状態を示します。
したがって上の例において `README` ファイルは、ワーキングディレクトリでの修正状態にあるものの、ステージされていないことがわかります。
また `lib/simplegit.rb` ファイルの場合は、修正された状態であり、かつステージされた状態です。
`Rakefile` ファイルは、修正されステージされた状態で、さらにそこから修正された状態を表わします。
このファイルへの変更内容には、ステージされた状態での内容と、ステージされていない状態での内容が混在しているということです。
@z

@x
[[_ignoring]]
@y
[[_ignoring]]
@z

@x
==== Ignoring Files
@y
//////////////////////////
==== Ignoring Files
//////////////////////////
==== ファイルの無視設定
@z

@x
Often, you'll have a class of files that you don't want Git to automatically add or even show you as being untracked.
These are generally automatically generated files such as log files or files produced by your build system.
In such cases, you can create a file listing patterns to match them named `.gitignore`.(((ignoring files)))
Here is an example `.gitignore` file:
@y
//////////////////////////
Often, you'll have a class of files that you don't want Git to automatically add or even show you as being untracked.
These are generally automatically generated files such as log files or files produced by your build system.
In such cases, you can create a file listing patterns to match them named `.gitignore`.(((ignoring files)))
Here is an example `.gitignore` file:
//////////////////////////
取り扱っているファイルの中には、Git が自動的な追加を行ってほしくないものや、未追跡と示すことが不要なファイルもでてきます。
そういうファイルというのは、一般的には自動生成されるファイルであり、ログファイルとか、システムビルド時に出力されるファイルなどです。
こういうファイルに対しては `.gitignore` というファイルを生成して、無視したいファイルパターンを指定することができます。
(((ignoring files)))
`.gitignore` の例が以下です。
@z

@x
[source,console]
----
$ cat .gitignore
*.[oa]
*~
----
@y
//////////////////////////
[source,console]
----
$ cat .gitignore
*.[oa]
*~
----
//////////////////////////
[source,端末]
----
$ cat .gitignore
*.[oa]
*~
----
@z

@x
The first line tells Git to ignore any files ending in "`.o`" or "`.a`" -- object and archive files that may be the product of building your code.
The second line tells Git to ignore all files whose names end with a tilde (`~`), which is used by many text editors such as Emacs to mark temporary files.
You may also include a log, tmp, or pid directory; automatically generated documentation; and so on.
Setting up a `.gitignore` file for your new repository before you get going is generally a good idea so you don't accidentally commit files that you really don't want in your Git repository.
@y
//////////////////////////
The first line tells Git to ignore any files ending in "`.o`" or "`.a`" -- object and archive files that may be the product of building your code.
The second line tells Git to ignore all files whose names end with a tilde (`~`), which is used by many text editors such as Emacs to mark temporary files.
You may also include a log, tmp, or pid directory; automatically generated documentation; and so on.
Setting up a `.gitignore` file for your new repository before you get going is generally a good idea so you don't accidentally commit files that you really don't want in your Git repository.
//////////////////////////
1 行めは、"`.o`" または "`.a`" で終わるファイルを無視する設定です。
"`.o`" や "`.a`" といえば、ソースコードをビルドした際に生成されるオブジェクトファイルやアーカイブファイルのことです。
また 2 行めはチルド（`~`）で終わるファイルを無視するものです。
このチルドつきのファイルは Emacs のようなエディターが、一時ファイルに対してつけるものです。
この他にも log、tmp、pid といったディレクトリ、自動生成されるドキュメントファイル、といったものも無視の設定が必要でしょう。
あらかじめ `.gitignore` ファイルを設定しておいてから、作業に取りかかるのが良いと思います。
これを行っておけば Git リポジトリの中で、本当はコミットするつもりがないのに誤ってコミットしてしまう、といったことがなくなるはずです。
@z

@x
The rules for the patterns you can put in the `.gitignore` file are as follows:
@y
//////////////////////////
The rules for the patterns you can put in the `.gitignore` file are as follows:
//////////////////////////
`.gitignore` ファイル内のパターン記述の規則は以下のとおりです。
@z

@x
*  Blank lines or lines starting with `#` are ignored.
*  Standard glob patterns work, and will be applied recursively throughout the entire working tree.
*  You can start patterns with a forward slash (`/`) to avoid recursivity.
*  You can end patterns with a forward slash (`/`) to specify a directory.
*  You can negate a pattern by starting it with an exclamation point (`!`).
@y
//////////////////////////
*  Blank lines or lines starting with `#` are ignored.
*  Standard glob patterns work, and will be applied recursively throughout the entire working tree.
*  You can start patterns with a forward slash (`/`) to avoid recursivity.
*  You can end patterns with a forward slash (`/`) to specify a directory.
*  You can negate a pattern by starting it with an exclamation point (`!`).
//////////////////////////
*  空行、および `#` で始まる行は無視されます。
*  標準的な glob パターンが指定可能です。
   この指定はワーキングツリー全体を通じて再帰的に適用されます。
*  ファイルパターンの先頭にスラッシュ（`/`）を記述すると、再帰的なマッチングを行いません。
*  ディレクトリを指定する場合は、パターンの最後にスラッシュ（`/`）を記述します。
*  無視しないことを表わすには、先頭に感嘆符（`!`）をつけます。
@z

@x
Glob patterns are like simplified regular expressions that shells use.
An asterisk (`\*`) matches zero or more characters; `[abc]` matches any character inside the brackets (in this case a, b, or c); a question mark (`?`) matches a single character; and brackets enclosing characters separated by a hyphen (`[0-9]`) matches any character between them (in this case 0 through 9).
You can also use two asterisks to match nested directories; `a/**/z` would match `a/z`, `a/b/z`, `a/b/c/z`, and so on.
@y
//////////////////////////
Glob patterns are like simplified regular expressions that shells use.
An asterisk (`\*`) matches zero or more characters; `[abc]` matches any character inside the brackets (in this case a, b, or c); a question mark (`?`) matches a single character; and brackets enclosing characters separated by a hyphen (`[0-9]`) matches any character between them (in this case 0 through 9).
You can also use two asterisks to match nested directories; `a/**/z` would match `a/z`, `a/b/z`, `a/b/c/z`, and so on.
//////////////////////////
glob パターンとは、シェルにおいて用いられている単純な正規表現に似ています。
アスタリスク（`\*`）は 0 個以上の文字にマッチします。
`[abc]` は、ブラケット内のいずれか（この例では a、b、c のどれか）にマッチします。
疑問符（`?`）は1 文字にマッチします。
ブラケットに囲まれた文字がハイフンで区切られている場合（`[0-9]`）は、その範囲の文字いずれか（この例では 0 から 9）にマッチします。
アスタリスクを 2 つ用いると、階層化したディレクトリにマッチします。
例えば `a/**/z` は `a/z`、`a/b/z`、`a/b/c/z` のいずれにもマッチします。
@z

@x
Here is another example `.gitignore` file:
@y
//////////////////////////
Here is another example `.gitignore` file:
//////////////////////////
`.gitignore` ファイルのもう 1 つの例です。
@z

@x
[source]
----
# ignore all .a files
*.a
@y
//////////////////////////
[source]
----
# ignore all .a files
*.a
//////////////////////////
[source]
----
# # .a ファイルすべてを無視する
*.a
@z

@x
# but do track lib.a, even though you're ignoring .a files above
!lib.a
@y
# 上で .a ファイルを無視するが、lib.a は無視しない
!lib.a
@z

@x
# only ignore the TODO file in the current directory, not subdir/TODO
/TODO
@y
# カレントディレクトリの TODO ファイルのみ無視、subdir/TODO は無視しない
/TODO
@z

@x
# ignore all files in any directory named build
build/
@y
# build ディレクトリ内をすべて無視する
build/
@z

@x
# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt
@y
# doc/notes.txt は無視、doc/server/arch.txt は無視しない
doc/*.txt
@z

@x
# ignore all .pdf files in the doc/ directory and any of its subdirectories
doc/**/*.pdf
----
@y
# doc/ ディレクトリとそのサブディレクトリにある *.pdf ファイルをすべて無視
doc/**/*.pdf
----
@z

@x
[TIP]
====
GitHub maintains a fairly comprehensive list of good `.gitignore` file examples for dozens of projects and languages at https://github.com/github/gitignore[] if you want a starting point for your project.
====
@y
//////////////////////////
[TIP]
====
GitHub maintains a fairly comprehensive list of good `.gitignore` file examples for dozens of projects and languages at https://github.com/github/gitignore[] if you want a starting point for your project.
====
//////////////////////////
[TIP]
====
GitHub では各種のプロジェクト向け、あるいはプログラミング言語向けに実に多くの `.gitignore` の例を提供していて、非常にわかりやすいものになっています。 
https://github.com/github/gitignore[] から入手できるので、プロジェクトを開始するにあたっての参考にしてください。
====
@z

@x
[NOTE]
====
In the simple case, a repository might have a single `.gitignore` file in its root directory, which applies recursively to the entire repository.
However, it is also possible to have additional `.gitignore` files in subdirectories.
The rules in these nested `.gitignore` files apply only to the files under the directory where they are located.
The Linux kernel source repository has 206 `.gitignore` files.
@y
//////////////////////////
[NOTE]
====
In the simple case, a repository might have a single `.gitignore` file in its root directory, which applies recursively to the entire repository.
However, it is also possible to have additional `.gitignore` files in subdirectories.
The rules in these nested `.gitignore` files apply only to the files under the directory where they are located.
The Linux kernel source repository has 206 `.gitignore` files.
//////////////////////////
[NOTE]
====
この単純な例では、1 つのリポジトリに対して 1 つの `.gitignore` ファイルがルートディレクトリにあるものとして説明しました。
この設定は、サブディレクトリにわたって再帰的に適用されます。
一方、サブディレクトリに追加の `.gitignore` ファイルを置くこともできます。
追加された `.gitignore` ファイルの内容は、これが存在するディレクトリのみに適用されます。
ちなみに Linux カーネルのソースリポジトリには合計 206 個の `.gitignore` ファイルがあります。
@z

@x
It is beyond the scope of this book to get into the details of multiple `.gitignore` files; see `man gitignore` for the details.
====
@y
//////////////////////////
It is beyond the scope of this book to get into the details of multiple `.gitignore` files; see `man gitignore` for the details.
//////////////////////////
複数の `.gitignore` ファイルの利用に関して説明するのは、本書の範囲を超えています。
詳しくは `man gitignore` を参照してください。
====
@z

@x
[[_git_diff_staged]]
@y
[[_git_diff_staged]]
@z

@x
==== Viewing Your Staged and Unstaged Changes
@y
//////////////////////////
==== Viewing Your Staged and Unstaged Changes
//////////////////////////
==== 修正後のステージ状態の確認
@z

@x
If the `git status` command is too vague for you -- you want to know exactly what you changed, not just which files were changed -- you can use the `git diff` command.(((git commands, diff)))
We'll cover `git diff` in more detail later, but you'll probably use it most often to answer these two questions: What have you changed but not yet staged?
And what have you staged that you are about to commit?
Although `git status` answers those questions very generally by listing the file names, `git diff` shows you the exact lines added and removed -- the patch, as it were.
@y
//////////////////////////
If the `git status` command is too vague for you -- you want to know exactly what you changed, not just which files were changed -- you can use the `git diff` command.(((git commands, diff)))
We'll cover `git diff` in more detail later, but you'll probably use it most often to answer these two questions: What have you changed but not yet staged?
And what have you staged that you are about to commit?
Although `git status` answers those questions very generally by listing the file names, `git diff` shows you the exact lines added and removed -- the patch, as it were.
//////////////////////////
`git status` だけではよくわからない場合、つまり変更したファイルを確認するのではなく、変更したファイルの変更箇所を確認したい、というときには `git diff` コマンドを使います。
(((git commands, diff)))
`git diff` については後に詳しく説明します。
このコマンドは、これからよく利用するものになると思いますが、これを使えば以下の 2 つの状況を確認できます。
1 つは、修正された状態であってステージされた状態でないものは何か、ということ。
もう 1 つは、ステージされた状態であって、これからコミットしようとしているものは何か、ということです。
`git status` でも、ファイル名の一覧からその状況はだいたいわかります。
しかし `git diff` を使えば、追加したり削除したりした行はすべて明らかになります。
まさにパッチそのものです。
@z

@x
Let's say you edit and stage the `README` file again and then edit the `CONTRIBUTING.md` file without staging it.
If you run your `git status` command, you once again see something like this:
@y
//////////////////////////
Let's say you edit and stage the `README` file again and then edit the `CONTRIBUTING.md` file without staging it.
If you run your `git status` command, you once again see something like this:
//////////////////////////
ここでもう一度 `README` ファイルを編集してステージ状態にしておきます。
さらに `CONTRIBUTING.md` ファイルを編集し、ステージされていない状態とします。
`git status` を実行すると、再び以下のような出力となります。
@z

@x
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md
----
@y
//////////////////////////
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md
----
//////////////////////////
[source,端末]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    modified:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   CONTRIBUTING.md
----
@z

@x
To see what you've changed but not yet staged, type `git diff` with no other arguments:
@y
//////////////////////////
To see what you've changed but not yet staged, type `git diff` with no other arguments:
//////////////////////////
何が修正され、何がステージされていないかを見てみます。
引数を与えずに `git diff` を実行します。
@z

@x
[source,console]
----
$ git diff
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 8ebb991..643e24f 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -65,7 +65,8 @@ branch directly, things can get messy.
 Please include a nice description of your changes when you submit your PR;
 if we have to read the whole diff to figure out why you're contributing
 in the first place, you're less likely to get feedback and have your change
-merged in.
+merged in. Also, split your changes into comprehensive chunks if your patch is
+longer than a dozen lines.
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git diff
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 8ebb991..643e24f 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -65,7 +65,8 @@ branch directly, things can get messy.
 Please include a nice description of your changes when you submit your PR;
 if we have to read the whole diff to figure out why you're contributing
 in the first place, you're less likely to get feedback and have your change
-merged in.
+merged in. Also, split your changes into comprehensive chunks if your patch is
+longer than a dozen lines.
@z

@x
 If you are starting to work on a particular area, feel free to submit a PR
 that highlights your work in progress (and note in the PR title that it's
----
@y
 If you are starting to work on a particular area, feel free to submit a PR
 that highlights your work in progress (and note in the PR title that it's
----
@z

@x
That command compares what is in your working directory with what is in your staging area.
The result tells you the changes you've made that you haven't yet staged.
@y
//////////////////////////
That command compares what is in your working directory with what is in your staging area.
The result tells you the changes you've made that you haven't yet staged.
//////////////////////////
このコマンドは、ワーキングディレクトリにある内容とステージングエリアにある内容を比較しています。
この結果から、編集をかけていてステージされていない内容がわかります。
@z

@x
If you want to see what you've staged that will go into your next commit, you can use `git diff --staged`.
This command compares your staged changes to your last commit:
@y
//////////////////////////
If you want to see what you've staged that will go into your next commit, you can use `git diff --staged`.
This command compares your staged changes to your last commit:
//////////////////////////
ステージされている状態、つまり次のコミット予定となる内容を確認するには `git diff --staged` を実行します。
このコマンドは、ステージされている変更内容と、最新コミットの内容とを比較しています。
@z

@x
[source,console]
----
$ git diff --staged
diff --git a/README b/README
new file mode 100644
index 0000000..03902a1
--- /dev/null
+++ b/README
@@ -0,0 +1 @@
+My Project
----
@y
//////////////////////////
[source,console]
----
$ git diff --staged
diff --git a/README b/README
new file mode 100644
index 0000000..03902a1
--- /dev/null
+++ b/README
@@ -0,0 +1 @@
+My Project
----
//////////////////////////
[source,端末]
----
$ git diff --staged
diff --git a/README b/README
new file mode 100644
index 0000000..03902a1
--- /dev/null
+++ b/README
@@ -0,0 +1 @@
+My Project
----
@z

@x
It's important to note that `git diff` by itself doesn't show all changes made since your last commit -- only changes that are still unstaged.
If you've staged all of your changes, `git diff` will give you no output.
@y
//////////////////////////
It's important to note that `git diff` by itself doesn't show all changes made since your last commit -- only changes that are still unstaged.
If you've staged all of your changes, `git diff` will give you no output.
//////////////////////////
ここで重要なことを示しておきますが、`git diff` だけでは、最後のコミット以降に加えられた変更はすべて表示されません。
あくまでステージされていない変更のみです。
変更された内容をすべてステージされた状態にしていた場合、`git diff` では何も出力されません。
@z

@x
For another example, if you stage the `CONTRIBUTING.md` file and then edit it, you can use `git diff` to see the changes in the file that are staged and the changes that are unstaged.
If our environment looks like this:
@y
//////////////////////////
For another example, if you stage the `CONTRIBUTING.md` file and then edit it, you can use `git diff` to see the changes in the file that are staged and the changes that are unstaged.
If our environment looks like this:
//////////////////////////
もう 1 つの例です。
`CONTRIBUTING.md` ファイルをステージされた状態にした上でさらに編集しているとします。
`git diff` を実行すれば、このファイルに加えられている修正のうち、ステージされている内容と、ステージされていない内容を見ることができるはずです。
まずはそういった状況を以下により確認します。
@z

@x
[source,console]
----
$ git add CONTRIBUTING.md
$ echo '# test line' >> CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@y
//////////////////////////
[source,console]
----
$ git add CONTRIBUTING.md
$ echo '# test line' >> CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
//////////////////////////
[source,端末]
----
$ git add CONTRIBUTING.md
$ echo '# test line' >> CONTRIBUTING.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
@z

@x
    modified:   CONTRIBUTING.md
@y
    modified:   CONTRIBUTING.md
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
Now you can use `git diff` to see what is still unstaged:
@y
//////////////////////////
Now you can use `git diff` to see what is still unstaged:
//////////////////////////
`git diff` を実行すれば、何がステージされていない状態にあるかがわかります。
@z

@x
[source,console]
----
$ git diff
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 643e24f..87f08c8 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -119,3 +119,4 @@ at the
 ## Starter Projects
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git diff
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 643e24f..87f08c8 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -119,3 +119,4 @@ at the
 ## Starter Projects
@z

@x
 See our [projects list](https://github.com/libgit2/libgit2/blob/development/PROJECTS.md).
+# test line
----
@y
 See our [projects list](https://github.com/libgit2/libgit2/blob/development/PROJECTS.md).
+# test line
----
@z

@x
and `git diff --cached` to see what you've staged so far (`--staged` and `--cached` are synonyms):
@y
//////////////////////////
and `git diff --cached` to see what you've staged so far (`--staged` and `--cached` are synonyms):
//////////////////////////
さらに `git diff --cached` を実行すると、この時点までにステージ状態としている内容を見ることができます。
（`--staged` と `--cached` は同じことです。）
@z

@x
[source,console]
----
$ git diff --cached
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 8ebb991..643e24f 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -65,7 +65,8 @@ branch directly, things can get messy.
 Please include a nice description of your changes when you submit your PR;
 if we have to read the whole diff to figure out why you're contributing
 in the first place, you're less likely to get feedback and have your change
-merged in.
+merged in. Also, split your changes into comprehensive chunks if your patch is
+longer than a dozen lines.
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git diff --cached
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 8ebb991..643e24f 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -65,7 +65,8 @@ branch directly, things can get messy.
 Please include a nice description of your changes when you submit your PR;
 if we have to read the whole diff to figure out why you're contributing
 in the first place, you're less likely to get feedback and have your change
-merged in.
+merged in. Also, split your changes into comprehensive chunks if your patch is
+longer than a dozen lines.
@z

@x
 If you are starting to work on a particular area, feel free to submit a PR
 that highlights your work in progress (and note in the PR title that it's
----
@y
 If you are starting to work on a particular area, feel free to submit a PR
 that highlights your work in progress (and note in the PR title that it's
----
@z

@x
[NOTE]
.Git Diff in an External Tool
====
We will continue to use the `git diff` command in various ways throughout the rest of the book.
There is another way to look at these diffs if you prefer a graphical or external diff viewing program instead.
If you run `git difftool` instead of `git diff`, you can view any of these diffs in software like emerge, vimdiff and many more (including commercial products).
Run `git difftool --tool-help` to see what is available on your system.
====
@y
//////////////////////////
[NOTE]
.Git Diff in an External Tool
====
We will continue to use the `git diff` command in various ways throughout the rest of the book.
There is another way to look at these diffs if you prefer a graphical or external diff viewing program instead.
If you run `git difftool` instead of `git diff`, you can view any of these diffs in software like emerge, vimdiff and many more (including commercial products).
Run `git difftool --tool-help` to see what is available on your system.
====
//////////////////////////
[NOTE]
.Git Diff の外部プログラム
====
これ以降も `git diff` コマンドをさまざまに利用していきますが、こういった変更の差異を見るものとして、グラフィカルインターフェースによるものや、外部コマンドとして差異を表示するプログラムもあります。
`git diff` ではなく `git difftool` を実行すると、そういったプログラム、たとえば emerge、vimdiff、あるいは商用ソフトウェアを通じて、変更の差異を確認することができます。
`git difftool --tool-help` と入力すると、利用可能なプログラムの一覧が表示されます。
====
@z

@x
[[_committing_changes]]
@y
[[_committing_changes]]
@z

@x
==== Committing Your Changes
@y
//////////////////////////
==== Committing Your Changes
//////////////////////////
==== 変更に対するコミット
@z

@x
Now that your staging area is set up the way you want it, you can commit your changes.
Remember that anything that is still unstaged -- any files you have created or modified that you haven't run `git add` on since you edited them -- won't go into this commit.
They will stay as modified files on your disk.
In this case, let's say that the last time you ran `git status`, you saw that everything was staged, so you're ready to commit your changes.(((git commands, status)))
The simplest way to commit is to type `git commit`:(((git commands, commit)))
@y
//////////////////////////
Now that your staging area is set up the way you want it, you can commit your changes.
Remember that anything that is still unstaged -- any files you have created or modified that you haven't run `git add` on since you edited them -- won't go into this commit.
They will stay as modified files on your disk.
In this case, let's say that the last time you ran `git status`, you saw that everything was staged, so you're ready to commit your changes.(((git commands, status)))
The simplest way to commit is to type `git commit`:(((git commands, commit)))
//////////////////////////
ここまでにステージングエリアへの追加が思いどおりにできたら、次は変更をコミットします。
なおステージされていない状態のものというと、新規生成したり修正したりしただけで、編集以後に `git add` を実行していないファイルなので、コミット対象にはなりません。
そのようなファイルは、修正された状態のまま残ります。例として直前に `git status` を実行して、ファイルがすべてステージされた状態であったとします。
ここでコミットを行って変更を確定します。
(((git commands, status)))
コミットを行う最も簡単な方法は `git commit` です。
(((git commands, commit)))
@z

@x
[source,console]
----
$ git commit
----
@y
//////////////////////////
[source,console]
----
$ git commit
----
//////////////////////////
[source,端末]
----
$ git commit
----
@z

@x
Doing so launches your editor of choice.
@y
//////////////////////////
Doing so launches your editor of choice.
//////////////////////////
このコマンドを実行すると、指定したエディターが起動します。
@z

@x
[NOTE]
====
This is set by your shell's `EDITOR` environment variable -- usually vim or emacs, although you can configure it with whatever you want using the `git config --global core.editor` command as you saw in <<ch01-getting-started#ch01-getting-started>>.(((editor, changing default)))(((git commands, config)))
====
@y
//////////////////////////
[NOTE]
====
This is set by your shell's `EDITOR` environment variable -- usually vim or emacs, although you can configure it with whatever you want using the `git config --global core.editor` command as you saw in <<ch01-getting-started#ch01-getting-started>>.(((editor, changing default)))(((git commands, config)))
====
//////////////////////////
[NOTE]
====
エディターはシェル上の環境変数 `EDITOR` によって設定されるもので、vim や emacs などが指定されます。
<<ch01-getting-started#ch01-getting-started>> の章に示したように、`git config --global core.editor` コマンドを使って、エディター指定を行うこともできます。
(((editor, changing default)))(((git commands, config)))
====
@z

@x
The editor displays the following text (this example is a Vim screen):
@y
//////////////////////////
The editor displays the following text (this example is a Vim screen):
//////////////////////////
エディターが起動すると以下のようなメッセージが画面に表示されます。
（以下の例は Vim の場合です。）
@z

@x
[source]
----
@y
//////////////////////////
//////////////////////////
[source]
----
@z

@x
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is up-to-date with 'origin/master'.
#
# Changes to be committed:
#	new file:   README
#	modified:   CONTRIBUTING.md
#
~
~
~
".git/COMMIT_EDITMSG" 9L, 283C
----
@y
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is up-to-date with 'origin/master'.
#
# Changes to be committed:
#	new file:   README
#	modified:   CONTRIBUTING.md
#
~
~
~
".git/COMMIT_EDITMSG" 9L, 283C
----
@z

@x
You can see that the default commit message contains the latest output of the `git status` command commented out and one empty line on top.
You can remove these comments and type your commit message, or you can leave them there to help you remember what you're committing.
@y
//////////////////////////
You can see that the default commit message contains the latest output of the `git status` command commented out and one empty line on top.
You can remove these comments and type your commit message, or you can leave them there to help you remember what you're committing.
//////////////////////////
上のように表示されたデフォルトのコミットメッセージには、最新の `git status` コマンドの出力結果がコメントになって示されています。
さらに 1 行めが空行となっています。
そこでこのコメントを削除してコミットメッセージを新たに入力します。
あるいは何をコミットしたのかを忘れないように、このコメントを残しておいてもかまいません。
@z

@x
[NOTE]
====
For an even more explicit reminder of what you've modified, you can pass the `-v` option to `git commit`.
Doing so also puts the diff of your change in the editor so you can see exactly what changes you're committing.
====
@y
//////////////////////////
[NOTE]
====
For an even more explicit reminder of what you've modified, you can pass the `-v` option to `git commit`.
Doing so also puts the diff of your change in the editor so you can see exactly what changes you're committing.
====
//////////////////////////
[NOTE]
====
さらにもっと細かく情報を残しておきたいと思ったら、`git commit` コマンドに `-v` オプションをつけます。
これをつけると、エディター画面上に、変更内容の diff の結果も表示されるので、コミット時の変更内容の詳細を見ることができます。
====
@z

@x
When you exit the editor, Git creates your commit with that commit message (with the comments and diff stripped out).
@y
//////////////////////////
When you exit the editor, Git creates your commit with that commit message (with the comments and diff stripped out).
//////////////////////////
エディターを終了すると、編集したコミットメッセージをつけてコミットを完了します。
（コメントや diff の出力結果は取り除かれます。）
@z

@x
Alternatively, you can type your commit message inline with the `commit` command by specifying it after a `-m` flag, like this:
@y
//////////////////////////
Alternatively, you can type your commit message inline with the `commit` command by specifying it after a `-m` flag, like this:
//////////////////////////
または、インラインによりコミットメッセージを指定することもできます。
この場合は `commit` コマンドに `-m` フラグをつけてコメントを指定します。
@z

@x
[source,console]
----
$ git commit -m "Story 182: fix benchmarks for speed"
[master 463dc4f] Story 182: fix benchmarks for speed
 2 files changed, 2 insertions(+)
 create mode 100644 README
----
@y
//////////////////////////
[source,console]
----
$ git commit -m "Story 182: fix benchmarks for speed"
[master 463dc4f] Story 182: fix benchmarks for speed
 2 files changed, 2 insertions(+)
 create mode 100644 README
----
//////////////////////////
[source,端末]
----
$ git commit -m "Story 182: fix benchmarks for speed"
[master 463dc4f] Story 182: fix benchmarks for speed
 2 files changed, 2 insertions(+)
 create mode 100644 README
----
@z

@x
Now you've created your first commit!
You can see that the commit has given you some output about itself: which branch you committed to (`master`), what SHA-1 checksum the commit has (`463dc4f`), how many files were changed, and statistics about lines added and removed in the commit.
@y
//////////////////////////
Now you've created your first commit!
You can see that the commit has given you some output about itself: which branch you committed to (`master`), what SHA-1 checksum the commit has (`463dc4f`), how many files were changed, and statistics about lines added and removed in the commit.
//////////////////////////
こうして初めてのコミットが完了しました。
コミットの結果として情報が表示されています。
どのブランチに対してコミットを行ったか（例では `master`）、コミットには何という SHA-1 値が使われたか（`463dc4f`）、変更ファイル数、追加行数、削除行数、といった情報です。
@z

@x
Remember that the commit records the snapshot you set up in your staging area.
Anything you didn't stage is still sitting there modified; you can do another commit to add it to your history.
Every time you perform a commit, you're recording a snapshot of your project that you can revert to or compare to later.
@y
//////////////////////////
Remember that the commit records the snapshot you set up in your staging area.
Anything you didn't stage is still sitting there modified; you can do another commit to add it to your history.
Every time you perform a commit, you're recording a snapshot of your project that you can revert to or compare to later.
//////////////////////////
コミットというのは、ステージングエリアに置かれたスナップショットを記録するものでした。
ですからステージされていない状態のものは、修正されたまま残ります。
これを履歴に適用するには、もう一度コミットします。
コミットを行うたびに、プロジェクトのスナップショットが保存されることになります。
保存されているところからは、元に戻したり、それ以後のものと比較したりすることができます。
@z

@x
==== Skipping the Staging Area
@y
//////////////////////////
==== Skipping the Staging Area
//////////////////////////
==== ステージングエリアの省略
@z

@x
(((staging area, skipping)))
@y
(((staging area, skipping)))
@z

@x
Although it can be amazingly useful for crafting commits exactly how you want them, the staging area is sometimes a bit more complex than you need in your workflow.
If you want to skip the staging area, Git provides a simple shortcut.
Adding the `-a` option to the `git commit` command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part:
@y
//////////////////////////
Although it can be amazingly useful for crafting commits exactly how you want them, the staging area is sometimes a bit more complex than you need in your workflow.
If you want to skip the staging area, Git provides a simple shortcut.
Adding the `-a` option to the `git commit` command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part:
//////////////////////////
コミットする内容を思いどおりに作り上げていけるという点では、ステージングエリアというものは非常に使い勝手のよいものです。
しかしいろいろな作業を進めていく中では、少々面倒な作業になることもあるでしょう。
実はステージングエリアの利用は省略することができます。
Git には単純なショートカットが用意されていて、`git commit` コマンドに `-a` オプションをつけます。
これをつけると、追跡された状態のファイルであれば、自動的にステージ状態とした上でコミットを行います。
`git add` を行う操作は省略できます。
@z

@x
[source,console]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
@z

@x
    modified:   CONTRIBUTING.md
@y
    modified:   CONTRIBUTING.md
@z

@x
no changes added to commit (use "git add" and/or "git commit -a")
$ git commit -a -m 'Add new benchmarks'
[master 83e38c7] Add new benchmarks
 1 file changed, 5 insertions(+), 0 deletions(-)
----
@y
no changes added to commit (use "git add" and/or "git commit -a")
$ git commit -a -m 'Add new benchmarks'
[master 83e38c7] Add new benchmarks
 1 file changed, 5 insertions(+), 0 deletions(-)
----
@z

@x
Notice how you don't have to run `git add` on the `CONTRIBUTING.md` file in this case before you commit.
That's because the `-a` flag includes all changed files.
This is convenient, but be careful; sometimes this flag will cause you to include unwanted changes.
@y
//////////////////////////
Notice how you don't have to run `git add` on the `CONTRIBUTING.md` file in this case before you commit.
That's because the `-a` flag includes all changed files.
This is convenient, but be careful; sometimes this flag will cause you to include unwanted changes.
//////////////////////////
この例において `CONTRIBUTING.md` ファイルは `git add` コマンドを実行しなくてもコミットができたということです。
`-a` オプションは、修正されたファイルはすべて処理対象にするためです。
便利な方法ではありますが、`-a` オプションを使うと意図していない修正ファイルまでコミットしてしまうことも起きますから、十分注意してください。
@z

@x
[[_removing_files]]
@y
[[_removing_files]]
@z

@x
==== Removing Files
@y
//////////////////////////
==== Removing Files
//////////////////////////
==== ファイルの削除
@z

@x
(((files, removing)))
@y
(((files, removing)))
@z

@x
To remove a file from Git, you have to remove it from your tracked files (more accurately, remove it from your staging area) and then commit.
The `git rm` command does that, and also removes the file from your working directory so you don't see it as an untracked file the next time around.
@y
//////////////////////////
To remove a file from Git, you have to remove it from your tracked files (more accurately, remove it from your staging area) and then commit.
The `git rm` command does that, and also removes the file from your working directory so you don't see it as an untracked file the next time around.
//////////////////////////
Git 上にてファイルを削除するには、追跡されている状態を解除する必要があります。
（正確にはステージングエリアから削除します。）
そしてその後にコミットします。
`git rm` が Git 上でのファイル削除を行ってくれます。
そしてさらにワーキングディレクトリから、そのファイルを実際に削除します。
これ以降、このファイルは未追跡ファイルにさえ登場しなくなります。
@z

@x
If you simply remove the file from your working directory, it shows up under the "`Changes not staged for commit`" (that is, _unstaged_) area of your `git status` output:
@y
//////////////////////////
If you simply remove the file from your working directory, it shows up under the "`Changes not staged for commit`" (that is, _unstaged_) area of your `git status` output:
//////////////////////////
ワーキングディレクトリからファイルを単に削除しただけの場合は、`git status` の出力において "`Changes not staged for commit`"（つまり**ステージされていない**状態）の項目として表示されます。
@z

@x
[source,console]
----
$ rm PROJECTS.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    PROJECTS.md

no changes added to commit (use "git add" and/or "git commit -a")
----
@y
//////////////////////////
[source,console]
----
$ rm PROJECTS.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    PROJECTS.md

no changes added to commit (use "git add" and/or "git commit -a")
----
//////////////////////////
[source,端末]
----
$ rm PROJECTS.md
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

no changes added to commit (use "git add" and/or "git commit -a")
----
@z

@x
Then, if you run `git rm`, it stages the file's removal:
@y
//////////////////////////
Then, if you run `git rm`, it stages the file's removal:
//////////////////////////
続けて `git rm` を実行すると、ファイルが削除されたステージ状態となります。
@z

@x
[source,console]
----
$ git rm PROJECTS.md
rm 'PROJECTS.md'
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    PROJECTS.md
----
@y
//////////////////////////
[source,console]
----
$ git rm PROJECTS.md
rm 'PROJECTS.md'
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    PROJECTS.md
----
//////////////////////////
[source,端末]
----
$ git rm PROJECTS.md
rm 'PROJECTS.md'
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    PROJECTS.md
----
@z

@x
The next time you commit, the file will be gone and no longer tracked.
If you modified the file or had already added it to the staging area, you must force the removal with the `-f` option.
This is a safety feature to prevent accidental removal of data that hasn't yet been recorded in a snapshot and that can't be recovered from Git.
@y
//////////////////////////
The next time you commit, the file will be gone and no longer tracked.
If you modified the file or had already added it to the staging area, you must force the removal with the `-f` option.
This is a safety feature to prevent accidental removal of data that hasn't yet been recorded in a snapshot and that can't be recovered from Git.
//////////////////////////
次にコミットを行うと、ファイルは完全に削除され追跡対象外になります。
ファイルを修正しステージングエリアにすでに置いていた場合は、`-f` オプションをつけて強制的に削除する必要があります。
このオプションは誤操作をしないためにあります。
スナップショットにまだ記録されていないデータや、Git が復旧できないデータを誤って削除しないようにするためです。
@z

@x
Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area.
In other words, you may want to keep the file on your hard drive but not have Git track it anymore.
This is particularly useful if you forgot to add something to your `.gitignore` file and accidentally staged it, like a large log file or a bunch of `.a` compiled files.
To do this, use the `--cached` option:
@y
//////////////////////////
Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area.
In other words, you may want to keep the file on your hard drive but not have Git track it anymore.
This is particularly useful if you forgot to add something to your `.gitignore` file and accidentally staged it, like a large log file or a bunch of `.a` compiled files.
To do this, use the `--cached` option:
//////////////////////////
さらにもう 1 つ必要になってくるのが、ワーキングツリー内にファイルを持ちつつ、ステージングエリアからは削除しないという操作です。
いいかえると、ファイルは存在していて欲しいが Git にはもう管理して欲しくないという状況です。
これが必要になるのは、`.gitignore` ファイルに加えることを忘れていたために、間違ってステージされてしまったファイルを戻すときなどです。
大量のログファイルや、コンパイル結果として生成された `.a` ファイルなどがこれにあたります。
こういった際には `--cached` オプションを使います。
@z

@x
[source,console]
----
$ git rm --cached README
----
@y
//////////////////////////
[source,console]
----
$ git rm --cached README
----
//////////////////////////
[source,端末]
----
$ git rm --cached README
----
@z

@x
You can pass files, directories, and file-glob patterns to the `git rm` command.
That means you can do things such as:
@y
//////////////////////////
You can pass files, directories, and file-glob patterns to the `git rm` command.
That means you can do things such as:
//////////////////////////
`git rm` コマンドに指定する引数は、ファイル、ディレクトリの他にも、ファイルを表わす glob パターンを指定することができます。
たとえば以下のようなことが可能です。
@z

@x
[source,console]
----
$ git rm log/\*.log
----
@y
//////////////////////////
[source,console]
----
$ git rm log/\*.log
----
//////////////////////////
[source,端末]
----
$ git rm log/\*.log
----
@z

@x
Note the backslash (`\`) in front of the `*`.
This is necessary because Git does its own filename expansion in addition to your shell's filename expansion.
This command removes all files that have the `.log` extension in the `log/` directory.
Or, you can do something like this:
@y
//////////////////////////
Note the backslash (`\`) in front of the `*`.
This is necessary because Git does its own filename expansion in addition to your shell's filename expansion.
This command removes all files that have the `.log` extension in the `log/` directory.
Or, you can do something like this:
//////////////////////////
アスタリスク（`*`）の前にバックスラッシュ（`\`）を記述しています。
これが必要になるのは、シェルによるファイル展開に加えて、Git も独自のファイル展開を行うためです。
このコマンド実行では、`log/` ディレクトリにある、拡張子 `.log` のファイルがすべて削除されます。
以下のようなこともできます。
@z

@x
[source,console]
----
$ git rm \*~
----
@y
//////////////////////////
[source,console]
----
$ git rm \*~
----
//////////////////////////
[source,端末]
----
$ git rm \*~
----
@z

@x
This command removes all files whose names end with a `~`.
@y
//////////////////////////
This command removes all files whose names end with a `~`.
//////////////////////////
このコマンドの場合は、ファイル名が `~` で終わるファイルをすべて削除します。
@z

@x
[[_git_mv]]
@y
[[_git_mv]]
@z

@x
==== Moving Files
@y
//////////////////////////
==== Moving Files
//////////////////////////
==== ファイルの移動
@z

@x
(((files, moving)))
@y
(((files, moving)))
@z

@x
Unlike many other VCS systems, Git doesn't explicitly track file movement.
If you rename a file in Git, no metadata is stored in Git that tells it you renamed the file.
However, Git is pretty smart about figuring that out after the fact -- we'll deal with detecting file movement a bit later.
@y
//////////////////////////
Unlike many other VCS systems, Git doesn't explicitly track file movement.
If you rename a file in Git, no metadata is stored in Git that tells it you renamed the file.
However, Git is pretty smart about figuring that out after the fact -- we'll deal with detecting file movement a bit later.
//////////////////////////
VCS の多くが行う方法と違って Git はファイル移動を追跡しません。
したがってファイル名を変更しても、ファイル名が変更されたことを示すメタデータは Git 内に保存されません。
ただし Git は優れていて、実際の状況からファイル移動を識別することができます。
このファイル移動に関しては、後に説明します。
@z

@x
Thus it's a bit confusing that Git has a `mv` command.
If you want to rename a file in Git, you can run something like:
@y
//////////////////////////
Thus it's a bit confusing that Git has a `mv` command.
If you want to rename a file in Git, you can run something like:
//////////////////////////
なお多少混乱するかもしれませんが、Git には `mv` コマンドがあります。
ファイル名を変更したい場合、以下のようなコマンド実行が可能です。
@z

@x
[source,console]
----
$ git mv file_from file_to
----
@y
//////////////////////////
[source,console]
----
$ git mv file_from file_to
----
//////////////////////////
[source,端末]
----
$ git mv file_from file_to
----
@z

@x
and it works fine.
In fact, if you run something like this and look at the status, you'll see that Git considers it a renamed file:
@y
//////////////////////////
and it works fine.
In fact, if you run something like this and look at the status, you'll see that Git considers it a renamed file:
//////////////////////////
コマンドは普通に実行されます。
実際にこれを実行してステータスを確認してみると、Git がファイル名を変更しているように見えます。
@z

@x
[source,console]
----
$ git mv README.md README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    README.md -> README
----
@y
//////////////////////////
[source,console]
----
$ git mv README.md README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    README.md -> README
----
//////////////////////////
[source,端末]
----
$ git mv README.md README
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    README.md -> README
----
@z

@x
However, this is equivalent to running something like this:
@y
//////////////////////////
However, this is equivalent to running something like this:
//////////////////////////
しかしこの結果は、以下を実行しているのと同じです。
@z

@x
[source,console]
----
$ mv README.md README
$ git rm README.md
$ git add README
----
@y
//////////////////////////
[source,console]
----
$ mv README.md README
$ git rm README.md
$ git add README
----
//////////////////////////
[source,端末]
----
$ mv README.md README
$ git rm README.md
$ git add README
----
@z

@x
Git figures out that it's a rename implicitly, so it doesn't matter if you rename a file that way or with the `mv` command.
The only real difference is that `git mv` is one command instead of three -- it's a convenience function.
More importantly, you can use any tool you like to rename a file, and address the add/rm later, before you commit.
@y
//////////////////////////
Git figures out that it's a rename implicitly, so it doesn't matter if you rename a file that way or with the `mv` command.
The only real difference is that `git mv` is one command instead of three -- it's a convenience function.
More importantly, you can use any tool you like to rename a file, and address the add/rm later, before you commit.
//////////////////////////
Git は、ファイル名の変更が行われたと、なんとなくわかるだけです。
したがって上の方法と `mv` を使う方法のどちらにしたところで、そこは問題ではありません。
両者の違いは、3 つのコマンドを使っているところを、`git mv` では 1 つのコマンドで済む、というだけのことです。
つまり `git mv` は便利な機能でしかありません。
それよりも大切なことは、ファイル名の変更はどのコマンドを使ってもよいので、その後には add コマンドや rm コマンドを実行して、最後にはコミットを行う必要があるということです。
@z
