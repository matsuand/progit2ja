%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_first_time]]
@y
[[_first_time]]
@z

@x
=== First-Time Git Setup
@y
//////////////////////////
=== First-Time Git Setup
//////////////////////////
=== Git 導入直後の設定
@z

@x
Now that you have Git on your system, you'll want to do a few things to customize your Git environment.
You should have to do these things only once on any given computer; they'll stick around between upgrades.
You can also change them at any time by running through the commands again.
@y
//////////////////////////
Now that you have Git on your system, you'll want to do a few things to customize your Git environment.
You should have to do these things only once on any given computer; they'll stick around between upgrades.
You can also change them at any time by running through the commands again.
//////////////////////////
Git をインストールしたので、Git 環境に対して設定を行います。
この設定は、作業を行うコンピューターにおいて 1 回行えば済むものです。
今後、Git をアップグレードしてもこの設定は残ります。
その後に変更の必要があれば、同じコマンドを実行します。
@z

@x
Git comes with a tool called `git config` that lets you get and set configuration variables that control all aspects of how Git looks and operates.(((git commands, config)))
These variables can be stored in three different places:
@y
//////////////////////////
Git comes with a tool called `git config` that lets you get and set configuration variables that control all aspects of how Git looks and operates.(((git commands, config)))
These variables can be stored in three different places:
//////////////////////////
Git には `git config` というツールがあります。
これは設定変数の参照や更新を行います。
設定変数は Git の表示方法や動作を全般に制御するものです。
(((git commands, config)))
以下に示すように、この変数を設定する場所は 3 つあります。
@z

@x
1. `[path]/etc/gitconfig` file: Contains values applied to every user on the system and all their repositories.
  If you pass the option `--system` to `git config`, it reads and writes from this file specifically.
  Because this is a system configuration file, you would need administrative or superuser privilege to make changes to it.
2. `~/.gitconfig` or `~/.config/git/config` file: Values specific personally to you, the user.
  You can make Git read and write to this file specifically by passing the `--global` option, and this affects _all_ of the repositories you work with on your system.
3. `config` file in the Git directory (that is, `.git/config`) of whatever repository you're currently using: Specific to that single repository.
  You can force Git to read from and write to this file with the `--local` option, but that is in fact the default.
  Unsurprisingly, you need to be located somewhere in a Git repository for this option to work properly.
@y
//////////////////////////
1. `[path]/etc/gitconfig` file: Contains values applied to every user on the system and all their repositories.
  If you pass the option `--system` to `git config`, it reads and writes from this file specifically.
  Because this is a system configuration file, you would need administrative or superuser privilege to make changes to it.
2. `~/.gitconfig` or `~/.config/git/config` file: Values specific personally to you, the user.
  You can make Git read and write to this file specifically by passing the `--global` option, and this affects _all_ of the repositories you work with on your system.
3. `config` file in the Git directory (that is, `.git/config`) of whatever repository you're currently using: Specific to that single repository.
  You can force Git to read from and write to this file with the `--local` option, but that is in fact the default.
  Unsurprisingly, you need to be located somewhere in a Git repository for this option to work properly.
//////////////////////////
1. `[path]/etc/gitconfig` ファイル： システム上の全ユーザー、全リポジトリに対する設定。
  `git config` の実行時に `--system` オプションを指定すると、このファイルを対象として設定変数の読み書きを行います。
  このファイルはシステム全体に対しての設定ファイルであるため、このファイルの変更には管理者権限が必要になります。
2. `~/.gitconfig` ファイルまたは `~/.config/git/config` ファイル： 各ユーザー向けの設定。
  `--global` オプションを指定すれば、このファイルを対象として設定変数の読み書きを行います。
  この指定により、システム上にて自身が作業しているリポジトリをすべて制御することができます。
3. 現在利用中の Git ディレクトリ内の `config` ファイル（すなわち `.git/config`）： そのリポジトリのみに対する設定。
  `--local` オプションの指定によって、このファイルを対象として設定変数の読み書きを行います。
  これがデフォルトになります。
  当然のことながらこの設定を有効にするには、その Git リポジトリ内から実行する必要があります。
@z

@x
Each level overrides values in the previous level, so values in `.git/config` trump those in `[path]/etc/gitconfig`.
@y
//////////////////////////
Each level overrides values in the previous level, so values in `.git/config` trump those in `[path]/etc/gitconfig`.
//////////////////////////
設定内容は上位レベルのものによって上書きされます。
たとえば `.git/config` にある設定は `[path]/etc/gitconfig` ファイルのものよりも優先されます。
@z

