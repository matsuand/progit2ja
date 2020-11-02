%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_stashing]]
=== Stashing and Cleaning
@y
[[_git_stashing]]
=== stash と clean
@z

@x
Often, when you've been working on part of your project, things are in a messy state and you want to switch branches for a bit to work on something else.
The problem is, you don't want to do a commit of half-done work just so you can get back to this point later.
The answer to this issue is the `git stash` command.
@y
プロジェクト内のある作業を進めているときに、状況が複雑になってきて、少しだけブランチを切り替えて別の作業をしたくなるときがあります。
問題なのは、やりかけている作業をコミットしたくないときです。
すぐ後で元のところに戻れるようにしておきたい場合です。
こんな状況のときには `git stash` コマンドを使います。
@z

@x
Stashing takes the dirty state of your working directory -- that is, your modified tracked files and staged changes -- and saves it on a stack of unfinished changes that you can reapply at any time (even on a different branch).
@y
stash はワーキングディレクトリ内でのやりかけの状態を保持します。
つまり追跡されているファイルを修正したり、ステージされた内容を変更したり、といった状態です。
こういった状態を、未完了な変更を収めるスタックに保存して、いつでも好きなときに元に戻すことができます。
（異なるブランチに対しても戻すことができます。）
@z

@x
[NOTE]
.Migrating to `git stash push`
====
As of late October 2017, there has been extensive discussion on the Git mailing list, wherein the command `git stash save` is being deprecated in favour of the existing alternative `git stash push`.
The main reason for this is that `git stash push` introduces the option of stashing selected _pathspecs_, something `git stash save` does not support.
@y
[NOTE]
.`git stash push` への移行
====
2017年11月より、Git メーリングリストにおいて大規模な議論が行われました。
その議論において `git stash save` には、これに似た既存のコマンド `git stash push` があることから、`git stash save` が廃止決定されました。
このように決定した主な理由として `git stash push` には、**パス指定** (pathspec) を行う stash オプションがあり、`git stash save` が対応していなかったからです。
@z

@x
`git stash save` is not going away any time soon, so don't worry about it suddenly disappearing.
But you might want to start migrating over to the `push` alternative for the new functionality.
====
@y
`git stash save` はそのうちに削除されます。
急になくなることはないので安心してください。
ただし新たな機能を含む `push` コマンドへの移行を進めるようお願いします。
====
@z

@x
==== Stashing Your Work
@y
==== 作業を stash する
@z

@x
To demonstrate stashing, you'll go into your project and start working on a couple of files and possibly stage one of the changes.
If you run `git status`, you can see your dirty state:
@y
stash の様子を示します。
プロジェクト作業の中で、編集作業を数ファイルに対して行って、そのうちの変更ファイル  1 つをステージに上げたとします。
`git status` を実行すると、編集を行ったダーティな状態は以下のようになるはずです。
@z

@x
[source,console]
----
$ git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb
----
@y
[source,端末]
----
$ git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb
----
@z

@x
Now you want to switch branches, but you don't want to commit what you've been working on yet, so you'll stash the changes.
To push a new stash onto your stack, run `git stash` or `git stash push`:
@y
ここでブランチ切り替えを行うことにしますが、作業途中の状態はコミットしたくありません。
そこで変更作業を stash します。
スタックに対して新たな変更作業を stash するには `git stash` または `git stash push` を実行します。
@z

@x
[source,console]
----
$ git stash
Saved working directory and index state \
  "WIP on master: 049d078 Create index file"
HEAD is now at 049d078 Create index file
(To restore them type "git stash apply")
----
@y
[source,端末]
----
$ git stash
Saved working directory and index state \
  "WIP on master: 049d078 Create index file"
HEAD is now at 049d078 Create index file
(To restore them type "git stash apply")
----
@z

@x
You can now see that your working directory is clean:
@y
こうするとワーキングディレクトリがきれいになります。
@z

@x
[source,console]
----
$ git status
# On branch master
nothing to commit, working directory clean
----
@y
[source,端末]
----
$ git status
# On branch master
nothing to commit, working directory clean
----
@z

