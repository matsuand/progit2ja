%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_config]]
=== Git Configuration
@y
[[_git_config]]
=== Git Configuration
@z

@x
(((git commands, config)))
As you read briefly in <<ch01-getting-started#ch01-getting-started>>, you can specify Git configuration settings with the `git config` command.
One of the first things you did was set up your name and email address:
@y
(((git commands, config)))
As you read briefly in <<ch01-getting-started#ch01-getting-started>>, you can specify Git configuration settings with the `git config` command.
One of the first things you did was set up your name and email address:
@z

@x
[source,console]
----
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
----
@y
[source,console]
----
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
----
@z

@x
Now you'll learn a few of the more interesting options that you can set in this manner to customize your Git usage.
@y
Now you'll learn a few of the more interesting options that you can set in this manner to customize your Git usage.
@z

@x
First, a quick review: Git uses a series of configuration files to determine non-default behavior that you may want.
The first place Git looks for these values is in the system-wide `[path]/etc/gitconfig` file, which contains settings that are applied to every user on the system and all of their repositories.
If you pass the option `--system` to `git config`, it reads and writes from this file specifically.
@y
First, a quick review: Git uses a series of configuration files to determine non-default behavior that you may want.
The first place Git looks for these values is in the system-wide `[path]/etc/gitconfig` file, which contains settings that are applied to every user on the system and all of their repositories.
If you pass the option `--system` to `git config`, it reads and writes from this file specifically.
@z

@x
The next place Git looks is the `~/.gitconfig` (or `~/.config/git/config`) file, which is specific to each user.
You can make Git read and write to this file by passing the `--global` option.
@y
The next place Git looks is the `~/.gitconfig` (or `~/.config/git/config`) file, which is specific to each user.
You can make Git read and write to this file by passing the `--global` option.
@z

@x
Finally, Git looks for configuration values in the configuration file in the Git directory (`.git/config`) of whatever repository you're currently using.
These values are specific to that single repository, and represent passing the `--local` option to `git config`.
If you don't specify which level you want to work with, this is the default.
@y
Finally, Git looks for configuration values in the configuration file in the Git directory (`.git/config`) of whatever repository you're currently using.
These values are specific to that single repository, and represent passing the `--local` option to `git config`.
If you don't specify which level you want to work with, this is the default.
@z

@x
Each of these "`levels`" (system, global, local) overwrites values in the previous level, so values in `.git/config` trump those in `[path]/etc/gitconfig`, for instance.
@y
Each of these "`levels`" (system, global, local) overwrites values in the previous level, so values in `.git/config` trump those in `[path]/etc/gitconfig`, for instance.
@z

@x
[NOTE]
====
Git's configuration files are plain-text, so you can also set these values by manually editing the file and inserting the correct syntax.
It's generally easier to run the `git config` command, though.
====
@y
[NOTE]
====
Git's configuration files are plain-text, so you can also set these values by manually editing the file and inserting the correct syntax.
It's generally easier to run the `git config` command, though.
====
@z

@x
==== Basic Client Configuration
@y
==== Basic Client Configuration
@z

@x
The configuration options recognized by Git fall into two categories: client-side and server-side.
The majority of the options are client-side -- configuring your personal working preferences.
Many, _many_ configuration options are supported, but a large fraction of them are useful only in certain edge cases; we'll cover just the most common and useful options here.
If you want to see a list of all the options your version of Git recognizes, you can run:
@y
The configuration options recognized by Git fall into two categories: client-side and server-side.
The majority of the options are client-side -- configuring your personal working preferences.
Many, _many_ configuration options are supported, but a large fraction of them are useful only in certain edge cases; we'll cover just the most common and useful options here.
If you want to see a list of all the options your version of Git recognizes, you can run:
@z

@x
[source,console]
----
$ man git-config
----
@y
[source,console]
----
$ man git-config
----
@z

@x
This command lists all the available options in quite a bit of detail.
You can also find this reference material at https://git-scm.com/docs/git-config[].
@y
This command lists all the available options in quite a bit of detail.
You can also find this reference material at https://git-scm.com/docs/git-config[].
@z

@x
===== `core.editor`
@y
===== `core.editor`
@z

@x
((($EDITOR)))((($VISUAL, see $EDITOR)))
By default, Git uses whatever you've set as your default text editor via one of the shell environment variables `VISUAL` or `EDITOR`, or else falls back to the `vi` editor to create and edit your commit and tag messages.
To change that default to something else, you can use the `core.editor` setting:
@y
((($EDITOR)))((($VISUAL, see $EDITOR)))
By default, Git uses whatever you've set as your default text editor via one of the shell environment variables `VISUAL` or `EDITOR`, or else falls back to the `vi` editor to create and edit your commit and tag messages.
To change that default to something else, you can use the `core.editor` setting:
@z