@x
On Windows systems, Git looks for the `.gitconfig` file in the `$HOME` directory (`C:\Users\$USER` for most people).
It also still looks for `[path]/etc/gitconfig`, although it's relative to the MSys root, which is wherever you decide to install Git on your Windows system when you run the installer.
If you are using version 2.x or later of Git for Windows, there is also a system-level config file at
`C:\Documents and Settings\All Users\Application Data\Git\config` on Windows XP, and in `C:\ProgramData\Git\config` on Windows Vista and newer.
This config file can only be changed by `git config -f <file>` as an admin.
@y
//////////////////////////
On Windows systems, Git looks for the `.gitconfig` file in the `$HOME` directory (`C:\Users\$USER` for most people).
It also still looks for `[path]/etc/gitconfig`, although it's relative to the MSys root, which is wherever you decide to install Git on your Windows system when you run the installer.
If you are using version 2.x or later of Git for Windows, there is also a system-level config file at
`C:\Documents and Settings\All Users\Application Data\Git\config` on Windows XP, and in `C:\ProgramData\Git\config` on Windows Vista and newer.
This config file can only be changed by `git config -f <file>` as an admin.
//////////////////////////
Windows の場合、`.gitconfig` ファイルは `$HOME` ディレクトリ（普通は `C:\Users\$USER`）にあるものが参照されます。
また `[path]/etc/gitconfig` も探しにいきますが、これは MSys のルートからの相対パスとなります。
なお MSys ルートとは、インストーラーの操作時に Git のインストール先として指定したディレクトリのことです。
Git for Windows のバージョン 2.x 以降を利用している場合、さらにシステムレベルの設定ファイルもあります。
Windows XP の場合、`C:\Documents and Settings\All Users\Application Data\Git\config` であり、Windows Vista やそれ以降では `C:\ProgramData\Git\config` となります。
この設定ファイルの変更には管理者権限が必要で、`git config -f <file>` を実行します。
@z

@x
You can view all of your settings and where they are coming from using:
@y
//////////////////////////
You can view all of your settings and where they are coming from using:
//////////////////////////
設定した内容をすべて確認するには以下を実行します。
これによってその設定がどこで行われているかがわかります。
@z

@x
[source,console]
----
$ git config --list --show-origin
----
@y
//////////////////////////
[source,console]
----
$ git config --list --show-origin
----
//////////////////////////
[source,端末]
----
$ git config --list --show-origin
----
@z

@x
==== Your Identity
@y
//////////////////////////
==== Your Identity
//////////////////////////
==== ユーザーの識別情報
@z

@x
The first thing you should do when you install Git is to set your user name and email address.
This is important because every Git commit uses this information, and it's immutably baked into the commits you start creating:
@y
//////////////////////////
The first thing you should do when you install Git is to set your user name and email address.
This is important because every Git commit uses this information, and it's immutably baked into the commits you start creating:
//////////////////////////
Git のインストール後にまず行うのは、ユーザー名とメールアドレスの設定です。
この設定は重要です。
Git のコミット処理においては、ユーザー名、メールアドレスの情報が利用されます。
コミットのたびにこの情報が書き込まれることになり、消えることはありません。
@z

@x
[source,console]
----
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
----
@y
//////////////////////////
[source,console]
----
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
----
//////////////////////////
[source,端末]
----
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
----
@z

@x
Again, you need to do this only once if you pass the `--global` option, because then Git will always use that information for anything you do on that system.
If you want to override this with a different name or email address for specific projects, you can run the command without the `--global` option when you're in that project.
@y
//////////////////////////
Again, you need to do this only once if you pass the `--global` option, because then Git will always use that information for anything you do on that system.
If you want to override this with a different name or email address for specific projects, you can run the command without the `--global` option when you're in that project.
//////////////////////////
`--global` オプションをつけてこの設定を行ったのであれば、やはり設定は 1 回行うだけで済みます。
Git はこの設定以降、このシステム上で行なわれる操作に対して、必ずこの情報を利用するからです。
別の Git プロジェクトでは、この設定でなく、別のユーザー名やメールアドレスを用いたい場合は、その Git プロジェクト内にて `--global` オプションをつけずにコマンド実行します。
@z

@x
Many of the GUI tools will help you do this when you first run them.
@y
//////////////////////////
Many of the GUI tools will help you do this when you first run them.
//////////////////////////
GUI ツールはわかりやすく設定できるものが多いので、試してみるとよいでしょう。
@z

@x
[[_editor]]
@y
[[_editor]]
@z

@x
==== Your Editor
@y
//////////////////////////
==== Your Editor
//////////////////////////
==== 利用するエディター
@z

