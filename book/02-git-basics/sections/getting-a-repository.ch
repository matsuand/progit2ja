%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_getting_a_repo]]
=== Getting a Git Repository
@y
[[_getting_a_repo]]
=== Git リポジトリの作成
@z

@x
You typically obtain a Git repository in one of two ways:
@y
Git リポジトリを作り出すには、以下の 2 つの方法があります。 
@z

@x
1. You can take a local directory that is currently not under version control, and turn it into a Git repository, or
2. You can _clone_ an existing Git repository from elsewhere.
@y
1. まだバージョン管理を行っていないローカルディレクトリを Git に取り入れます。または
2. 別のサーバーにある Git リポジトリの**クローン**を取得します。
@z

@x
In either case, you end up with a Git repository on your local machine, ready for work.
@y
どちらの場合でもローカルマシン上に Git リポジトリができあがって、すぐに作業を進めることができます。
@z

@x
==== Initializing a Repository in an Existing Directory
@y
==== 既存ディレクトリをリポジトリとして初期化
@z

@x
If you have a project directory that is currently not under version control and you want to start controlling it with Git, you first need to go to that project's directory.
If you've never done this, it looks a little different depending on which system you're running:
@y
まだバージョン管理を行っていないプロジェクトを Git により管理しようとする場合、まずそのプロジェクトのディレクトリに移動します。
初めてこの作業を行うときは、利用するシステムごとに内容が異なりますので注意してください。
@z

@x
for Linux:
[source,console]
----
$ cd /home/user/my_project
----
for macOS:
[source,console]
----
$ cd /Users/user/my_project
----
for Windows:
[source,console]
----
$ cd C:/Users/user/my_project
----
@y
Linux の場合
[source,端末]
----
$ cd /home/user/my_project
----
macOS の場合
[source,端末]
----
$ cd /Users/user/my_project
----
Windows の場合
[source,端末]
----
$ cd C:/Users/user/my_project
----
@z

@x
and type:
@y
続けて以下を入力します。
@z

@x
[source,console]
----
$ git init
----
@y
[source,端末]
----
$ git init
----
@z