@x
[source,console]
----
$ git config --global core.editor emacs
----
@y
[source,console]
----
$ git config --global core.editor emacs
----
@z

@x
Now, no matter what is set as your default shell editor, Git will fire up Emacs to edit messages.
@y
Now, no matter what is set as your default shell editor, Git will fire up Emacs to edit messages.
@z

@x
===== `commit.template`
@y
===== `commit.template`
@z

@x
(((commit templates)))
If you set this to the path of a file on your system, Git will use that file as the default initial message when you commit.
The value in creating a custom commit template is that you can use it to remind yourself (or others) of the proper format and style when creating a commit message.
@y
(((commit templates)))
If you set this to the path of a file on your system, Git will use that file as the default initial message when you commit.
The value in creating a custom commit template is that you can use it to remind yourself (or others) of the proper format and style when creating a commit message.
@z

@x
For instance, consider a template file at `~/.gitmessage.txt` that looks like this:
@y
For instance, consider a template file at `~/.gitmessage.txt` that looks like this:
@z

@x
[source,text]
----
Subject line (try to keep under 50 characters)
@y
[source,text]
----
Subject line (try to keep under 50 characters)
@z

@x
Multi-line description of commit,
feel free to be detailed.
@y
Multi-line description of commit,
feel free to be detailed.
@z

@x
[Ticket: X]
----
@y
[Ticket: X]
----
@z

@x
Note how this commit template reminds the committer to keep the subject line short (for the sake of `git log --oneline` output), to add further detail under that, and to refer to an issue or bug tracker ticket number if one exists.
@y
Note how this commit template reminds the committer to keep the subject line short (for the sake of `git log --oneline` output), to add further detail under that, and to refer to an issue or bug tracker ticket number if one exists.
@z

@x
To tell Git to use it as the default message that appears in your editor when you run `git commit`, set the `commit.template` configuration value:
@y
To tell Git to use it as the default message that appears in your editor when you run `git commit`, set the `commit.template` configuration value:
@z

@x
[source,console]
----
$ git config --global commit.template ~/.gitmessage.txt
$ git commit
----
@y
[source,console]
----
$ git config --global commit.template ~/.gitmessage.txt
$ git commit
----
@z

@x
Then, your editor will open to something like this for your placeholder commit message when you commit:
@y
Then, your editor will open to something like this for your placeholder commit message when you commit:
@z

@x
[source,text]
----
Subject line (try to keep under 50 characters)
@y
[source,text]
----
Subject line (try to keep under 50 characters)
@z

@x
Multi-line description of commit,
feel free to be detailed.
@y
Multi-line description of commit,
feel free to be detailed.
@z

@x
[Ticket: X]
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
# modified:   lib/test.rb
#
~
~
".git/COMMIT_EDITMSG" 14L, 297C
----
@y
[Ticket: X]
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
# modified:   lib/test.rb
#
~
~
".git/COMMIT_EDITMSG" 14L, 297C
----
@z

@x
If your team has a commit-message policy, then putting a template for that policy on your system and configuring Git to use it by default can help increase the chance of that policy being followed regularly.
@y
If your team has a commit-message policy, then putting a template for that policy on your system and configuring Git to use it by default can help increase the chance of that policy being followed regularly.
@z

@x
===== `core.pager`
@y
===== `core.pager`
@z

