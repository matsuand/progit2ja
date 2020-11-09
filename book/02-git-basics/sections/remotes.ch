%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_remote_repos]]
@y
[[_remote_repos]]
@z

@x
=== Working with Remotes
@y
//////////////////////////
=== Working with Remotes
//////////////////////////
=== リモートリポジトリの操作
@z

@x
To be able to collaborate on any Git project, you need to know how to manage your remote repositories.
Remote repositories are versions of your project that are hosted on the Internet or network somewhere.
You can have several of them, each of which generally is either read-only or read/write for you.
Collaborating with others involves managing these remote repositories and pushing and pulling data to and from them when you need to share work.
Managing remote repositories includes knowing how to add remote repositories, remove remotes that are no longer valid, manage various remote branches and define them as being tracked or not, and more.
In this section, we'll cover some of these remote-management skills.
@y
//////////////////////////
To be able to collaborate on any Git project, you need to know how to manage your remote repositories.
Remote repositories are versions of your project that are hosted on the Internet or network somewhere.
You can have several of them, each of which generally is either read-only or read/write for you.
Collaborating with others involves managing these remote repositories and pushing and pulling data to and from them when you need to share work.
Managing remote repositories includes knowing how to add remote repositories, remove remotes that are no longer valid, manage various remote branches and define them as being tracked or not, and more.
In this section, we'll cover some of these remote-management skills.
//////////////////////////
他の Git プロジェクトと共同で作業していくためには、リモートリポジトリの操作方法を覚える必要があります。
リモートリポジトリとは、自分のプロジェクトの一部が、インターネット上あるいはネットワーク上のどこか別のところで管理されているものです。
リモートリポジトリは複数持つことが可能です。
リポジトリごとに読み取り専用、読み書き可能という設定を行うことができます。
いろいろなリポジトリを使って共同作業を行うということは、そのリモートリポジトリを管理していくことであり、共同作業の際に必要に応じてデータをプルしたりプッシュしたりすることになります。
そこでリモートリポジトリ管理のために、リポジトリの追加方法を学んでいきます。
もはや実作業に合わないなら削除することもあるでしょう。
リモート上のブランチを管理したり、あるいはそういったものを定義した上で追跡したりしなかったりと、さまざまなことが必要になっていきます。
この節では、そういったリモートリポジトリ管理方法を説明していきます。
@z

@x
[NOTE]
.Remote repositories can be on your local machine.
====
It is entirely possible that you can be working with a "`remote`" repository that is, in fact, on the same host you are.
The word "`remote`" does not necessarily imply that the repository is somewhere else on the network or Internet, only that it is elsewhere.
Working with such a remote repository would still involve all the standard pushing, pulling and fetching operations as with any other remote.
====
@y
//////////////////////////
.Remote repositories can be on your local machine.
====
It is entirely possible that you can be working with a "`remote`" repository that is, in fact, on the same host you are.
The word "`remote`" does not necessarily imply that the repository is somewhere else on the network or Internet, only that it is elsewhere.
Working with such a remote repository would still involve all the standard pushing, pulling and fetching operations as with any other remote.
====
//////////////////////////
[NOTE]
.リモートリポジトリはローカルマシン上にあってもかまわない.
====
リモートリポジトリは、今作業をしているまさに同一のホスト上におくこともできます。
この「リモート」という語は、それがネットワーク上やインターネット上のどこか別の場所にあるという意味ではなく、単に「どこか」という意味しかありません。
このリモートリポジトリはどれに対しても、標準的なプッシュ、プル、フェッチの操作を行っていくことになります。
====
@z

@x
==== Showing Your Remotes
@y
//////////////////////////
//////////////////////////
==== リモートリポジトリの表示
@z