@x
Now that your identity is set up, you can configure the default text editor that will be used when Git needs you to type in a message.
If not configured, Git uses your system's default editor.
@y
//////////////////////////
Now that your identity is set up, you can configure the default text editor that will be used when Git needs you to type in a message.
If not configured, Git uses your system's default editor.
//////////////////////////
識別情報の設定の次は、デフォルトのテキストエディターの設定です。
Git を操作する際に、テキスト入力が必要となるときに利用するエディターのことです。
この設定が行われていない場合は、システムのデフォルトエディターが利用されます。
@z

@x
If you want to use a different text editor, such as Emacs, you can do the following:
@y
//////////////////////////
If you want to use a different text editor, such as Emacs, you can do the following:
//////////////////////////
例えばテキストエディターとして Emacs を使いたい場合は、以下のように設定します。
@z

@x
[source,console]
----
$ git config --global core.editor emacs
----
@y
//////////////////////////
[source,console]
----
$ git config --global core.editor emacs
----
//////////////////////////
[source,端末]
----
$ git config --global core.editor emacs
----
@z

@x
On a Windows system, if you want to use a different text editor, you must specify the full path to its executable file.
This can be different depending on how your editor is packaged.
@y
//////////////////////////
On a Windows system, if you want to use a different text editor, you must specify the full path to its executable file.
This can be different depending on how your editor is packaged.
//////////////////////////
Windows において別のテキストエディターを利用する場合は、実行モジュールのフルパスを指定する必要があります。
このパスはテキストエディターがどのようにして提供されているかにより異なります。
@z

@x
In the case of Notepad++, a popular programming editor, you are likely to want to use the 32-bit version, since at the time of writing the 64-bit version doesn't support all plug-ins.
If you are on a 32-bit Windows system, or you have a 64-bit editor on a 64-bit system, you'll type something like this:
@y
//////////////////////////
In the case of Notepad++, a popular programming editor, you are likely to want to use the 32-bit version, since at the time of writing the 64-bit version doesn't support all plug-ins.
If you are on a 32-bit Windows system, or you have a 64-bit editor on a 64-bit system, you'll type something like this:
//////////////////////////
よく聞くエディターの Notepad++ の場合、本文執筆時点では 64 ビット版がすべてのプラグインをサポートしていないため、32 ビット版を使いたいところでしょう。
32 ビット Windows を利用している場合と、64 ビット Windows において 64 ビット版エディターを使う場合は、以下のように設定します。
@z

@x
[source,console]
----
$ git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
----
@y
//////////////////////////
[source,console]
----
$ git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
----
//////////////////////////
[source,端末]
----
$ git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
----
@z

@x
[NOTE]
====
Vim, Emacs and Notepad++ are popular text editors often used by developers on Unix-based systems like Linux and macOS or a Windows system.
If you are using another editor, or a 32-bit version, please find specific instructions for how to set up your favorite editor with Git in <<C-git-commands#ch_core_editor>>.
====
@y
//////////////////////////
[NOTE]
====
Vim, Emacs and Notepad++ are popular text editors often used by developers on Unix-based systems like Linux and macOS or a Windows system.
If you are using another editor, or a 32-bit version, please find specific instructions for how to set up your favorite editor with Git in <<C-git-commands#ch_core_editor>>.
====
//////////////////////////
[NOTE]
====
Vim、Emacs、Notepad++ といったテキストエディターは一般的なものなので、Unix ベースの Linux や macOS あるいは Windows において開発者がよく利用しています。
これ以外のエディターや 32 ビット版のものを利用している場合、<<C-git-commands#ch_core_editor>> に示されているものであれば、その設定手順に従ってください。
====
@z

@x
[WARNING]
====
You may find, if you don't setup your editor like this, you get into a really confusing state when Git attempts to launch it.
An example on a Windows system may include a prematurely terminated Git operation during a Git initiated edit.
====
@y
//////////////////////////
[WARNING]
====
You may find, if you don't setup your editor like this, you get into a really confusing state when Git attempts to launch it.
An example on a Windows system may include a prematurely terminated Git operation during a Git initiated edit.
====
//////////////////////////
[WARNING]
====
ここのようなエディター設定を行っていない場合に、Git がエディターを起動してきて、どうしたらよいのか困ってしまうことがあります。
Windows の場合、Git がエディターを起動し始めることによって、そのときの Git 操作が早々に中断してしまうようなこともあります。
====
@z

@x
==== Your default branch name
@y
//////////////////////////
==== Your default branch name
//////////////////////////
==== デフォルトのブランチ名
@z

