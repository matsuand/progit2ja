%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Dulwich
@y
=== Dulwich
@z

@x
(((Dulwich)))(((Python)))
There is also a pure-Python Git implementation - Dulwich.
The project is hosted under https://www.dulwich.io/
It aims to provide an interface to git repositories (both local and remote) that doesn't call out to git directly but instead uses pure Python.
It has an optional C extensions though, that significantly improve the performance.
@y
(((Dulwich)))(((Python)))
There is also a pure-Python Git implementation - Dulwich.
The project is hosted under https://www.dulwich.io/
It aims to provide an interface to git repositories (both local and remote) that doesn't call out to git directly but instead uses pure Python.
It has an optional C extensions though, that significantly improve the performance.
@z

@x
Dulwich follows git design and separate two basic levels of API: plumbing and porcelain.
@y
Dulwich follows git design and separate two basic levels of API: plumbing and porcelain.
@z

@x
Here is an example of using the lower level API to access the commit message of the last commit:
@y
Here is an example of using the lower level API to access the commit message of the last commit:
@z

@x
[source, python]
----
from dulwich.repo import Repo
r = Repo('.')
r.head()
# '57fbe010446356833a6ad1600059d80b1e731e15'
@y
[source, python]
----
from dulwich.repo import Repo
r = Repo('.')
r.head()
# '57fbe010446356833a6ad1600059d80b1e731e15'
@z

@x
c = r[r.head()]
c
# <Commit 015fc1267258458901a94d228e39f0a378370466>
@y
c = r[r.head()]
c
# <Commit 015fc1267258458901a94d228e39f0a378370466>
@z

@x
c.message
# 'Add note about encoding.\n'
----
@y
c.message
# 'Add note about encoding.\n'
----
@z

@x
To print a commit log using high-level porcelain API, one can use:
@y
To print a commit log using high-level porcelain API, one can use:
@z

@x
[source, python]
----
from dulwich import porcelain
porcelain.log('.', max_entries=1)
@y
[source, python]
----
from dulwich import porcelain
porcelain.log('.', max_entries=1)
@z

@x
#commit: 57fbe010446356833a6ad1600059d80b1e731e15
#Author: Jelmer Vernooĳ <jelmer@jelmer.uk>
#Date:   Sat Apr 29 2017 23:57:34 +0000
----
@y
#commit: 57fbe010446356833a6ad1600059d80b1e731e15
#Author: Jelmer Vernooĳ <jelmer@jelmer.uk>
#Date:   Sat Apr 29 2017 23:57:34 +0000
----
@z

@x
==== Further Reading
@y
==== Further Reading
@z

@x
 * The official API documentation is available at https://www.dulwich.io/apidocs/dulwich.html[].
 * Official tutorial at https://www.dulwich.io/docs/tutorial[] has many examples of how to do specific tasks with Dulwich.
@y
 * The official API documentation is available at https://www.dulwich.io/apidocs/dulwich.html[].
 * Official tutorial at https://www.dulwich.io/docs/tutorial[] has many examples of how to do specific tasks with Dulwich.
@z