@x
To see which remote servers you have configured, you can run the `git remote` command.(((git commands, remote)))
It lists the shortnames of each remote handle you've specified.
If you've cloned your repository, you should at least see `origin` -- that is the default name Git gives to the server you cloned from:
@y
//////////////////////////
//////////////////////////
リモートリポジトリとして設定したものを確認するには `git remote` コマンドを使います。
(((git commands, remote)))
このコマンドは設定されたリモートハンドルの短縮した名前を一覧表示します。
リポジトリをクローンしている場合は、少なくとも `origin` が一覧に表示されます。
`origin` は、クローンしたサーバーに対して与えられるデフォルト名です。
@z

@x
[source,console]
----
$ git clone https://github.com/schacon/ticgit
Cloning into 'ticgit'...
remote: Reusing existing pack: 1857, done.
remote: Total 1857 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (1857/1857), 374.35 KiB | 268.00 KiB/s, done.
Resolving deltas: 100% (772/772), done.
Checking connectivity... done.
$ cd ticgit
$ git remote
origin
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git clone https://github.com/schacon/ticgit
Cloning into 'ticgit'...
remote: Reusing existing pack: 1857, done.
remote: Total 1857 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (1857/1857), 374.35 KiB | 268.00 KiB/s, done.
Resolving deltas: 100% (772/772), done.
Checking connectivity... done.
$ cd ticgit
$ git remote
origin
----
@z

@x
You can also specify `-v`, which shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote:
@y
//////////////////////////
//////////////////////////
`-v` オプションをつけることもできます。
そのときには、短縮した名前に対応づいて保持されている URL 名が表示されます。
この URL はリモートリポジトリに対しての読み取り、書き込みの際に用いられます。
@z

@x
[source,console]
----
$ git remote -v
origin	https://github.com/schacon/ticgit (fetch)
origin	https://github.com/schacon/ticgit (push)
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote -v
origin	https://github.com/schacon/ticgit (fetch)
origin	https://github.com/schacon/ticgit (push)
----
@z

@x
If you have more than one remote, the command lists them all.
For example, a repository with multiple remotes for working with several collaborators might look something like this.
@y
//////////////////////////
//////////////////////////
複数のリモートを設定している場合は、それらがすべて表示されます。
1 つのリモートリポジトリに複数のリポジトリが含まれていて共同作業を行っている場合は、たとえば以下のように表示されます。
@z

@x
[source,console]
----
$ cd grit
$ git remote -v
bakkdoor  https://github.com/bakkdoor/grit (fetch)
bakkdoor  https://github.com/bakkdoor/grit (push)
cho45     https://github.com/cho45/grit (fetch)
cho45     https://github.com/cho45/grit (push)
defunkt   https://github.com/defunkt/grit (fetch)
defunkt   https://github.com/defunkt/grit (push)
koke      git://github.com/koke/grit.git (fetch)
koke      git://github.com/koke/grit.git (push)
origin    git@github.com:mojombo/grit.git (fetch)
origin    git@github.com:mojombo/grit.git (push)
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ cd grit
$ git remote -v
bakkdoor  https://github.com/bakkdoor/grit (fetch)
bakkdoor  https://github.com/bakkdoor/grit (push)
cho45     https://github.com/cho45/grit (fetch)
cho45     https://github.com/cho45/grit (push)
defunkt   https://github.com/defunkt/grit (fetch)
defunkt   https://github.com/defunkt/grit (push)
koke      git://github.com/koke/grit.git (fetch)
koke      git://github.com/koke/grit.git (push)
origin    git@github.com:mojombo/grit.git (fetch)
origin    git@github.com:mojombo/grit.git (push)
----
@z

@x
This means we can pull contributions from any of these users pretty easily.
We may additionally have permission to push to one or more of these, though we can't tell that here.
@y
//////////////////////////
//////////////////////////
こうなっていると、各ユーザーからのプル操作が極めて容易になります。
また個々のリポジトリに対してのプッシュ権限を持つこともできます。
なおそういった情報は上では示されません。
@z

