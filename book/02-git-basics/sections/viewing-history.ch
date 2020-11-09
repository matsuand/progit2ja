%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_viewing_history]]
@y
[[_viewing_history]]
@z

@x
=== Viewing the Commit History
@y
//////////////////////////
=== Viewing the Commit History
//////////////////////////
=== コミット履歴の参照
@z

@x
After you have created several commits, or if you have cloned a repository with an existing commit history, you'll probably want to look back to see what has happened.
The most basic and powerful tool to do this is the `git log` command.
@y
//////////////////////////
//////////////////////////
利用するリポジトリに何度かコミットを行ってきた場合、あるいは他のリポジトリのクローンを取得していてコミット履歴を持っているとします。
このような状況においては、過去がどうであったかを見る必要がでてきます。
これを行うには `git log` コマンドを利用します。
基本的なコマンドですが、強力なコマンドでもあります。
@z

@x
These examples use a very simple project called "`simplegit`".
To get the project, run:
@y
//////////////////////////
//////////////////////////
ここから示す例として "`simplegit`" というプロジェクトを使います。
このプロジェクトは以下のようにして取得します。
@z

@x
[source,console]
----
$ git clone https://github.com/schacon/simplegit-progit
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git clone https://github.com/schacon/simplegit-progit
----
@z

@x
When you run `git log` in this project, you should get output that looks something like this:(((git commands, log)))
@y
//////////////////////////
//////////////////////////
このプロジェクトにおいて `git log` コマンドを実行すると、以下に示すような出力が得られます。
(((git commands, log)))
@z

@x
[source,console]
----
$ git log
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@z

@x
    Change version number
@y
    Change version number
@z

@x
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@y
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@z

@x
    Remove unnecessary test
@y
    Remove unnecessary test
@z

@x
commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700
@y
commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700
@z

@x
    Initial commit
----
@y
    Initial commit
----
@z

@x
By default, with no arguments, `git log` lists the commits made in that repository in reverse chronological order; that is, the most recent commits show up first.
As you can see, this command lists each commit with its SHA-1 checksum, the author's name and email, the date written, and the commit message.
@y
//////////////////////////
//////////////////////////
引数を与えずに `git log` を実行すると、デフォルトで、そのリポジトリに対して実行されたコミットの一覧が、日時の新しい順に表示されます。
つまり最新のコミットが先頭に表示されます。
上に示しているように各コミットの情報として SHA-1 チェックサム値、作者名とメールアドレス、日時、コミットメッセージが表示されます。
@z

@x
A huge number and variety of options to the `git log` command are available to show you exactly what you're looking for.
Here, we'll show you some of the most popular.
@y
//////////////////////////
//////////////////////////
`git log` コマンドには実に多くのオプションがあるので、オプションを利用してさまざまな情報を得ることができます。
以下に代表的なオプションを見ていきます。
@z

@x
One of the more helpful options is `-p` or `--patch`, which shows the difference (the _patch_ output) introduced in each commit.
You can also limit the number of log entries displayed, such as using `-2` to show only the last two entries.
@y
//////////////////////////
//////////////////////////
有用なオプションとして `-p` あるいは `--patch` があります。
これは各コミット間の差異（__patch__形式の出力）を表示します。
ログ項目の数を制限するには、`-2` のような指定を行えば、最新の 2 つのコミット情報のみを表示することになります。
@z

@x
[source,console]
----
$ git log -p -2
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log -p -2
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@z

@x
    Change version number
@y
    Change version number
@z

@x
diff --git a/Rakefile b/Rakefile
index a874b73..8f94139 100644
--- a/Rakefile
+++ b/Rakefile
@@ -5,7 +5,7 @@ require 'rake/gempackagetask'
 spec = Gem::Specification.new do |s|
     s.platform  =   Gem::Platform::RUBY
     s.name      =   "simplegit"
-    s.version   =   "0.1.0"
+    s.version   =   "0.1.1"
     s.author    =   "Scott Chacon"
     s.email     =   "schacon@gee-mail.com"
     s.summary   =   "A simple gem for using Git in Ruby code."
@y
diff --git a/Rakefile b/Rakefile
index a874b73..8f94139 100644
--- a/Rakefile
+++ b/Rakefile
@@ -5,7 +5,7 @@ require 'rake/gempackagetask'
 spec = Gem::Specification.new do |s|
     s.platform  =   Gem::Platform::RUBY
     s.name      =   "simplegit"