@x
(((pager)))
This setting determines which pager is used when Git pages output such as `log` and `diff`.
You can set it to `more` or to your favorite pager (by default, it's `less`), or you can turn it off by setting it to a blank string:
@y
(((pager)))
This setting determines which pager is used when Git pages output such as `log` and `diff`.
You can set it to `more` or to your favorite pager (by default, it's `less`), or you can turn it off by setting it to a blank string:
@z

@x
[source,console]
----
$ git config --global core.pager ''
----
@y
[source,console]
----
$ git config --global core.pager ''
----
@z

@x
If you run that, Git will page the entire output of all commands, no matter how long they are.
@y
If you run that, Git will page the entire output of all commands, no matter how long they are.
@z

@x
===== `user.signingkey`
@y
===== `user.signingkey`
@z

@x
(((GPG)))
If you're making signed annotated tags (as discussed in <<ch07-git-tools#_signing>>), setting your GPG signing key as a configuration setting makes things easier.
Set your key ID like so:
@y
(((GPG)))
If you're making signed annotated tags (as discussed in <<ch07-git-tools#_signing>>), setting your GPG signing key as a configuration setting makes things easier.
Set your key ID like so:
@z

@x
[source,console]
----
$ git config --global user.signingkey <gpg-key-id>
----
@y
[source,console]
----
$ git config --global user.signingkey <gpg-key-id>
----
@z

@x
Now, you can sign tags without having to specify your key every time with the `git tag` command:
@y
Now, you can sign tags without having to specify your key every time with the `git tag` command:
@z

@x
[source,console]
----
$ git tag -s <tag-name>
----
@y
[source,console]
----
$ git tag -s <tag-name>
----
@z

@x
===== `core.excludesfile`
@y
===== `core.excludesfile`
@z

@x
(((excludes)))(((.gitignore)))
You can put patterns in your project's `.gitignore` file to have Git not see them as untracked files or try to stage them when you run `git add` on them, as discussed in <<ch02-git-basics-chapter#_ignoring>>.
@y
(((excludes)))(((.gitignore)))
You can put patterns in your project's `.gitignore` file to have Git not see them as untracked files or try to stage them when you run `git add` on them, as discussed in <<ch02-git-basics-chapter#_ignoring>>.
@z

@x
But sometimes you want to ignore certain files for all repositories that you work with.
If your computer is running macOS, you're probably familiar with `.DS_Store` files.
If your preferred editor is Emacs or Vim, you know about filenames that end with a `~` or `.swp`.
@y
But sometimes you want to ignore certain files for all repositories that you work with.
If your computer is running macOS, you're probably familiar with `.DS_Store` files.
If your preferred editor is Emacs or Vim, you know about filenames that end with a `~` or `.swp`.
@z

@x
This setting lets you write a kind of global `.gitignore` file.
If you create a `~/.gitignore_global` file with these contents:
@y
This setting lets you write a kind of global `.gitignore` file.
If you create a `~/.gitignore_global` file with these contents:
@z

@x
[source,ini]
----
*~
.*.swp
.DS_Store
----
@y
[source,ini]
----
*~
.*.swp
.DS_Store
----
@z

@x
???and you run `git config --global core.excludesfile ~/.gitignore_global`, Git will never again bother you about those files.
@y
???and you run `git config --global core.excludesfile ~/.gitignore_global`, Git will never again bother you about those files.
@z

@x
===== `help.autocorrect`
@y
===== `help.autocorrect`
@z

@x
(((autocorrect)))
If you mistype a command, it shows you something like this:
@y
(((autocorrect)))
If you mistype a command, it shows you something like this:
@z

@x
[source,console]
----
$ git chekcout master
git: 'chekcout' is not a git command. See 'git --help'.
@y
[source,console]
----
$ git chekcout master
git: 'chekcout' is not a git command. See 'git --help'.
@z

@x
The most similar command is
    checkout
----
@y
The most similar command is
    checkout
----
@z

@x
Git helpfully tries to figure out what you meant, but it still refuses to do it.
If you set `help.autocorrect` to 1, Git will actually run this command for you:
@y
Git helpfully tries to figure out what you meant, but it still refuses to do it.
If you set `help.autocorrect` to 1, Git will actually run this command for you:
@z

@x
[source,console]
----
$ git chekcout master
WARNING: You called a Git command named 'chekcout', which does not exist.
Continuing under the assumption that you meant 'checkout'
in 0.1 seconds automatically...
----
@y
[source,console]
----
$ git chekcout master
WARNING: You called a Git command named 'chekcout', which does not exist.
Continuing under the assumption that you meant 'checkout'
in 0.1 seconds automatically...
----
@z

@x
Note that "`0.1 seconds`" business.
`help.autocorrect` is actually an integer which represents tenths of a second.
So if you set it to 50, Git will give you 5 seconds to change your mind before executing the autocorrected command.
@y
Note that "`0.1 seconds`" business.
`help.autocorrect` is actually an integer which represents tenths of a second.
So if you set it to 50, Git will give you 5 seconds to change your mind before executing the autocorrected command.
@z

@x
==== Colors in Git
@y
==== Colors in Git
@z

@x
(((color)))
Git fully supports colored terminal output, which greatly aids in visually parsing command output quickly and easily.
A number of options can help you set the coloring to your preference.
@y
(((color)))
Git fully supports colored terminal output, which greatly aids in visually parsing command output quickly and easily.
A number of options can help you set the coloring to your preference.
@z

@x
===== `color.ui`
@y
===== `color.ui`
@z

@x
Git automatically colors most of its output, but there's a master switch if you don't like this behavior.
To turn off all Git's colored terminal output, do this:
@y
Git automatically colors most of its output, but there's a master switch if you don't like this behavior.
To turn off all Git's colored terminal output, do this:
@z

@x
[source,console]
----
$ git config --global color.ui false
----
@y
[source,console]
----
$ git config --global color.ui false
----
@z

@x
The default setting is `auto`, which colors output when it's going straight to a terminal, but omits the color-control codes when the output is redirected to a pipe or a file.
@y
The default setting is `auto`, which colors output when it's going straight to a terminal, but omits the color-control codes when the output is redirected to a pipe or a file.
@z

@x
You can also set it to `always` to ignore the difference between terminals and pipes.
You'll rarely want this; in most scenarios, if you want color codes in your redirected output, you can instead pass a `--color` flag to the Git command to force it to use color codes.
The default setting is almost always what you'll want.
@y
You can also set it to `always` to ignore the difference between terminals and pipes.
You'll rarely want this; in most scenarios, if you want color codes in your redirected output, you can instead pass a `--color` flag to the Git command to force it to use color codes.
The default setting is almost always what you'll want.
@z

@x
===== `color.*`
@y
===== `color.*`
@z

@x
If you want to be more specific about which commands are colored and how, Git provides verb-specific coloring settings.
Each of these can be set to `true`, `false`, or `always`:
@y
If you want to be more specific about which commands are colored and how, Git provides verb-specific coloring settings.
Each of these can be set to `true`, `false`, or `always`:
@z

@x
  color.branch
  color.diff
  color.interactive
  color.status
@y
  color.branch
  color.diff
  color.interactive
  color.status
@z

@x
In addition, each of these has subsettings you can use to set specific colors for parts of the output, if you want to override each color.
For example, to set the meta information in your diff output to blue foreground, black background, and bold text, you can run:
@y
In addition, each of these has subsettings you can use to set specific colors for parts of the output, if you want to override each color.
For example, to set the meta information in your diff output to blue foreground, black background, and bold text, you can run:
@z

@x
[source,console]
----
$ git config --global color.diff.meta "blue black bold"
----
@y
[source,console]
----
$ git config --global color.diff.meta "blue black bold"
----
@z

@x
You can set the color to any of the following values: `normal`, `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, or `white`.
If you want an attribute like bold in the previous example, you can choose from `bold`, `dim`, `ul` (underline), `blink`, and `reverse` (swap foreground and background).
@y
You can set the color to any of the following values: `normal`, `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, or `white`.
If you want an attribute like bold in the previous example, you can choose from `bold`, `dim`, `ul` (underline), `blink`, and `reverse` (swap foreground and background).
@z

@x
[[_external_merge_tools]]
==== External Merge and Diff Tools
@y
[[_external_merge_tools]]
==== External Merge and Diff Tools
@z

@x
(((mergetool)))(((difftool)))
Although Git has an internal implementation of diff, which is what we've been showing in this book, you can set up an external tool instead.
You can also set up a graphical merge-conflict-resolution tool instead of having to resolve conflicts manually.
We'll demonstrate setting up the Perforce Visual Merge Tool (P4Merge) to do your diffs and merge resolutions, because it's a nice graphical tool and it's free.
@y
(((mergetool)))(((difftool)))
Although Git has an internal implementation of diff, which is what we've been showing in this book, you can set up an external tool instead.
You can also set up a graphical merge-conflict-resolution tool instead of having to resolve conflicts manually.
We'll demonstrate setting up the Perforce Visual Merge Tool (P4Merge) to do your diffs and merge resolutions, because it's a nice graphical tool and it's free.
@z

@x
If you want to try this out, P4Merge works on all major platforms, so you should be able to do so.
We'll use path names in the examples that work on macOS and Linux systems; for Windows, you'll have to change `/usr/local/bin` to an executable path in your environment.
@y
If you want to try this out, P4Merge works on all major platforms, so you should be able to do so.
We'll use path names in the examples that work on macOS and Linux systems; for Windows, you'll have to change `/usr/local/bin` to an executable path in your environment.
@z

@x
To begin, https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools[download P4Merge from Perforce].
Next, you'll set up external wrapper scripts to run your commands.
We'll use the macOS path for the executable; in other systems, it will be where your `p4merge` binary is installed.
Set up a merge wrapper script named `extMerge` that calls your binary with all the arguments provided:
@y
To begin, https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools[download P4Merge from Perforce].
Next, you'll set up external wrapper scripts to run your commands.
We'll use the macOS path for the executable; in other systems, it will be where your `p4merge` binary is installed.
Set up a merge wrapper script named `extMerge` that calls your binary with all the arguments provided:
@z

@x
[source,console]
----
$ cat /usr/local/bin/extMerge
#!/bin/sh
/Applications/p4merge.app/Contents/MacOS/p4merge $*
----
@y
[source,console]
----
$ cat /usr/local/bin/extMerge
#!/bin/sh
/Applications/p4merge.app/Contents/MacOS/p4merge $*
----
@z

@x
The diff wrapper checks to make sure seven arguments are provided and passes two of them to your merge script.
By default, Git passes the following arguments to the diff program:
@y
The diff wrapper checks to make sure seven arguments are provided and passes two of them to your merge script.
By default, Git passes the following arguments to the diff program:
@z

@x
[source]
----
path old-file old-hex old-mode new-file new-hex new-mode
----
@y
[source]
----
path old-file old-hex old-mode new-file new-hex new-mode
----
@z

@x
Because you only want the `old-file` and `new-file` arguments, you use the wrapper script to pass the ones you need.
@y
Because you only want the `old-file` and `new-file` arguments, you use the wrapper script to pass the ones you need.
@z

@x
[source,console]
----
$ cat /usr/local/bin/extDiff
#!/bin/sh
[ $# -eq 7 ] && /usr/local/bin/extMerge "$2" "$5"
----
@y
[source,console]
----
$ cat /usr/local/bin/extDiff
#!/bin/sh
[ $# -eq 7 ] && /usr/local/bin/extMerge "$2" "$5"
----
@z

@x
You also need to make sure these tools are executable:
@y
You also need to make sure these tools are executable:
@z

@x
[source,console]
----
$ sudo chmod +x /usr/local/bin/extMerge
$ sudo chmod +x /usr/local/bin/extDiff
----
@y
[source,console]
----
$ sudo chmod +x /usr/local/bin/extMerge
$ sudo chmod +x /usr/local/bin/extDiff
----
@z

@x
Now you can set up your config file to use your custom merge resolution and diff tools.
This takes a number of custom settings: `merge.tool` to tell Git what strategy to use, `mergetool.<tool>.cmd` to specify how to run the command, `mergetool.<tool>.trustExitCode` to tell Git if the exit code of that program indicates a successful merge resolution or not, and `diff.external` to tell Git what command to run for diffs.
So, you can either run four config commands:
@y
Now you can set up your config file to use your custom merge resolution and diff tools.
This takes a number of custom settings: `merge.tool` to tell Git what strategy to use, `mergetool.<tool>.cmd` to specify how to run the command, `mergetool.<tool>.trustExitCode` to tell Git if the exit code of that program indicates a successful merge resolution or not, and `diff.external` to tell Git what command to run for diffs.
So, you can either run four config commands:
@z

@x
[source,console]
----
$ git config --global merge.tool extMerge
$ git config --global mergetool.extMerge.cmd \
  'extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
$ git config --global mergetool.extMerge.trustExitCode false
$ git config --global diff.external extDiff
----
or you can edit your `~/.gitconfig` file to add these lines:
@y
[source,console]
----
$ git config --global merge.tool extMerge
$ git config --global mergetool.extMerge.cmd \
  'extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
$ git config --global mergetool.extMerge.trustExitCode false
$ git config --global diff.external extDiff
----
or you can edit your `~/.gitconfig` file to add these lines:
@z

@x
[source,ini]
----
[merge]
  tool = extMerge
[mergetool "extMerge"]
  cmd = extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
  trustExitCode = false
[diff]
  external = extDiff
----
@y
[source,ini]
----
[merge]
  tool = extMerge
[mergetool "extMerge"]
  cmd = extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
  trustExitCode = false
[diff]
  external = extDiff
----
@z

@x
After all this is set, if you run diff commands such as this:
@y
After all this is set, if you run diff commands such as this:
@z

@x
[source,console]
----
$ git diff 32d1776b1^ 32d1776b1
----
@y
[source,console]
----
$ git diff 32d1776b1^ 32d1776b1
----
@z

@x
Instead of getting the diff output on the command line, Git fires up P4Merge, which looks something like this:
@y
Instead of getting the diff output on the command line, Git fires up P4Merge, which looks something like this:
@z

@x
.P4Merge
image::images/p4merge.png[P4Merge]
@y
.P4Merge
image::images/p4merge.png[P4Merge]
@z

@x
If you try to merge two branches and subsequently have merge conflicts, you can run the command `git mergetool`; it starts P4Merge to let you resolve the conflicts through that GUI tool.
@y
If you try to merge two branches and subsequently have merge conflicts, you can run the command `git mergetool`; it starts P4Merge to let you resolve the conflicts through that GUI tool.
@z

@x
The nice thing about this wrapper setup is that you can change your diff and merge tools easily.
For example, to change your `extDiff` and `extMerge` tools to run the KDiff3 tool instead, all you have to do is edit your `extMerge` file:
@y
The nice thing about this wrapper setup is that you can change your diff and merge tools easily.
For example, to change your `extDiff` and `extMerge` tools to run the KDiff3 tool instead, all you have to do is edit your `extMerge` file:
@z

@x
[source,console]
----
$ cat /usr/local/bin/extMerge
#!/bin/sh
/Applications/kdiff3.app/Contents/MacOS/kdiff3 $*
----
@y
[source,console]
----
$ cat /usr/local/bin/extMerge
#!/bin/sh
/Applications/kdiff3.app/Contents/MacOS/kdiff3 $*
----
@z

@x
Now, Git will use the KDiff3 tool for diff viewing and merge conflict resolution.
@y
Now, Git will use the KDiff3 tool for diff viewing and merge conflict resolution.
@z

@x
Git comes preset to use a number of other merge-resolution tools without your having to set up the cmd configuration.
To see a list of the tools it supports, try this:
@y
Git comes preset to use a number of other merge-resolution tools without your having to set up the cmd configuration.
To see a list of the tools it supports, try this:
@z

@x
[source,console]
----
$ git mergetool --tool-help
'git mergetool --tool=<tool>' may be set to one of the following:
        emerge
        gvimdiff
        gvimdiff2
        opendiff
        p4merge
        vimdiff
        vimdiff2
@y
[source,console]
----
$ git mergetool --tool-help
'git mergetool --tool=<tool>' may be set to one of the following:
        emerge
        gvimdiff
        gvimdiff2
        opendiff
        p4merge
        vimdiff
        vimdiff2
@z

@x
The following tools are valid, but not currently available:
        araxis
        bc3
        codecompare
        deltawalker
        diffmerge
        diffuse
        ecmerge
        kdiff3
        meld
        tkdiff
        tortoisemerge
        xxdiff
@y
The following tools are valid, but not currently available:
        araxis
        bc3
        codecompare
        deltawalker
        diffmerge
        diffuse
        ecmerge
        kdiff3
        meld
        tkdiff
        tortoisemerge
        xxdiff
@z

@x
Some of the tools listed above only work in a windowed
environment. If run in a terminal-only session, they will fail.
----
@y
Some of the tools listed above only work in a windowed
environment. If run in a terminal-only session, they will fail.
----
@z

@x
If you're not interested in using KDiff3 for diff but rather want to use it just for merge resolution, and the kdiff3 command is in your path, then you can run:
@y
If you're not interested in using KDiff3 for diff but rather want to use it just for merge resolution, and the kdiff3 command is in your path, then you can run:
@z

@x
[source,console]
----
$ git config --global merge.tool kdiff3
----
@y
[source,console]
----
$ git config --global merge.tool kdiff3
----
@z

@x
If you run this instead of setting up the `extMerge` and `extDiff` files, Git will use KDiff3 for merge resolution and the normal Git diff tool for diffs.
@y
If you run this instead of setting up the `extMerge` and `extDiff` files, Git will use KDiff3 for merge resolution and the normal Git diff tool for diffs.
@z

@x
==== Formatting and Whitespace
@y
==== Formatting and Whitespace
@z

@x
(((whitespace)))
Formatting and whitespace issues are some of the more frustrating and subtle problems that many developers encounter when collaborating, especially cross-platform.
It's very easy for patches or other collaborated work to introduce subtle whitespace changes because editors silently introduce them, and if your files ever touch a Windows system, their line endings might be replaced.
Git has a few configuration options to help with these issues.
@y
(((whitespace)))
Formatting and whitespace issues are some of the more frustrating and subtle problems that many developers encounter when collaborating, especially cross-platform.
It's very easy for patches or other collaborated work to introduce subtle whitespace changes because editors silently introduce them, and if your files ever touch a Windows system, their line endings might be replaced.
Git has a few configuration options to help with these issues.
@z

@x
===== `core.autocrlf`
@y
===== `core.autocrlf`
@z

@x
(((crlf)))(((line endings)))
If you're programming on Windows and working with people who are not (or vice-versa), you'll probably run into line-ending issues at some point.
This is because Windows uses both a carriage-return character and a linefeed character for newlines in its files, whereas macOS and Linux systems use only the linefeed character.
This is a subtle but incredibly annoying fact of cross-platform work; many editors on Windows silently replace existing LF-style line endings with CRLF, or insert both line-ending characters when the user hits the enter key.
@y
(((crlf)))(((line endings)))
If you're programming on Windows and working with people who are not (or vice-versa), you'll probably run into line-ending issues at some point.
This is because Windows uses both a carriage-return character and a linefeed character for newlines in its files, whereas macOS and Linux systems use only the linefeed character.
This is a subtle but incredibly annoying fact of cross-platform work; many editors on Windows silently replace existing LF-style line endings with CRLF, or insert both line-ending characters when the user hits the enter key.
@z

@x
Git can handle this by auto-converting CRLF line endings into LF when you add a file to the index, and vice versa when it checks out code onto your filesystem.
You can turn on this functionality with the `core.autocrlf` setting.
If you're on a Windows machine, set it to `true` -- this converts LF endings into CRLF when you check out code:
@y
Git can handle this by auto-converting CRLF line endings into LF when you add a file to the index, and vice versa when it checks out code onto your filesystem.
You can turn on this functionality with the `core.autocrlf` setting.
If you're on a Windows machine, set it to `true` -- this converts LF endings into CRLF when you check out code:
@z

@x
[source,console]
----
$ git config --global core.autocrlf true
----
@y
[source,console]
----
$ git config --global core.autocrlf true
----
@z

@x
If you're on a Linux or macOS system that uses LF line endings, then you don't want Git to automatically convert them when you check out files; however, if a file with CRLF endings accidentally gets introduced, then you may want Git to fix it.
You can tell Git to convert CRLF to LF on commit but not the other way around by setting `core.autocrlf` to input:
@y
If you're on a Linux or macOS system that uses LF line endings, then you don't want Git to automatically convert them when you check out files; however, if a file with CRLF endings accidentally gets introduced, then you may want Git to fix it.
You can tell Git to convert CRLF to LF on commit but not the other way around by setting `core.autocrlf` to input:
@z

@x
[source,console]
----
$ git config --global core.autocrlf input
----
@y
[source,console]
----
$ git config --global core.autocrlf input
----
@z

@x
This setup should leave you with CRLF endings in Windows checkouts, but LF endings on macOS and Linux systems and in the repository.
@y
This setup should leave you with CRLF endings in Windows checkouts, but LF endings on macOS and Linux systems and in the repository.
@z

@x
If you're a Windows programmer doing a Windows-only project, then you can turn off this functionality, recording the carriage returns in the repository by setting the config value to `false`:
@y
If you're a Windows programmer doing a Windows-only project, then you can turn off this functionality, recording the carriage returns in the repository by setting the config value to `false`:
@z

@x
[source,console]
----
$ git config --global core.autocrlf false
----
@y
[source,console]
----
$ git config --global core.autocrlf false
----
@z

@x
===== `core.whitespace`
@y
===== `core.whitespace`
@z

@x
Git comes preset to detect and fix some whitespace issues.
It can look for six primary whitespace issues -- three are enabled by default and can be turned off, and three are disabled by default but can be activated.
@y
Git comes preset to detect and fix some whitespace issues.
It can look for six primary whitespace issues -- three are enabled by default and can be turned off, and three are disabled by default but can be activated.
@z

@x
The three that are turned on by default are `blank-at-eol`, which looks for spaces at the end of a line; `blank-at-eof`, which notices blank lines at the end of a file; and `space-before-tab`, which looks for spaces before tabs at the beginning of a line.
@y
The three that are turned on by default are `blank-at-eol`, which looks for spaces at the end of a line; `blank-at-eof`, which notices blank lines at the end of a file; and `space-before-tab`, which looks for spaces before tabs at the beginning of a line.
@z

@x
The three that are disabled by default but can be turned on are `indent-with-non-tab`, which looks for lines that begin with spaces instead of tabs (and is controlled by the `tabwidth` option); `tab-in-indent`, which watches for tabs in the indentation portion of a line; and `cr-at-eol`, which tells Git that carriage returns at the end of lines are OK.
@y
The three that are disabled by default but can be turned on are `indent-with-non-tab`, which looks for lines that begin with spaces instead of tabs (and is controlled by the `tabwidth` option); `tab-in-indent`, which watches for tabs in the indentation portion of a line; and `cr-at-eol`, which tells Git that carriage returns at the end of lines are OK.
@z

@x
You can tell Git which of these you want enabled by setting `core.whitespace` to the values you want on or off, separated by commas.
You can disable an option by prepending a `-` in front of its name, or use the default value by leaving it out of the setting string entirely.
For example, if you want all but `space-before-tab` to be set, you can do this (with `trailing-space` being a short-hand to cover both `blank-at-eol` and `blank-at-eof`):
@y
You can tell Git which of these you want enabled by setting `core.whitespace` to the values you want on or off, separated by commas.
You can disable an option by prepending a `-` in front of its name, or use the default value by leaving it out of the setting string entirely.
For example, if you want all but `space-before-tab` to be set, you can do this (with `trailing-space` being a short-hand to cover both `blank-at-eol` and `blank-at-eof`):
@z

@x
[source,console]
----
$ git config --global core.whitespace \
    trailing-space,-space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
----
@y
[source,console]
----
$ git config --global core.whitespace \
    trailing-space,-space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
----
@z

@x
Or you can specify the customizing part only:
@y
Or you can specify the customizing part only:
@z

@x
[source,console]
----
$ git config --global core.whitespace \
    -space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
----
@y
[source,console]
----
$ git config --global core.whitespace \
    -space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
----
@z

@x
Git will detect these issues when you run a `git diff` command and try to color them so you can possibly fix them before you commit.
It will also use these values to help you when you apply patches with `git apply`.
When you're applying patches, you can ask Git to warn you if it's applying patches with the specified whitespace issues:
@y
Git will detect these issues when you run a `git diff` command and try to color them so you can possibly fix them before you commit.
It will also use these values to help you when you apply patches with `git apply`.
When you're applying patches, you can ask Git to warn you if it's applying patches with the specified whitespace issues:
@z

@x
[source,console]
----
$ git apply --whitespace=warn <patch>
----
@y
[source,console]
----
$ git apply --whitespace=warn <patch>
----
@z

@x
Or you can have Git try to automatically fix the issue before applying the patch:
@y
Or you can have Git try to automatically fix the issue before applying the patch:
@z

@x
[source,console]
----
$ git apply --whitespace=fix <patch>
----
@y
[source,console]
----
$ git apply --whitespace=fix <patch>
----
@z

@x
These options apply to the `git rebase` command as well.
If you've committed whitespace issues but haven't yet pushed upstream, you can run `git rebase --whitespace=fix` to have Git automatically fix whitespace issues as it's rewriting the patches.
@y
These options apply to the `git rebase` command as well.
If you've committed whitespace issues but haven't yet pushed upstream, you can run `git rebase --whitespace=fix` to have Git automatically fix whitespace issues as it's rewriting the patches.
@z

@x
==== Server Configuration
@y
==== Server Configuration
@z

@x
Not nearly as many configuration options are available for the server side of Git, but there are a few interesting ones you may want to take note of.
@y
Not nearly as many configuration options are available for the server side of Git, but there are a few interesting ones you may want to take note of.
@z

@x
===== `receive.fsckObjects`
@y
===== `receive.fsckObjects`
@z

@x
Git is capable of making sure every object received during a push still matches its SHA-1 checksum and points to valid objects.
However, it doesn't do this by default; it's a fairly expensive operation, and might slow down the operation, especially on large repositories or pushes.
If you want Git to check object consistency on every push, you can force it to do so by setting `receive.fsckObjects` to true:
@y
Git is capable of making sure every object received during a push still matches its SHA-1 checksum and points to valid objects.
However, it doesn't do this by default; it's a fairly expensive operation, and might slow down the operation, especially on large repositories or pushes.
If you want Git to check object consistency on every push, you can force it to do so by setting `receive.fsckObjects` to true:
@z

@x
[source,console]
----
$ git config --system receive.fsckObjects true
----
@y
[source,console]
----
$ git config --system receive.fsckObjects true
----
@z

@x
Now, Git will check the integrity of your repository before each push is accepted to make sure faulty (or malicious) clients aren't introducing corrupt data.
@y
Now, Git will check the integrity of your repository before each push is accepted to make sure faulty (or malicious) clients aren't introducing corrupt data.
@z

@x
===== `receive.denyNonFastForwards`
@y
===== `receive.denyNonFastForwards`
@z

@x
If you rebase commits that you've already pushed and then try to push again, or otherwise try to push a commit to a remote branch that doesn't contain the commit that the remote branch currently points to, you'll be denied.
This is generally good policy; but in the case of the rebase, you may determine that you know what you're doing and can force-update the remote branch with a `-f` flag to your push command.
@y
If you rebase commits that you've already pushed and then try to push again, or otherwise try to push a commit to a remote branch that doesn't contain the commit that the remote branch currently points to, you'll be denied.
This is generally good policy; but in the case of the rebase, you may determine that you know what you're doing and can force-update the remote branch with a `-f` flag to your push command.
@z

@x
To tell Git to refuse force-pushes, set `receive.denyNonFastForwards`:
@y
To tell Git to refuse force-pushes, set `receive.denyNonFastForwards`:
@z

@x
[source,console]
----
$ git config --system receive.denyNonFastForwards true
----
@y
[source,console]
----
$ git config --system receive.denyNonFastForwards true
----
@z

@x
The other way you can do this is via server-side receive hooks, which we'll cover in a bit.
That approach lets you do more complex things like deny non-fast-forwards to a certain subset of users.
@y
The other way you can do this is via server-side receive hooks, which we'll cover in a bit.
That approach lets you do more complex things like deny non-fast-forwards to a certain subset of users.
@z

@x
===== `receive.denyDeletes`
@y
===== `receive.denyDeletes`
@z

@x
One of the workarounds to the `denyNonFastForwards` policy is for the user to delete the branch and then push it back up with the new reference.
To avoid this, set `receive.denyDeletes` to true:
@y
One of the workarounds to the `denyNonFastForwards` policy is for the user to delete the branch and then push it back up with the new reference.
To avoid this, set `receive.denyDeletes` to true:
@z

@x
[source,console]
----
$ git config --system receive.denyDeletes true
----
@y
[source,console]
----
$ git config --system receive.denyDeletes true
----
@z

@x
This denies any deletion of branches or tags -- no user can do it.
To remove remote branches, you must remove the ref files from the server manually.
There are also more interesting ways to do this on a per-user basis via ACLs, as you'll learn in <<ch08-customizing-git#_an_example_git_enforced_policy>>.
@y
This denies any deletion of branches or tags -- no user can do it.
To remove remote branches, you must remove the ref files from the server manually.
There are also more interesting ways to do this on a per-user basis via ACLs, as you'll learn in <<ch08-customizing-git#_an_example_git_enforced_policy>>.
@z