@x
Notice that these remotes use a variety of protocols; we'll cover more about this in <<ch04-git-on-the-server#_getting_git_on_a_server>>.
@y
//////////////////////////
//////////////////////////
リモートリポジトリには、さまざまなプロトコルが利用されます。
このことについては「<<ch04-git-on-the-server#_getting_git_on_a_server>>」の章において説明します。
@z

@x
==== Adding Remote Repositories
@y
//////////////////////////
//////////////////////////
==== リモートリポジトリの追加
@z

@x
We've mentioned and given some demonstrations of how the `git clone` command implicitly adds the `origin` remote for you.
Here's how to add a new remote explicitly.(((git commands, remote)))
To add a new remote Git repository as a shortname you can reference easily, run `git remote add <shortname> <url>`:
@y
//////////////////////////
//////////////////////////
これまでの利用例において説明してきたことですが、`git clone` コマンドを実行するとリモートリポジトリの `origin` が暗に取得されます。
ここでは明示的に新しいリモートリポジトリを加える方法を示します。
(((git commands, remote)))
新たなリモートリポジトリを加える際には、参照しやすいような短い名前（shortname）をつけて `git remote add <shortname> <url>` を実行します。
@z

@x
[source,console]
----
$ git remote
origin
$ git remote add pb https://github.com/paulboone/ticgit
$ git remote -v
origin	https://github.com/schacon/ticgit (fetch)
origin	https://github.com/schacon/ticgit (push)
pb	https://github.com/paulboone/ticgit (fetch)
pb	https://github.com/paulboone/ticgit (push)
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote
origin
$ git remote add pb https://github.com/paulboone/ticgit
$ git remote -v
origin	https://github.com/schacon/ticgit (fetch)
origin	https://github.com/schacon/ticgit (push)
pb	https://github.com/paulboone/ticgit (fetch)
pb	https://github.com/paulboone/ticgit (push)
----
@z

@x
Now you can use the string `pb` on the command line in lieu of the whole URL.
For example, if you want to fetch all the information that Paul has but that you don't yet have in your repository, you can run `git fetch pb`:
@y
//////////////////////////
//////////////////////////
こうしてコマンドライン上では `pb` という文字列が利用できるようになったので、URL 文字列をすべて入力する必要はなくなります。
たとえば他ユーザーであるポールさん（Paul）だけが持っていて、まだローカルリポジトリ内に入手していない情報があるとします。
これをフェッチしたい場合は `git fetch pb` を実行します。
@z

@x
[source,console]
----
$ git fetch pb
remote: Counting objects: 43, done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 43 (delta 10), reused 31 (delta 5)
Unpacking objects: 100% (43/43), done.
From https://github.com/paulboone/ticgit
 * [new branch]      master     -> pb/master
 * [new branch]      ticgit     -> pb/ticgit
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git fetch pb
remote: Counting objects: 43, done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 43 (delta 10), reused 31 (delta 5)
Unpacking objects: 100% (43/43), done.
From https://github.com/paulboone/ticgit
 * [new branch]      master     -> pb/master
 * [new branch]      ticgit     -> pb/ticgit
----
@z

@x
Paul's `master` branch is now accessible locally as `pb/master` -- you can merge it into one of your branches, or you can check out a local branch at that point if you want to inspect it.
We'll go over what branches are and how to use them in much more detail in <<ch03-git-branching#ch03-git-branching>>.
@y
//////////////////////////
//////////////////////////
ポールさんが持っていた master ブランチは、これ以降はローカルの `pb/master` としてアクセスできます。
これを元々あるブランチにマージさせることもできます。
またその時点での中身を調べてみたいということで、ローカルブランチの 1 つとしてチェックアウトすることもできます。
ブランチがどういうものであり、どのように利用していくかについては「<<ch03-git-branching#ch03-git-branching>>」の章にて細かく説明します。
@z

@x
[[_fetching_and_pulling]]
==== Fetching and Pulling from Your Remotes
@y
//////////////////////////
//////////////////////////
[[_fetching_and_pulling]]
==== リモートリポジトリからのフェッチとプル
@z

