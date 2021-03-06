%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Git in Bash
@y
=== Git in Bash
@z

@x
(((bash)))(((tab completion, bash)))(((shell prompts, bash)))
If you're a Bash user, you can tap into some of your shell's features to make your experience with Git a lot friendlier.
Git actually ships with plugins for several shells, but it's not turned on by default.
@y
(((bash)))(((tab completion, bash)))(((shell prompts, bash)))
If you're a Bash user, you can tap into some of your shell's features to make your experience with Git a lot friendlier.
Git actually ships with plugins for several shells, but it's not turned on by default.
@z

@x
First, you need to get a copy of the `contrib/completion/git-completion.bash` file out of the Git source code.
Copy it somewhere handy, like your home directory, and add this to your `.bashrc`:
@y
First, you need to get a copy of the `contrib/completion/git-completion.bash` file out of the Git source code.
Copy it somewhere handy, like your home directory, and add this to your `.bashrc`:
@z

@x
[source,console]
----
. ~/git-completion.bash
----
@y
[source,console]
----
. ~/git-completion.bash
----
@z

@x
Once that's done, change your directory to a Git repository, and type:
@y
Once that's done, change your directory to a Git repository, and type:
@z

@x
[source,console]
----
$ git chec<tab>
----
@y
[source,console]
----
$ git chec<tab>
----
@z

@x
…and Bash will auto-complete to `git checkout`.
This works with all of Git's subcommands, command-line parameters, and remotes and ref names where appropriate.
@y
…and Bash will auto-complete to `git checkout`.
This works with all of Git's subcommands, command-line parameters, and remotes and ref names where appropriate.
@z

@x
It's also useful to customize your prompt to show information about the current directory's Git repository.
This can be as simple or complex as you want, but there are generally a few key pieces of information that most people want, like the current branch, and the status of the working directory.
To add these to your prompt, just copy the `contrib/completion/git-prompt.sh` file from Git's source repository to your home directory, add something like this to your `.bashrc`:
@y
It's also useful to customize your prompt to show information about the current directory's Git repository.
This can be as simple or complex as you want, but there are generally a few key pieces of information that most people want, like the current branch, and the status of the working directory.
To add these to your prompt, just copy the `contrib/completion/git-prompt.sh` file from Git's source repository to your home directory, add something like this to your `.bashrc`:
@z

@x
[source,console]
----
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
----
@y
[source,console]
----
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
----
@z

@x
The `\w` means print the current working directory, the `\$` prints the `$` part of the prompt, and `__git_ps1 " (%s)"` calls the function provided by `git-prompt.sh` with a formatting argument.
Now your bash prompt will look like this when you're anywhere inside a Git-controlled project:
@y
The `\w` means print the current working directory, the `\$` prints the `$` part of the prompt, and `__git_ps1 " (%s)"` calls the function provided by `git-prompt.sh` with a formatting argument.
Now your bash prompt will look like this when you're anywhere inside a Git-controlled project:
@z

@x
.Customized `bash` prompt
image::images/git-bash.png[Customized `bash` prompt]
@y
.Customized `bash` prompt
image::images/git-bash.png[Customized `bash` prompt]
@z

@x
Both of these scripts come with helpful documentation; take a look at the contents of `git-completion.bash` and `git-prompt.sh` for more information.
@y
Both of these scripts come with helpful documentation; take a look at the contents of `git-completion.bash` and `git-prompt.sh` for more information.
@z