@x
At this point, you can switch branches and do work elsewhere; your changes are stored on your stack.
To see which stashes you've stored, you can use `git stash list`:
@y
ここからブランチ切り替えを行って、別のところで作業を行うことができます。
変更作業はスタック内に保存されています。
保存した変更作業がどのようなものであるかは、`git stash list` を実行して確認します。
@z

@x
[source,console]
----
$ git stash list
stash@{0}: WIP on master: 049d078 Create index file
stash@{1}: WIP on master: c264051 Revert "Add file_size"
stash@{2}: WIP on master: 21d80a5 Add number to log
----
@y
[source,端末]
----
$ git stash list
stash@{0}: WIP on master: 049d078 Create index file
stash@{1}: WIP on master: c264051 Revert "Add file_size"
stash@{2}: WIP on master: 21d80a5 Add number to log
----
@z

@x
In this case, two stashes were saved previously, so you have access to three different stashed works.
You can reapply the one you just stashed by using the command shown in the help output of the original stash command: `git stash apply`.
If you want to apply one of the older stashes, you can specify it by naming it, like this: `git stash apply stash@{2}`.
If you don't specify a stash, Git assumes the most recent stash and tries to apply it:
@y
この例においては、すでに 2 つの変更作業が保存されていました。
したがって保存した変更作業が 3 つ示されています。
先ほど stash した内容を元に戻すには、そのとき実行した stash コマンドのヘルプ出力に示された `git stash apply` コマンドを使います。
保存順の古い変更作業を戻したい場合は、その名前を指定します。
たとえば `git stash apply stash@{2}` とします。
名前を指定しなかった場合、Git は最新の変更作業が指定されたものとして、これを元に戻します。
@z

@x
[source,console]
----
$ git stash apply
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   index.html
	modified:   lib/simplegit.rb

no changes added to commit (use "git add" and/or "git commit -a")
----
@y
[source,端末]
----
$ git stash apply
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   index.html
	modified:   lib/simplegit.rb

no changes added to commit (use "git add" and/or "git commit -a")
----
@z

@x
You can see that Git re-modifies the files you reverted when you saved the stash.
In this case, you had a clean working directory when you tried to apply the stash, and you tried to apply it on the same branch you saved it from.
Having a clean working directory and applying it on the same branch aren't necessary to successfully apply a stash.
You can save a stash on one branch, switch to another branch later, and try to reapply the changes.
You can also have modified and uncommitted files in your working directory when you apply a stash -- Git gives you merge conflicts if anything no longer applies cleanly.
@y
保存した変更作業を元に戻したことで、そのファイルが再び修正されたファイルに戻りました。
この例においてはワーキングディレクトリがきれいな状態にあって、そこに変更作業を元に戻しました。
さらに元に戻したブランチは、それを保存したときと同じブランチです。
ワーキングディレクトリがきれいな状態にあるとか、同一のブランチに戻すとかいったことは、変更を元に戻す際に必要なことではありません。
1 つのブランチにおいて変更状態を保存し、それから別のブランチに切り替えて、変更作業をそこで適用することができます。
また変更作業を元に戻す際に、ワーキングディレクトリ内に修正ファイルやコミットしていないファイルがあってもかまいません。
元に戻す処理がうまくいかない場合に Git はマージ時の衝突状態となります。
@z

@x
The changes to your files were reapplied, but the file you staged before wasn't restaged.
To do that, you must run the `git stash apply` command with a `--index` option to tell the command to try to reapply the staged changes.
If you had run that instead, you'd have gotten back to your original position:
@y
ファイルを変更していた状態は元に戻りますが、ステージされていたファイルは、ステージされた状態には戻りませんでした。
ステージされた状態にまで戻すには、`git stash apply` コマンドの実行において `--index` オプションをつける必要があります。
このオプションはステージ状態での変更を元に戻すものです。
先ほどのコマンドの代わりにこれを実行すると、元々の状態に戻ります。
@z

@x
[source,console]
----
$ git stash apply --index
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb
----
@y
[source,端末]
----
$ git stash apply --index
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb
----
@z