@x
By default Git will create a branch called _master_ when you create a new repository with `git init`.
From Git version 2.28 onwards, you can set a different name for the initial branch.
@y
//////////////////////////
By default Git will create a branch called _master_ when you create a new repository with `git init`.
From Git version 2.28 onwards, you can set a different name for the initial branch.
//////////////////////////
新規にリポジトリを `git init` により生成した際に作り出されるブランチは、デフォルトで _master_ という名前です。
Git バージョン 2.28 以降では、この初期ブランチ名を別のものに設定できるようになりました。
@z

@x
To set _main_ as the default branch name do:
@y
//////////////////////////
To set _main_ as the default branch name do:
//////////////////////////
デフォルトブランチ名を _main_ とする場合は、以下のようにします。
@z

@x
[source,console]
----
$ git config --global init.defaultBranch main
----
@y
//////////////////////////
[source,console]
----
$ git config --global init.defaultBranch main
----
//////////////////////////
[source,端末]
----
$ git config --global init.defaultBranch main
----
@z

@x
==== Checking Your Settings
@y
//////////////////////////
==== Checking Your Settings
//////////////////////////
==== 設定内容の確認
@z

@x
If you want to check your configuration settings, you can use the `git config --list` command to list all the settings Git can find at that point:
@y
//////////////////////////
If you want to check your configuration settings, you can use the `git config --list` command to list all the settings Git can find at that point:
//////////////////////////
設定を確認するには `git config --list` を実行します。
その時点で Git に設定されている内容が一覧表示されます。
@z

@x
[source,console]
----
$ git config --list
user.name=John Doe
user.email=johndoe@example.com
color.status=auto
color.branch=auto
color.interactive=auto
color.diff=auto
...
----
@y
//////////////////////////
[source,console]
----
$ git config --list
user.name=John Doe
user.email=johndoe@example.com
color.status=auto
color.branch=auto
color.interactive=auto
color.diff=auto
...
----
//////////////////////////
[source,端末]
----
$ git config --list
user.name=John Doe
user.email=johndoe@example.com
color.status=auto
color.branch=auto
color.interactive=auto
color.diff=auto
...
----
@z

@x
You may see keys more than once, because Git reads the same key from different files (`[path]/etc/gitconfig` and `~/.gitconfig`, for example).
In this case, Git uses the last value for each unique key it sees.
@y
//////////////////////////
You may see keys more than once, because Git reads the same key from different files (`[path]/etc/gitconfig` and `~/.gitconfig`, for example).
In this case, Git uses the last value for each unique key it sees.
//////////////////////////
上において同一のキー項目が複数並ぶ場合があります。
これは Git がそのキー項目を複数のファイル（たとえば `[path]/etc/gitconfig` と `~/.gitconfig`）から読み込むからです。
このような場合、最後に示す設定が適用されます。
@z

@x
You can also check what Git thinks a specific key's value is by typing `git config <key>`:(((git commands, config)))
@y
//////////////////////////
You can also check what Git thinks a specific key's value is by typing `git config <key>`:(((git commands, config)))
//////////////////////////
また特定のキー項目がどのように設定されているかを知りたいときは、`git config <キー項目>` と入力します。
(((git commands, config)))
@z

@x
[source,console]
----
$ git config user.name
John Doe
----
@y
//////////////////////////
[source,console]
----
$ git config user.name
John Doe
----
//////////////////////////
[source,端末]
----
$ git config user.name
John Doe
----
@z

@x
[NOTE]
====
Since Git might read the same configuration variable value from more than one file, it's possible that you have an unexpected value for one of these values and you don't know why.
In cases like that, you can query Git as to the _origin_ for that value, and it will tell you which configuration file had the final say in setting that value:
@y
//////////////////////////
[NOTE]
====
Since Git might read the same configuration variable value from more than one file, it's possible that you have an unexpected value for one of these values and you don't know why.
In cases like that, you can query Git as to the _origin_ for that value, and it will tell you which configuration file had the final say in setting that value:
//////////////////////////
[NOTE]
====
Git では 1 つの設定項目を複数の設定ファイルから読み込む場合があります。
その場合、設定値が予期しないものになって、どうなっているのかわからなくなることも起きます。
こういったときは Git に対して、正しい値はどれかを問い合わせることができます。
以下のようにすることで、どの設定ファイルに従って設定値が定められているかがわかります。
@z

@x
[source,console]
----
$ git config --show-origin rerere.autoUpdate
file:/home/johndoe/.gitconfig	false
----
====
@y
//////////////////////////
[source,console]
----
$ git config --show-origin rerere.autoUpdate
file:/home/johndoe/.gitconfig	false
----
//////////////////////////
[source,端末]
----
$ git config --show-origin rerere.autoUpdate
file:/home/johndoe/.gitconfig	false
----
====
@z