@x
This creates a new subdirectory named `.git` that contains all of your necessary repository files -- a Git repository skeleton.
At this point, nothing in your project is tracked yet.
(See <<ch10-git-internals#ch10-git-internals>> for more information about exactly what files are contained in the `.git` directory you just created.)(((git commands, init)))
@y
上のコマンドを実行すると `.git` という新しいサブディレクトリが生成されます。
ここにはリポジトリに必要となるファイルがすべて収められています。
いわばリポジトリのスケルトンです。
この段階では、まだプロジェクトの内容は登録されていません。
（ここで生成された `.git` ディレクトリに具体的にどのようなファイルがあるのか、その詳細は <<ch10-git-internals#ch10-git-internals>> の章を参照してください。
(((git commands, init)))
@z

@x
If you want to start version-controlling existing files (as opposed to an empty directory), you should probably begin tracking those files and do an initial commit.
You can accomplish that with a few `git add` commands that specify the files you want to track, followed by a `git commit`:
@y
すでに管理したいファイルがある場合（ディレクトリ内が空の場合は何もできませんが）、そのファイルをバージョン管理下に置くためには、まず追跡対象とした上で、最初のコミットを行います。
具体的には追跡対象とするファイルを指定して `git add` コマンドを実行します。
その後に `git commit` コマンドを実行します。
@z

@x
[source,console]
----
$ git add *.c
$ git add LICENSE
$ git commit -m 'initial project version'
----
@y
[source,端末]
----
$ git add *.c
$ git add LICENSE
$ git commit -m 'initial project version'
----
@z

@x
We'll go over what these commands do in just a minute.
At this point, you have a Git repository with tracked files and an initial commit.
@y
このコマンドが何を行うかについては、すぐに説明します。
少なくともこの時点において Git リポジトリの中には、追跡対象とするファイルがあり初めてのコミットも行いました。
@z

@x
[[_git_cloning]]
==== Cloning an Existing Repository
@y
[[_git_cloning]]
==== 既存リポジトリのクローン取得
@z

@x
If you want to get a copy of an existing Git repository -- for example, a project you'd like to contribute to -- the command you need is `git clone`.
If you're familiar with other VCS systems such as Subversion, you'll notice that the command is "clone" and not "checkout".
This is an important distinction -- instead of getting just a working copy, Git receives a full copy of nearly all data that the server has.
Every version of every file for the history of the project is pulled down by default when you run `git clone`.
In fact, if your server disk gets corrupted, you can often use nearly any of the clones on any client to set the server back to the state it was in when it was cloned (you may lose some server-side hooks and such, but all the versioned data would be there -- see <<ch04-git-on-the-server#_getting_git_on_a_server>> for more details).
@y
たとえば開発に参加したいと思う Git リポジトリをコピーしたいことがあります。
そのように、すでに存在している Git リポジトリをコピーするには `git clone` コマンドを実行します。
Subversion のような VCS を扱ってきていると、コマンドは \"clone\" であって \"checkout\" ではないんだ、と思うでしょう。
これこそが重要な違いです。
Git は単にワーキングコピーを取得するのではありません。
サーバーにあるデータをほぼすべてコピーします。
プロジェクトの履歴に含まれるあらゆるファイル、あらゆるバージョンが、`git clone` の実行によってデフォルトで取り出されます。
ですからサーバーのディスクが壊れてしまったときには、どのクライアントでもいいので、そのクライアント内にあるクローンを使えば、サーバーを元に戻すことができます。
もちろん戻せるのは、クローンが取得された状態までです。
（サーバー側にあったフックなどは失ってしまうかもしれません。
しかしバージョン管理されたデータはすべて元に戻るはずです。
詳しくは <<ch04-git-on-the-server#_getting_git_on_a_server>> を参照してください。）
@z

@x
You clone a repository with `git clone <url>`.(((git commands, clone)))
For example, if you want to clone the Git linkable library called `libgit2`, you can do so like this:
@y
クローンは `git clone <url>` を入力して取得します。
(((git commands, clone)))
たとえば Git のライブラリ `libgit2` のクローンを取得するには、以下のようにします。
@z

@x
[source,console]
----
$ git clone https://github.com/libgit2/libgit2
----
@y
[source,端末]
----
$ git clone https://github.com/libgit2/libgit2
----
@z

@x
That creates a directory named `libgit2`, initializes a `.git` directory inside it, pulls down all the data for that repository, and checks out a working copy of the latest version.
If you go into the new `libgit2` directory that was just created, you'll see the project files in there, ready to be worked on or used.
@y
実行後は `libgit2` というディレクトリが生成され、サブディレクトリ `.git` が初期化されます。
またこのリポジトリ内の全データが取得され、さらに最新バージョンがチェックアウトされてワーキングコピーに置かれます。
`libgit2` ディレクトリ内には、このプロジェクトのファイルがあるので、開発を進めたり利用したりすることがすぐにできます。
@z

@x
If you want to clone the repository into a directory named something other than `libgit2`, you can specify the new directory name as an additional argument:
@y
クローンの取得時に `libgit2` というディレクトリでなく別のディレクトリ名としたい場合は、以下のようにコマンドラインにディレクトリ名を追加します。
@z

@x
[source,console]
----
$ git clone https://github.com/libgit2/libgit2 mylibgit
----
@y
[source,端末]
----
$ git clone https://github.com/libgit2/libgit2 mylibgit
----
@z

@x
That command does the same thing as the previous one, but the target directory is called `mylibgit`.
@y
今実行したコマンドは、その前のものと変わりません。
取得するディレクトリ名を `mylibgit` にするだけです。
@z

@x
Git has a number of different transfer protocols you can use.
The previous example uses the `https://` protocol, but you may also see `git://` or `user@server:path/to/repo.git`, which uses the SSH transfer protocol.
<<ch04-git-on-the-server#_getting_git_on_a_server>> will introduce all of the available options the server can set up to access your Git repository and the pros and cons of each.
@y
Git では転送プロトコルをいろいろと選ぶことができます。
上に示した例では `https://` プロトコルを使いました。
この他に `git://` を使う方法もあります。
また SSH 転送プロトコルを使って `user@server:path/to/repo.git` と指定することもあります。
<<ch04-git-on-the-server#_getting_git_on_a_server>> の章では、Git サーバーにあるリポジトリにアクセスする方法をすべて示し、個々の長所、短所について説明します。
@z