-    s.version   =   "0.1.0"
+    s.version   =   "0.1.1"
     s.author    =   "Scott Chacon"
     s.email     =   "schacon@gee-mail.com"
     s.summary   =   "A simple gem for using Git in Ruby code."
@z

@x
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@y
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@z

@x
    Remove unnecessary test
@y
    Remove unnecessary test
@z

@x
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index a0a60ae..47c6340 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -18,8 +18,3 @@ class SimpleGit
     end
@y
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index a0a60ae..47c6340 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -18,8 +18,3 @@ class SimpleGit
     end
@z

@x
 end
-
-if $0 == __FILE__
-  git = SimpleGit.new
-  puts git.show
-end
----
@y
 end
-
-if $0 == __FILE__
-  git = SimpleGit.new
-  puts git.show
-end
----
@z

@x
This option displays the same information but with a diff directly following each entry.
This is very helpful for code review or to quickly browse what happened during a series of commits that a collaborator has added.
You can also use a series of summarizing options with `git log`.
For example, if you want to see some abbreviated stats for each commit, you can use the `--stat` option:
@y
//////////////////////////
//////////////////////////
さきほどと同じ情報が出力されますが、このオプションの指定によりさらに 1 つ前のコミット項目との差異（diff）も表示されます。
こういった情報は、コードレビューに役立てることができます。
あるいは他のメンバーが行ってきたコミットによって、何がどうなっているのかを即座に確認できます。
またログ情報のとりまとめを行う `git log` のオプションもあります。
たとえばコミットにおいて簡略な統計的情報を見ることができます。
これは `--stat` オプションを使います。
@z

@x
[source,console]
----
$ git log --stat
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --stat
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@z

@x
    Change version number
@y
    Change version number
@z

@x
 Rakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
@y
 Rakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
@z

@x
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@y
commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700
@z

@x
    Remove unnecessary test
@y
    Remove unnecessary test
@z

@x
 lib/simplegit.rb | 5 -----
 1 file changed, 5 deletions(-)
@y
 lib/simplegit.rb | 5 -----
 1 file changed, 5 deletions(-)
@z

@x
commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700
@y
commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700
@z

@x
    Initial commit
@y
    Initial commit
@z

@x
 README           |  6 ++++++
 Rakefile         | 23 +++++++++++++++++++++++
 lib/simplegit.rb | 25 +++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
----
@y
 README           |  6 ++++++
 Rakefile         | 23 +++++++++++++++++++++++
 lib/simplegit.rb | 25 +++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
----
@z

@x
As you can see, the `--stat` option prints below each commit entry a list of modified files, how many files were changed, and how many lines in those files were added and removed.
It also puts a summary of the information at the end.
@y
//////////////////////////
//////////////////////////
このように `--stat` オプションでは、それぞれのコミット項目の下に一覧を表示します。
一覧には、修正ファイル名、全部でいくつ修正され、そのファイル内で何行の追加あるいは削除があったかを示します。
さらに最後には、すべてをとりまとめた情報も示します。
@z

@x
Another really useful option is `--pretty`.
This option changes the log output to formats other than the default.
A few prebuilt option values are available for you to use.
The `oneline` value for this option prints each commit on a single line, which is useful if you're looking at a lot of commits.
In addition, the `short`, `full`, and `fuller` values show the output in roughly the same format but with less or more information, respectively:
@y
//////////////////////////
//////////////////////////
便利なオプションとして `--pretty` というものもあります。
このオプションは、デフォルトのログ出力のフォーマットを変更します。
フォーマットの指定に利用できるオプション値がいくつかあります。
`oneline` オプション値は、各コミットを一行で表示するもので、コミットが数多くある場合には便利です。
`short`、`full`、`fuller` というオプション値もあり、だいたい似たような情報を出力しますが、省略したり逆に情報を多く示すなどの違いがあります。
@z

@x
[source,console]
----
$ git log --pretty=oneline
ca82a6dff817ec66f44342007202690a93763949 Change version number
085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7 Remove unnecessary test
a11bef06a3f659402fe7563abf99ad00de2209e6 Initial commit
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --pretty=oneline
ca82a6dff817ec66f44342007202690a93763949 Change version number
085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7 Remove unnecessary test
a11bef06a3f659402fe7563abf99ad00de2209e6 Initial commit
----
@z