@x
As you just saw, to get data from your remote projects, you can run:(((git commands, fetch)))
@y
//////////////////////////
//////////////////////////
まさに上で見たように、リモートのプロジェクトからデータを取得するには以下を実行します。
(((git commands, fetch)))
@z

@x
[source,console]
----
$ git fetch <remote>
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git fetch <remote>
----
@z

@x
The command goes out to that remote project and pulls down all the data from that remote project that you don't have yet.
After you do this, you should have references to all the branches from that remote, which you can merge in or inspect at any time.
@y
//////////////////////////
//////////////////////////
このコマンドはそのリモートプロジェクトから、まだ取得していないデータをすべてプルして取得します。
この後は、このリモートリポジトリのブランチはすべて参照できることになります。
また、これをマージしたり調べたりすることがいつでもできます。
@z

@x
If you clone a repository, the command automatically adds that remote repository under the name "`origin`".
So, `git fetch origin` fetches any new work that has been pushed to that server since you cloned (or last fetched from) it.
It's important to note that the `git fetch` command only downloads the data to your local repository -- it doesn't automatically merge it with any of your work or modify what you're currently working on.
You have to merge it manually into your work when you're ready.
@y
//////////////////////////
//////////////////////////
リポジトリをクローンしたとき、リモートリポジトリには "`origin`" という名前を自動的につけます。
そこで `git fetch origin` とコマンド入力すると、クローンした時点（あるいは最後にフェッチした時点）から現時点までにプッシュされた内容が、すべてフェッチされてくることになります。
ここで重要なことですが、`git fetch` コマンドは単にデータをダウンロードして、ローカルリポジトリに取り込むだけです。
自動的に作業中のファイルとのマージを行ったり、編集中のファイルを修正したりするようなことはありません。
このような場合は、準備を整えてから自分でマージを行う必要があります。
@z

