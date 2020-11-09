%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_help]]
@y
[[_git_help]]
@z

@x
=== Getting Help
@y
//////////////////////////
=== Getting Help
//////////////////////////
=== マニュアルヘルプを見る
@z

@x
If you ever need help while using Git, there are three equivalent ways to get the comprehensive manual page (manpage) help for any of the Git commands:
@y
//////////////////////////
If you ever need help while using Git, there are three equivalent ways to get the comprehensive manual page (manpage) help for any of the Git commands:
//////////////////////////
Git コマンドのマニュアルヘルプ（man ページ）の起動には 3 つの方法があります。
@z

@x
[source,console]
----
$ git help <verb>
$ git <verb> --help
$ man git-<verb>
----
@y
//////////////////////////
[source,console]
----
$ git help <verb>
$ git <verb> --help
$ man git-<verb>
----
//////////////////////////
[source,端末]
----
$ git help <verb>
$ git <verb> --help
$ man git-<verb>
----
@z

@x
For example, you can get the manpage help for the `git config` command by running this:(((git commands, help)))
@y
//////////////////////////
For example, you can get the manpage help for the `git config` command by running this:(((git commands, help)))
//////////////////////////
たとえば `git config` コマンドのマニュアルヘルプを見る場合は、以下を実行します。
(((git commands, help)))
@z

@x
[source,console]
----
$ git help config
----
@y
//////////////////////////
[source,console]
----
$ git help config
----
//////////////////////////
[source,端末]
----
$ git help config
----
@z

@x
These commands are nice because you can access them anywhere, even offline.
If the manpages and this book aren't enough and you need in-person help, you can try the `#git` or `#github` channel on the Freenode IRC server, which can be found at https://freenode.net[].
These channels are regularly filled with hundreds of people who are all very knowledgeable about Git and are often willing to help.(((IRC)))
@y
//////////////////////////
These commands are nice because you can access them anywhere, even offline.
If the manpages and this book aren't enough and you need in-person help, you can try the `#git` or `#github` channel on the Freenode IRC server, which can be found at https://freenode.net[].
These channels are regularly filled with hundreds of people who are all very knowledgeable about Git and are often willing to help.(((IRC)))
//////////////////////////
どのようなときでも、たとえオフラインであっても、このようなコマンド実行によってヘルプを見ることができるのは、うれしいところです。
man ページでも本書でも、まだまだわからず、だれかに尋ねたいときもあるでしょう。
そういったときには https://freenode.net[] にある FreeNode IRC サーバーの `#git` チャンネルまたは `#github` チャンネルにアクセスしてみてください。
このチャンネルには実に多くの方がアクセスしていて、Git のことを非常によく知っている人ばかりです。
その方たちが喜んで助けてくれます。
(((IRC)))
@z

@x
In addition, if you don't need the full-blown manpage help, but just need a quick refresher on the available options for a Git command, you can ask for the more concise "`help`" output with the `-h` option, as in:
@y
//////////////////////////
In addition, if you don't need the full-blown manpage help, but just need a quick refresher on the available options for a Git command, you can ask for the more concise ``help'' output with the `-h` option, as in:
//////////////////////////
また Git コマンドの本格的なマニュアルヘルプではなく、オプションの使い方を思い出したいだけのときもあります。
このような場合は、`-h` または `--help` オプションによって簡単なヘルプを参照することもできます。
@z

@x
[source,console]
----
$ git add -h
usage: git add [<options>] [--] <pathspec>...
@y
//////////////////////////
[source,console]
----
$ git add -h
usage: git add [<options>] [--] <pathspec>...
//////////////////////////
[source,端末]
----
$ git add -h
usage: git add [<options>] [--] <pathspec>...
@z

@x
    -n, --dry-run         dry run
    -v, --verbose         be verbose
@y
    -n, --dry-run         dry run
    -v, --verbose         be verbose
@z

@x
    -i, --interactive     interactive picking
    -p, --patch           select hunks interactively
    -e, --edit            edit current diff and apply
    -f, --force           allow adding otherwise ignored files
    -u, --update          update tracked files
    --renormalize         renormalize EOL of tracked files (implies -u)
    -N, --intent-to-add   record only the fact that the path will be added later
    -A, --all             add changes from all tracked and untracked files
    --ignore-removal      ignore paths removed in the working tree (same as --no-all)
    --refresh             don't add, only refresh the index
    --ignore-errors       just skip files which cannot be added because of errors
    --ignore-missing      check if - even missing - files are ignored in dry run
    --chmod (+|-)x        override the executable bit of the listed files
----
@y
    -i, --interactive     interactive picking
    -p, --patch           select hunks interactively
    -e, --edit            edit current diff and apply
    -f, --force           allow adding otherwise ignored files
    -u, --update          update tracked files
    --renormalize         renormalize EOL of tracked files (implies -u)
    -N, --intent-to-add   record only the fact that the path will be added later
    -A, --all             add changes from all tracked and untracked files
    --ignore-removal      ignore paths removed in the working tree (same as --no-all)
    --refresh             don't add, only refresh the index
    --ignore-errors       just skip files which cannot be added because of errors
    --ignore-missing      check if - even missing - files are ignored in dry run
    --chmod (+|-)x        override the executable bit of the listed files
----
@z