@x
The most interesting option value is `format`, which allows you to specify your own log output format.
This is especially useful when you're generating output for machine parsing -- because you specify the format explicitly, you know it won't change with updates to Git:(((log formatting)))
@y
//////////////////////////
//////////////////////////
なかでも有用なオプション値が `format` です。
これはログ出力のフォーマットを独自に定めることができます。
特に、出力したログをプログラム解析するような場合には必要となるでしょう。
ログ出力フォーマットを独自に作り出しておけば、Git に更新があったとしても、変更を加えずに取り扱うことができます。
(((log formatting)))
@z

@x
[source,console]
----
$ git log --pretty=format:"%h - %an, %ar : %s"
ca82a6d - Scott Chacon, 6 years ago : Change version number
085bb3b - Scott Chacon, 6 years ago : Remove unnecessary test
a11bef0 - Scott Chacon, 6 years ago : Initial commit
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --pretty=format:"%h - %an, %ar : %s"
ca82a6d - Scott Chacon, 6 years ago : Change version number
085bb3b - Scott Chacon, 6 years ago : Remove unnecessary test
a11bef0 - Scott Chacon, 6 years ago : Initial commit
----
@z

@x
<<pretty_format>> lists some of the more useful specifiers that `format` takes.
@y
//////////////////////////
//////////////////////////
以下に示す表「<<pretty_format>>」では `format` に指定する便利な識別子を示します。
@z

@x
[[pretty_format]]
.Useful specifiers for `git log --pretty=format`
[cols="1,4",options="header"]
|================================
| Specifier | Description of Output
| `%H`      | Commit hash
| `%h`      | Abbreviated commit hash
| `%T`      | Tree hash
| `%t`      | Abbreviated tree hash
| `%P`      | Parent hashes
| `%p`      | Abbreviated parent hashes
| `%an`     | Author name
| `%ae`     | Author email
| `%ad`     | Author date (format respects the --date=option)
| `%ar`     | Author date, relative
| `%cn`     | Committer name
| `%ce`     | Committer email
| `%cd`     | Committer date
| `%cr`     | Committer date, relative
| `%s`      | Subject
|================================
@y
//////////////////////////
//////////////////////////
[[pretty_format]]
.`git log --pretty=format` に用いる識別子一覧
[cols="1,4",options="header"]
|================================
| 識別子    | 出力内容
| `%H`      | コミットハッシュ
| `%h`      | コミットハッシュの短縮形
| `%T`      | ツリーハッシュ
| `%t`      | ツリーハッシュの短縮形
| `%P`      | 親のハッシュ
| `%p`      | 親のハッシュの短縮形
| `%an`     | 作成者名
| `%ae`     | 作成者のメールアドレス
| `%ad`     | 作成日付（フォーマットは --date=オプション の指定に従う）
| `%ar`     | 作成日付（相対的；どれだけ前か）
| `%cn`     | コミットユーザー名
| `%ce`     | コミットユーザーのメールアドレス
| `%cd`     | コミット日付
| `%cr`     | コミット日付（相対的；どれだけ前か）
| `%s`      | 件名
|================================
@z

@x
You may be wondering what the difference is between _author_ and _committer_.
The author is the person who originally wrote the work, whereas the committer is the person who last applied the work.
So, if you send in a patch to a project and one of the core members applies the patch, both of you get credit -- you as the author, and the core member as the committer.
We'll cover this distinction a bit more in <<ch05-distributed-git#ch05-distributed-git>>.
@y
//////////////////////////
//////////////////////////
**作成者**（author）と**コミットユーザー**（committer）の違いがわからないかもしれません。
作成者とはその作業を初めに行ったユーザーであり、コミットユーザーとは最後に作業を行ったユーザーのことです。
たとえばパッチを作成してプロジェクトに送信したとして、プロジェクトメンバーがそのパッチを適用したとします。
このとき、パッチを作成した者も適用した者も、ともに名前が登録されますが、パッチを作成した者が**作成者**であり、適用した者が**コミットユーザー**となります。
この違いについては <<ch05-distributed-git#ch05-distributed-git>> の章において詳しく説明します。
@z

@x
The `oneline` and `format` option values are particularly useful with another `log` option called `--graph`.
This option adds a nice little ASCII graph showing your branch and merge history:
@y
//////////////////////////
//////////////////////////
`oneline` オプションと `format` オプション値は、特に `--graph` オプションと組み合わせて利用すると便利です。
これを使うとアスキー文字によって簡単なグラフ表示が行われて、ブランチやマージの履歴が表現されます。
@z