@x
If your current branch is set up to track a remote branch (see the next section and <<ch03-git-branching#ch03-git-branching>> for more information), you can use the `git pull` command to automatically fetch and then merge that remote branch into your current branch.(((git commands, pull)))
This may be an easier or more comfortable workflow for you; and by default, the `git clone` command automatically sets up your local `master` branch to track the remote `master` branch (or whatever the default branch is called) on the server you cloned from.
Running `git pull` generally fetches data from the server you originally cloned from and automatically tries to merge it into the code you're currently working on.
@y
//////////////////////////
//////////////////////////
現在作業中のブランチが、リモートブランチを追跡するように設定されている場合（詳しくは次節や <<ch03-git-branching#ch03-git-branching>> の章を参照）、`git pull` コマンドを使えば自動的にフェッチとマージを行って、ローカルのブランチ内にリモートブランチの内容を取り込みます。
(((git commands, pull)))
このコマンドを用いるのが簡単で楽な方法です。
そもそも `git clone` コマンドはデフォルトの動作として、クローンを取ろうとしているそのリモートの `master` ブランチを（あるいは名前はどうであれ、デフォルトのブランチを）ローカルの `master` ブランチとして取り込むものです。
`git pull` を実行するということは、元々クローンを取得していたサーバーからデータをフェッチし、マージを試みて作業中のファイルに取り入れま
す。
@z

@x
[[_pushing_remotes]]
==== Pushing to Your Remotes
@y
//////////////////////////
//////////////////////////
[[_pushing_remotes]]
==== リモートリポジトリへのプッシュ
@z

@x
When you have your project at a point that you want to share, you have to push it upstream.
The command for this is simple: `git push <remote> <branch>`.(((git commands, push)))
If you want to push your `master` branch to your `origin` server (again, cloning generally sets up both of those names for you automatically), then you can run this to push any commits you've done back up to the server:
@y
//////////////////////////
//////////////////////////
自身のプロジェクトを共有させたいと思ったら、上流にプッシュすることになります。
これは `git push <リモート> <ブランチ>` という簡単なコマンドで実行できます。
(((git commands, push)))
今 `master` ブランチを `origin` サーバーにプッシュしたい場合は（繰り返しますが、クローンを行った際に、`master` と `origin` という名称は、ともに自動的に生成されています）、そこまでにコミットした内容がすべてサーバーにプッシュされることになります。
@z

@x
[source,console]
----
$ git push origin master
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git push origin master
----
@z

@x
This command works only if you cloned from a server to which you have write access and if nobody has pushed in the meantime.
If you and someone else clone at the same time and they push upstream and then you push upstream, your push will rightly be rejected.
You'll have to fetch their work first and incorporate it into yours before you'll be allowed to push.
See <<ch03-git-branching#ch03-git-branching>> for more detailed information on how to push to remote servers.
@y
//////////////////////////
//////////////////////////
このコマンドが正常に動作するのは、クローンを取得したそのサーバーに対しての書き込み権限があった上で、それまでに誰もプッシュしていない場合に限ります。
他にだれかが同じタイミングでクローンを取得していて、すでにプッシュを行っていた場合、そこにあとからプッシュしようとしても確実に拒否されます。
この場合はプッシュされた内容をまずフェッチし、自身のファイル内容に取り入れてから、初めてプッシュできるようになります。
リモートサーバーへのプッシュ方法に関して、より詳しくは <<ch03-git-branching#ch03-git-branching>> を参照してください。
@z

@x
[[_inspecting_remote]]
==== Inspecting a Remote
@y
//////////////////////////
//////////////////////////
[[_inspecting_remote]]
==== リモートサーバーの確認
@z

@x
If you want to see more information about a particular remote, you can use the `git remote show <remote>` command.(((git commands, remote)))
If you run this command with a particular shortname, such as `origin`, you get something like this:
@y
//////////////////////////
//////////////////////////
リモートサーバーに関する情報をさらに詳しく調べるには、コマンド `git remote show <リモート>` を実行します。
(((git commands, remote)))
これを `origin` のような特定のリモートリポジトリに対して実行すると、以下のような結果が得られます。
@z

@x
[source,console]
----
$ git remote show origin
* remote origin
  Fetch URL: https://github.com/schacon/ticgit
  Push  URL: https://github.com/schacon/ticgit
  HEAD branch: master
  Remote branches:
    master                               tracked
    dev-branch                           tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up to date)
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote show origin
* remote origin
  Fetch URL: https://github.com/schacon/ticgit
  Push  URL: https://github.com/schacon/ticgit
  HEAD branch: master
  Remote branches:
    master                               tracked
    dev-branch                           tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up to date)
----
@z

@x
It lists the URL for the remote repository as well as the tracking branch information.
The command helpfully tells you that if you're on the `master` branch and you run `git pull`, it will automatically merge in the `master` branch on the remote after it fetches all the remote references.
It also lists all the remote references it has pulled down.
@y
//////////////////////////
//////////////////////////
一覧には、リモートリポジトリの URL と追跡対象となっているブランチの情報が示されます。
The command helpfully tells you that if you're on the `master` branch and you run `git pull`, it will automatically merge in the `master` branch on the remote after it fetches all the remote references.
It also lists all the remote references it has pulled down.
@z

@x
That is a simple example you're likely to encounter.
When you're using Git more heavily, however, you may see much more information from `git remote show`:
@y
//////////////////////////
//////////////////////////
このような例は、よく見かけるものでしょう。
もっとも Git をもっと使い込んでいくと、`git remote show` からはもっと多くの情報が得られると思います。
@z