@x
The apply option only tries to apply the stashed work -- you continue to have it on your stack.
To remove it, you can run `git stash drop` with the name of the stash to remove:
@y
apply オプションは変更作業を元に戻すだけのものです。
つまりスタック内には変更作業が残り続けます。
変更作業を削除するには `git stash drop` コマンドに、削除対象とする変更作業名をつけて実行します。
@z

@x
[source,console]
----
$ git stash list
stash@{0}: WIP on master: 049d078 Create index file
stash@{1}: WIP on master: c264051 Revert "Add file_size"
stash@{2}: WIP on master: 21d80a5 Add number to log
$ git stash drop stash@{0}
Dropped stash@{0} (364e91f3f268f0900bc3ee613f9f733e82aaed43)
----
@y
[source,端末]
----
$ git stash list
stash@{0}: WIP on master: 049d078 Create index file
stash@{1}: WIP on master: c264051 Revert "Add file_size"
stash@{2}: WIP on master: 21d80a5 Add number to log
$ git stash drop stash@{0}
Dropped stash@{0} (364e91f3f268f0900bc3ee613f9f733e82aaed43)
----
@z

@x
You can also run `git stash pop` to apply the stash and then immediately drop it from your stack.
@y
また `git stash pop` を実行すると、変更作業を元に戻した上で、同時にスタックから変更作業を削除します。
@z

@x
==== Creative Stashing
@y
==== Creative Stashing
@z

@x
There are a few stash variants that may also be helpful.
The first option that is quite popular is the `--keep-index` option to the `git stash` command.
This tells Git to not only include all staged content in the stash being created, but simultaneously leave it in the index.
@y
There are a few stash variants that may also be helpful.
The first option that is quite popular is the `--keep-index` option to the `git stash` command.
This tells Git to not only include all staged content in the stash being created, but simultaneously leave it in the index.
@z

@x
[source,console]
----
$ git status -s
M  index.html
 M lib/simplegit.rb
@y
[source,端末]
----
$ git status -s
M  index.html
 M lib/simplegit.rb
@z

@x
$ git stash --keep-index
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file
@y
$ git stash --keep-index
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file
@z

@x
$ git status -s
M  index.html
----
@y
$ git status -s
M  index.html
----
@z

@x
Another common thing you may want to do with stash is to stash the untracked files as well as the tracked ones.
By default, `git stash` will stash only modified and staged _tracked_ files.
If you specify `--include-untracked` or `-u`, Git will include untracked files in the stash being created.
However, including untracked files in the stash will still not include explicitly _ignored_ files; to additionally include ignored files, use `--all` (or just `-a`).
@y
stash の利用にあたって誰もがやりたいと思う作業として、追跡されているファイルもそうでないファイルも一緒に stash したいというのがあります。
`git stash` はデフォルトでは、**追跡されている** ファイルが修正されるかステージされるときを処理対象にします。
オプションに `--include-untracked` または `-u` を指定すると、変更作業を stash によって保存する際に、追跡されていないファイルも含まれるようになります。
このようにして追跡されていないファイルを stash に含めるとしても、元々明示的に **無視する** 設定を行っているファイルは stash されません。
無視するファイルまで含める場合は `--all` （または `-a` ）を指定します。
@z

@x
[source,console]
----
$ git status -s
M  index.html
 M lib/simplegit.rb
?? new-file.txt
@y
[source,端末]
----
$ git status -s
M  index.html
 M lib/simplegit.rb
?? new-file.txt
@z

@x
$ git stash -u
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file
@y
$ git stash -u
Saved working directory and index state WIP on master: 1b65b17 added the index file
HEAD is now at 1b65b17 added the index file
@z

@x
$ git status -s
$
----
@y
$ git status -s
$
----
@z

@x
Finally, if you specify the `--patch` flag, Git will not stash everything that is modified but will instead prompt you interactively which of the changes you would like to stash and which you would like to keep in your working directory.
@y
Finally, if you specify the `--patch` flag, Git will not stash everything that is modified but will instead prompt you interactively which of the changes you would like to stash and which you would like to keep in your working directory.
@z

