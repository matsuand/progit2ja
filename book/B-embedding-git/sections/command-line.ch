%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Command-line Git
@y
=== Command-line Git
@z

@x
One option is to spawn a shell process and use the Git command-line tool to do the work.
This has the benefit of being canonical, and all of Git's features are supported.
This also happens to be fairly easy, as most runtime environments have a relatively simple facility for invoking a process with command-line arguments.
However, this approach does have some downsides.
@y
One option is to spawn a shell process and use the Git command-line tool to do the work.
This has the benefit of being canonical, and all of Git's features are supported.
This also happens to be fairly easy, as most runtime environments have a relatively simple facility for invoking a process with command-line arguments.
However, this approach does have some downsides.
@z

@x
One is that all the output is in plain text.
This means that you'll have to parse Git's occasionally-changing output format to read progress and result information, which can be inefficient and error-prone.
@y
One is that all the output is in plain text.
This means that you'll have to parse Git's occasionally-changing output format to read progress and result information, which can be inefficient and error-prone.
@z

@x
Another is the lack of error recovery.
If a repository is corrupted somehow, or the user has a malformed configuration value, Git will simply refuse to perform many operations.
@y
Another is the lack of error recovery.
If a repository is corrupted somehow, or the user has a malformed configuration value, Git will simply refuse to perform many operations.
@z

@x
Yet another is process management.
Git requires you to maintain a shell environment on a separate process, which can add unwanted complexity.
Trying to coordinate many of these processes (especially when potentially accessing the same repository from several processes) can be quite a challenge.
@y
Yet another is process management.
Git requires you to maintain a shell environment on a separate process, which can add unwanted complexity.
Trying to coordinate many of these processes (especially when potentially accessing the same repository from several processes) can be quite a challenge.
@z