@x
[source,console]
----
$ git log --pretty=format:"%h %s" --graph
* 2d3acf9 Ignore errors from SIGCHLD on trap
*  5e3ee11 Merge branch 'master' of git://github.com/dustin/grit
|\
| * 420eac9 Add method for getting the current branch
* | 30e367c Timeout code and tests
* | 5a09431 Add timeout protection to grit
* | e1193f8 Support for heads with slashes in them
|/
* d6016bc Require time for xmlschema
*  11d191e Merge branch 'defunkt' into local
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --pretty=format:"%h %s" --graph
* 2d3acf9 Ignore errors from SIGCHLD on trap
*  5e3ee11 Merge branch 'master' of git://github.com/dustin/grit
|\
| * 420eac9 Add method for getting the current branch
* | 30e367c Timeout code and tests
* | 5a09431 Add timeout protection to grit
* | e1193f8 Support for heads with slashes in them
|/
* d6016bc Require time for xmlschema
*  11d191e Merge branch 'defunkt' into local
----
@z

@x
This type of output will become more interesting as we go through branching and merging in the next chapter.
@y
//////////////////////////
//////////////////////////
このような出力は、後の章に示すブランチ機能やマージに関しての話を進めていけば、興味深く見ていくことになります。
@z

@x
Those are only some simple output-formatting options to `git log` -- there are many more.
<<log_options>> lists the options we've covered so far, as well as some other common formatting options that may be useful, along with how they change the output of the log command.
@y
//////////////////////////
//////////////////////////
`git log` の出力フォーマットオプションとして、ここまでに見てきたのはほんのわずかであって、さらに多くのものがあります。
以下の表 <<log_options>> には、説明してきたオプションの他にも、便利なフォーマットオプションも含めています。
そしてログ出力がどのように変わるかも示します。
@z

@x
[[log_options]]
.Common options to `git log`
[cols="1,4",options="header"]
|================================
| Option            | Description
| `-p`              | Show the patch introduced with each commit.
| `--stat`          | Show statistics for files modified in each commit.
| `--shortstat`     | Display only the changed/insertions/deletions line from the --stat command.
| `--name-only`     | Show the list of files modified after the commit information.
| `--name-status`   | Show the list of files affected with added/modified/deleted information as well.
| `--abbrev-commit` | Show only the first few characters of the SHA-1 checksum instead of all 40.
| `--relative-date` | Display the date in a relative format (for example, "`2 weeks ago`") instead of using the full date format.
| `--graph`         | Display an ASCII graph of the branch and merge history beside the log output.
| `--pretty`        | Show commits in an alternate format. Option values include oneline, short, full, fuller, and format (where you specify your own format).
| `--oneline`       | Shorthand for `--pretty=oneline --abbrev-commit` used together.
|================================
@y
//////////////////////////
//////////////////////////
[[log_options]]
.`git log` の代表的なオプション
[cols="1,4",options="header"]
|================================
| オプション        | 内容説明
| `-p`              | 各コミットから得られるパッチを表示する。
| `--stat`          | 各コミットにおいて、修正されたファイルに対する統計的な情報を表示する。
| `--shortstat`     | --stat コマンドにおいて変更（changed）、挿入（insertions）、削除（deletions）の行のみを表示する。
| `--name-only`     | 各コミット情報の下に修正されたファイルの一覧を表示する。
| `--name-status`   | 修正されたファイルの一覧に追加（added）、修正（modified）、削除（deleted）の情報も加えて表示する。
| `--abbrev-commit` | SHA-1 チェックサム値をはじめの 7 文字のみとし、40 文字すべては表示しない。
| `--relative-date` | 日付の出力書式を全表示とせずに、相対的な日付で（例えば "`2 weeks ago`" のように）表示する。
| `--graph`         | ログ出力情報にアスキー文字によるブランチグラフを表示する。
| `--pretty`        | コミット情報を指定フォーマットにより表示する。オプション値として oneline、short、full、fuller、format が利用可能。（format では独自のフォーマットが指定可能。）
| `--oneline`       | `--pretty=oneline --abbrev-commit` をともに指定したものと同じ。
|================================
@z

@x
==== Limiting Log Output
@y
//////////////////////////
//////////////////////////
==== ログ出力の制限
@z