@x
[source,console]
----
$ git stash --patch
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index 66d332e..8bb5674 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -16,6 +16,10 @@ class SimpleGit
         return `#{git_cmd} 2>&1`.chomp
       end
     end
+
+    def show(treeish = 'master')
+      command("git show #{treeish}")
+    end
@y
[source,端末]
----
$ git stash --patch
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index 66d332e..8bb5674 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -16,6 +16,10 @@ class SimpleGit
         return `#{git_cmd} 2>&1`.chomp
       end
     end
+
+    def show(treeish = 'master')
+      command("git show #{treeish}")
+    end
@z

@x
 end
 test
Stash this hunk [y,n,q,a,d,/,e,?]? y
@y
 end
 test
Stash this hunk [y,n,q,a,d,/,e,?]? y
@z

@x
Saved working directory and index state WIP on master: 1b65b17 added the index file
----
@y
Saved working directory and index state WIP on master: 1b65b17 added the index file
----
@z

@x
==== Creating a Branch from a Stash
@y
==== stash からのブランチ生成
@z

@x
If you stash some work, leave it there for a while, and continue on the branch from which you stashed the work, you may have a problem reapplying the work.
If the apply tries to modify a file that you've since modified, you'll get a merge conflict and will have to try to resolve it.
If you want an easier way to test the stashed changes again, you can run `git stash branch <new branchname>`, which creates a new branch for you with your selected branch name, checks out the commit you were on when you stashed your work, reapplies your work there, and then drops the stash if it applies successfully:
@y
If you stash some work, leave it there for a while, and continue on the branch from which you stashed the work, you may have a problem reapplying the work.
If the apply tries to modify a file that you've since modified, you'll get a merge conflict and will have to try to resolve it.
If you want an easier way to test the stashed changes again, you can run `git stash branch <new branchname>`, which creates a new branch for you with your selected branch name, checks out the commit you were on when you stashed your work, reapplies your work there, and then drops the stash if it applies successfully:
@z

@x
[source,console]
----
$ git stash branch testchanges
M	index.html
M	lib/simplegit.rb
Switched to a new branch 'testchanges'
On branch testchanges
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html
@y
[source,端末]
----
$ git stash branch testchanges
M	index.html
M	lib/simplegit.rb
Switched to a new branch 'testchanges'
On branch testchanges
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html
@z

@x
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb

Dropped refs/stash@{0} (29d385a81d163dfd45a452a2ce816487a6b8b014)
----
@y
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   lib/simplegit.rb

Dropped refs/stash@{0} (29d385a81d163dfd45a452a2ce816487a6b8b014)
----
@z

@x
This is a nice shortcut to recover stashed work easily and work on it in a new branch.
@y
This is a nice shortcut to recover stashed work easily and work on it in a new branch.
@z

@x
[[_git_clean]]
==== Cleaning your Working Directory
@y
[[_git_clean]]
==== Cleaning your Working Directory
@z

@x
Finally, you may not want to stash some work or files in your working directory, but simply get rid of them; that's what the `git clean` command is for.
@y
Finally, you may not want to stash some work or files in your working directory, but simply get rid of them; that's what the `git clean` command is for.
@z

@x
Some common reasons for cleaning your working directory might be to remove cruft that has been generated by merges or external tools or to remove build artifacts in order to run a clean build.
@y
Some common reasons for cleaning your working directory might be to remove cruft that has been generated by merges or external tools or to remove build artifacts in order to run a clean build.
@z

@x
You'll want to be pretty careful with this command, since it's designed to remove files from your working directory that are not tracked.
If you change your mind, there is often no retrieving the content of those files.
A safer option is to run `git stash --all` to remove everything but save it in a stash.
@y
You'll want to be pretty careful with this command, since it's designed to remove files from your working directory that are not tracked.
If you change your mind, there is often no retrieving the content of those files.
A safer option is to run `git stash --all` to remove everything but save it in a stash.
@z