@x
[source,console]
----
$ git remote show origin
* remote origin
  URL: https://github.com/my-org/complex-project
  Fetch URL: https://github.com/my-org/complex-project
  Push  URL: https://github.com/my-org/complex-project
  HEAD branch: master
  Remote branches:
    master                           tracked
    dev-branch                       tracked
    markdown-strip                   tracked
    issue-43                         new (next fetch will store in remotes/origin)
    issue-45                         new (next fetch will store in remotes/origin)
    refs/remotes/origin/issue-11     stale (use 'git remote prune' to remove)
  Local branches configured for 'git pull':
    dev-branch merges with remote dev-branch
    master     merges with remote master
  Local refs configured for 'git push':
    dev-branch                     pushes to dev-branch                     (up to date)
    markdown-strip                 pushes to markdown-strip                 (up to date)
    master                         pushes to master                         (up to date)
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote show origin
* remote origin
  URL: https://github.com/my-org/complex-project
  Fetch URL: https://github.com/my-org/complex-project
  Push  URL: https://github.com/my-org/complex-project
  HEAD branch: master
  Remote branches:
    master                           tracked
    dev-branch                       tracked
    markdown-strip                   tracked
    issue-43                         new (next fetch will store in remotes/origin)
    issue-45                         new (next fetch will store in remotes/origin)
    refs/remotes/origin/issue-11     stale (use 'git remote prune' to remove)
  Local branches configured for 'git pull':
    dev-branch merges with remote dev-branch
    master     merges with remote master
  Local refs configured for 'git push':
    dev-branch                     pushes to dev-branch                     (up to date)
    markdown-strip                 pushes to markdown-strip                 (up to date)
    master                         pushes to master                         (up to date)
----
@z

@x
This command shows which branch is automatically pushed to when you run `git push` while on certain branches.
It also shows you which remote branches on the server you don't yet have, which remote branches you have that have been removed from the server, and multiple local branches that are able to merge automatically with their remote-tracking branch when you run `git pull`.
@y
//////////////////////////
//////////////////////////
This command shows which branch is automatically pushed to when you run `git push` while on certain branches.
It also shows you which remote branches on the server you don't yet have, which remote branches you have that have been removed from the server, and multiple local branches that are able to merge automatically with their remote-tracking branch when you run `git pull`.
@z

@x
==== Renaming and Removing Remotes
@y
//////////////////////////
//////////////////////////
==== リモートサーバーの名称変更と削除
@z

@x
You can run `git remote rename` to change a remote's shortname.(((git commands, remote)))
For instance, if you want to rename `pb` to `paul`, you can do so with `git remote rename`:
@y
//////////////////////////
//////////////////////////
You can run `git remote rename` to change a remote's shortname.(((git commands, remote)))
For instance, if you want to rename `pb` to `paul`, you can do so with `git remote rename`:
@z

@x
[source,console]
----
$ git remote rename pb paul
$ git remote
origin
paul
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote rename pb paul
$ git remote
origin
paul
----
@z

@x
It's worth mentioning that this changes all your remote-tracking branch names, too.
What used to be referenced at `pb/master` is now at `paul/master`.
@y
//////////////////////////
//////////////////////////
It's worth mentioning that this changes all your remote-tracking branch names, too.
What used to be referenced at `pb/master` is now at `paul/master`.
@z

@x
If you want to remove a remote for some reason -- you've moved the server or are no longer using a particular mirror, or perhaps a contributor isn't contributing anymore -- you can either use `git remote remove` or `git remote rm`:
@y
//////////////////////////
//////////////////////////
If you want to remove a remote for some reason -- you've moved the server or are no longer using a particular mirror, or perhaps a contributor isn't contributing anymore -- you can either use `git remote remove` or `git remote rm`:
@z

@x
[source,console]
----
$ git remote remove paul
$ git remote
origin
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git remote remove paul
$ git remote
origin
----
@z

@x
Once you delete the reference to a remote this way, all remote-tracking branches and configuration settings associated with that remote are also deleted.
@y
//////////////////////////
//////////////////////////
Once you delete the reference to a remote this way, all remote-tracking branches and configuration settings associated with that remote are also deleted.
@z