@x
In addition to output-formatting options, `git log` takes a number of useful limiting options; that is, options that let you show only a subset of commits.
You've seen one such option already -- the `-2` option, which displays only the last two commits.
In fact, you can do `-<n>`, where `n` is any integer to show the last `n` commits.
In reality, you're unlikely to use that often, because Git by default pipes all output through a pager so you see only one page of log output at a time.
@y
//////////////////////////
//////////////////////////
`git log` には、出力フォーマットを指定するオプションだけでなく、ログ出力を制限するオプションもあります。
つまりコミット情報の一部だけを表示するようにできます。
こういったオプションは前にすでに見ていました。
`-2` というオプションです。
これは最新のコミット情報を 2 つだけ出力するものでした。
ちなみにこのオプションは `-<n>` という形であって、`n` に整数値を指定することでその分だけのコミット情報を表示します。
ただしこのオプションを使うことは、そう多くはないでしょう。
Git はデフォルトではページャープログラムに出力結果をパイプにより引き渡すので、ログ出力は 1 ページずつ表示されるからです。
@z

@x
However, the time-limiting options such as `--since` and `--until` are very useful.
For example, this command gets the list of commits made in the last two weeks:
@y
//////////////////////////
//////////////////////////
日時が指定できるオプション `--since`、`--until` などはたいへん便利です。
たとえば以下のコマンドは、直近二週間のコミット情報を表示します。
@z

@x
[source,console]
----
$ git log --since=2.weeks
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --since=2.weeks
----
@z

@x
This command works with lots of formats -- you can specify a specific date like `"2008-01-15"`, or a relative date such as `"2 years 1 day 3 minutes ago"`.
@y
//////////////////////////
//////////////////////////
このオプションはさまざまなフォーマットを指定できます。
たとえば特定の日付を指定するには `\"2008-01-15\"` といったことができます。
また相対的に日付を指定するなら `\"2 years 1 day 3 minutes ago\"` といったこともできます。
@z

@x
You can also filter the list to commits that match some search criteria.
The `--author` option allows you to filter on a specific author, and the `--grep` option lets you search for keywords in the commit messages.
@y
//////////////////////////
//////////////////////////
検索条件を指定してコミット一覧を絞りこむこともできます。
`--author` オプションは、指定する作成者のコミットのみを表示します。
また `--grep` オプションは、コミットメッセージ内をキーワード検索して合致するものを表示します。
@z

@x
[NOTE]
====
You can specify more than one instance of both the `--author` and `--grep` search criteria, which
will limit the commit output to commits that match _any_ of the `--author` patterns and _any_
of the `--grep` patterns; however, adding the `--all-match` option further limits the output to
just those commits that match _all_ `--grep` patterns.
====
@y
//////////////////////////
//////////////////////////
[NOTE]
====
`--author` と `--grep` による検索条件の指定は複数にすることもできます。
そうした場合には `--author` と `--grep` のそれぞれにおいて、いずれかの条件に合致したコミットだけを表示します。
そこにさらに `--all-match` オプションを指定すれば、`--grep` 指定のすべてに合致するものを表示するようになります。
====
@z