@x
Assuming you do want to remove cruft files or clean your working directory, you can do so with `git clean`.
To remove all the untracked files in your working directory, you can run `git clean -f -d`, which removes any files and also any subdirectories that become empty as a result.
The `-f` means 'force' or ``really do this,'' and is required if the Git configuration variable `clean.requireForce` is not explicitly set to false.
@y
Assuming you do want to remove cruft files or clean your working directory, you can do so with `git clean`.
To remove all the untracked files in your working directory, you can run `git clean -f -d`, which removes any files and also any subdirectories that become empty as a result.
The `-f` means 'force' or ``really do this,'' and is required if the Git configuration variable `clean.requireForce` is not explicitly set to false.
@z

@x
If you ever want to see what it would do, you can run the command with the `--dry-run` (or `-n`) option, which means ``do a dry run and tell me what you _would_ have removed''.
@y
If you ever want to see what it would do, you can run the command with the `--dry-run` (or `-n`) option, which means ``do a dry run and tell me what you _would_ have removed''.
@z

@x
[source,console]
----
$ git clean -d -n
Would remove test.o
Would remove tmp/
----
@y
[source,console]
----
$ git clean -d -n
Would remove test.o
Would remove tmp/
----
@z

@x
By default, the `git clean` command will only remove untracked files that are not ignored.
Any file that matches a pattern in your `.gitignore` or other ignore files will not be removed.
If you want to remove those files too, such as to remove all `.o` files generated from a build so you can do a fully clean build, you can add a `-x` to the clean command.
@y
By default, the `git clean` command will only remove untracked files that are not ignored.
Any file that matches a pattern in your `.gitignore` or other ignore files will not be removed.
If you want to remove those files too, such as to remove all `.o` files generated from a build so you can do a fully clean build, you can add a `-x` to the clean command.
@z

@x
[source,console]
----
$ git status -s
 M lib/simplegit.rb
?? build.TMP
?? tmp/
@y
[source,console]
----
$ git status -s
 M lib/simplegit.rb
?? build.TMP
?? tmp/
@z

@x
$ git clean -n -d
Would remove build.TMP
Would remove tmp/
@y
$ git clean -n -d
Would remove build.TMP
Would remove tmp/
@z

@x
$ git clean -n -d -x
Would remove build.TMP
Would remove test.o
Would remove tmp/
----
@y
$ git clean -n -d -x
Would remove build.TMP
Would remove test.o
Would remove tmp/
----
@z

@x
If you don't know what the `git clean` command is going to do, always run it with a `-n` first to double check before changing the `-n` to a `-f` and doing it for real.
The other way you can be careful about the process is to run it with the `-i` or ``interactive'' flag.
@y
If you don't know what the `git clean` command is going to do, always run it with a `-n` first to double check before changing the `-n` to a `-f` and doing it for real.
The other way you can be careful about the process is to run it with the `-i` or ``interactive'' flag.
@z

@x
This will run the clean command in an interactive mode.
@y
This will run the clean command in an interactive mode.
@z

@x
[source,console]
----
$ git clean -x -i
Would remove the following items:
  build.TMP  test.o
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers    4: ask each             5: quit
    6: help
What now>
----
@y
[source,console]
----
$ git clean -x -i
Would remove the following items:
  build.TMP  test.o
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers    4: ask each             5: quit
    6: help
What now>
----
@z

@x
This way you can step through each file individually or specify patterns for deletion interactively.
@y
This way you can step through each file individually or specify patterns for deletion interactively.
@z

@x
[NOTE]
====
There is a quirky situation where you might need to be extra forceful in asking Git to clean your working directory.
If you happen to be in a working directory under which you've copied or cloned other Git repositories (perhaps as submodules), even `git clean -fd` will refuse to delete those directories.
In cases like that, you need to add a second `-f` option for emphasis.
====
@y
[NOTE]
====
There is a quirky situation where you might need to be extra forceful in asking Git to clean your working directory.
If you happen to be in a working directory under which you've copied or cloned other Git repositories (perhaps as submodules), even `git clean -fd` will refuse to delete those directories.
In cases like that, you need to add a second `-f` option for emphasis.
====
@z