@x
Another really helpful filter is the `-S` option (colloquially referred to as Git's "`pickaxe`" option), which takes a string and shows only those commits that changed the number of occurrences of that string.
For instance, if you wanted to find the last commit that added or removed a reference to a specific function, you could call:
@y
//////////////////////////
Another really helpful filter is the `-S` option (colloquially referred to as Git's "`pickaxe`" option), which takes a string and shows only those commits that changed the number of occurrences of that string.
For instance, if you wanted to find the last commit that added or removed a reference to a specific function, you could call:
//////////////////////////
もう 1 つ便利な検索フィルターオプションとして `-S` があります。
（よく Git の「つるはし」（pickaxe）オプションと呼ばれるものです。）
このオプションに文字列を指定することで、その文字列の出現数に変化のあったコミットのみが表示されます。
たとえば特定のプログラム関数への参照を加えたり削除したりしたコミットのうち、最新はどれかを調べたいとすると、以下のように実行して得ることができます。
@z

@x
[source,console]
----
$ git log -S function_name
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log -S <関数名>
----
@z

@x
The last really useful option to pass to `git log` as a filter is a path.
If you specify a directory or file name, you can limit the log output to commits that introduced a change to those files.
This is always the last option and is generally preceded by double dashes (`--`) to separate the paths from the options:
@y
//////////////////////////
//////////////////////////
`git log` オプションの例として最後に示すのは、パスを検索フィルターに指定するものです。
ディレクトリ名やファイル名を指定すると、そういったファイルなどに応じて修正されたコミットのみをログ出力します。
このオプションは必ず最後に指定します。
そして他のオプションとパス名の指定の間に 2 つのダッシュ（`--`）を記述します。
@z

@x
In <<limit_options>> we'll list these and a few other common options for your reference.
@y
//////////////////////////
//////////////////////////
以下の表「<<limit_options>>」では、これまでのオプションにその他のものも加えて一覧に示します。
@z

@x
[[limit_options]]
.Options to limit the output of `git log`
[cols="2,4",options="header"]
|================================
| Option                | Description
| `-<n>`                | Show only the last n commits
| `--since`, `--after`  | Limit the commits to those made after the specified date.
| `--until`, `--before` | Limit the commits to those made before the specified date.
| `--author`            | Only show commits in which the author entry matches the specified string.
| `--committer`         | Only show commits in which the committer entry matches the specified string.
| `--grep`              | Only show commits with a commit message containing the string
| `-S`                  | Only show commits adding or removing code matching the string
|================================
@y
//////////////////////////
//////////////////////////
[[limit_options]]
.`git log` の出力を限定するためのオプション
[cols="2,4",options="header"]
|================================
| オプション            | 内容説明
| `-<n>`                | 最新の n 個のコミット情報を表示する。
| `--since`, `--after`  | 指定する日付以降のコミット情報のみを表示する。
| `--until`, `--before` | 指定する日付以前のコミット情報のみを表示する。
| `--author`            | 指定する文字列が作成者名内に含まれるコミット情報のみ表示する。
| `--committer`         | 指定する文字列がコミットユーザー名に含まれるコミット情報のみ表示する。
| `--grep`              | 指定する文字列がコミットメッセージ内に含まれるコミット情報のみ表示する。
| `-S`                  | 指定する文字列がコード内にて追加、削除されたコミット情報のみ表示する。
|================================
@z

@x
For example, if you want to see which commits modifying test files in the Git source code history were committed by Junio Hamano in the month of October 2008 and are not merge commits, you can run something like this:(((log filtering)))
@y
//////////////////////////
//////////////////////////
たとえば Git ソースコードの履歴の中から、以下に示すようなテストファイルに対しての修正およびコミットを調べたいとします。
Junio Hamano によってコミットされたもの、2008 年 10 月にコミットされたもの、マージコミットでないもの。
具体的なコマンドは以下のようになります。
(((log filtering)))
@z

@x
[source,console]
----
$ git log --pretty="%h - %s" --author='Junio C Hamano' --since="2008-10-01" \
   --before="2008-11-01" --no-merges -- t/
5610e3b - Fix testcase failure when extended attributes are in use
acd3b9e - Enhance hold_lock_file_for_{update,append}() API
f563754 - demonstrate breakage of detached checkout with symbolic link HEAD
d1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths
51a94af - Fix "checkout --track -b newbranch" on detached HEAD
b0ad11e - pull: allow "git pull origin $something:$current_branch" into an unborn branch
----
@y
//////////////////////////
//////////////////////////
[source,端末]
----
$ git log --pretty="%h - %s" --author='Junio C Hamano' --since="2008-10-01" \
   --before="2008-11-01" --no-merges -- t/
5610e3b - Fix testcase failure when extended attributes are in use
acd3b9e - Enhance hold_lock_file_for_{update,append}() API
f563754 - demonstrate breakage of detached checkout with symbolic link HEAD
d1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths
51a94af - Fix "checkout --track -b newbranch" on detached HEAD
b0ad11e - pull: allow "git pull origin $something:$current_branch" into an unborn branch
----
@z

@x
Of the nearly 40,000 commits in the Git source code history, this command shows the 6 that match those criteria.
@y
//////////////////////////
//////////////////////////
Git ソースコードの履歴には 40,000 件近くのコミットがありますが、上のコマンドに合致するものは 6 件であることがわかりました。
@z

@x
[TIP]
.Preventing the display of merge commits
====
Depending on the workflow used in your repository, it's possible that a sizable percentage of the commits in your log history are just merge commits, which typically aren't very informative.
To prevent the display of merge commits cluttering up your log history, simply add the log option `--no-merges`.
====
@y
//////////////////////////
//////////////////////////
[TIP]
.マージコミットを表示しない方法
====
利用するリポジトリでの作業の仕方によっては、ログ履歴のかなりの割合がマージコミットとなってしまうことがあります。
これは通常は、あまり必要となる情報ではありません。
ログ履歴内にごちゃごちゃとマージコミットの情報を表示しないようにするには、ログオプション `--no-merges` をつけます。
====
@z
