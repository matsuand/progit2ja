%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
==== Bazaar
(((Bazaar)))(((Importing, from Bazaar)))
@y
==== Bazaar
(((Bazaar)))(((Importing, from Bazaar)))
@z

@x
Bazaar is a DVCS tool much like Git, and as a result it's pretty straightforward to convert a Bazaar repository into a Git one.
To accomplish this, you'll need to import the `bzr-fastimport` plugin.
@y
Bazaar is a DVCS tool much like Git, and as a result it's pretty straightforward to convert a Bazaar repository into a Git one.
To accomplish this, you'll need to import the `bzr-fastimport` plugin.
@z

@x
===== Getting the bzr-fastimport plugin
@y
===== Getting the bzr-fastimport plugin
@z

@x
The procedure for installing the fastimport plugin is different on UNIX-like operating systems and on Windows.
In the first case, the simplest is to install the `bzr-fastimport` package that will install all the required dependencies.
@y
The procedure for installing the fastimport plugin is different on UNIX-like operating systems and on Windows.
In the first case, the simplest is to install the `bzr-fastimport` package that will install all the required dependencies.
@z

@x
For example, with Debian and derived, you would do the following:
@y
For example, with Debian and derived, you would do the following:
@z

@x
[source,console]
----
$ sudo apt-get install bzr-fastimport
----
@y
[source,console]
----
$ sudo apt-get install bzr-fastimport
----
@z

@x
With RHEL, you would do the following:
@y
With RHEL, you would do the following:
@z

@x
[source,console]
----
$ sudo yum install bzr-fastimport
----
@y
[source,console]
----
$ sudo yum install bzr-fastimport
----
@z

@x
With Fedora, since release 22, the new package manager is dnf:
@y
With Fedora, since release 22, the new package manager is dnf:
@z

@x
[source,console]
----
$ sudo dnf install bzr-fastimport
----
@y
[source,console]
----
$ sudo dnf install bzr-fastimport
----
@z

@x
If the package is not available, you may install it as a plugin:
@y
If the package is not available, you may install it as a plugin:
@z

@x
[source,console]
----
$ mkdir --parents ~/.bazaar/plugins     # creates the necessary folders for the plugins
$ cd ~/.bazaar/plugins
$ bzr branch lp:bzr-fastimport fastimport   # imports the fastimport plugin
$ cd fastimport
$ sudo python setup.py install --record=files.txt   # installs the plugin
----
@y
[source,console]
----
$ mkdir --parents ~/.bazaar/plugins     # creates the necessary folders for the plugins
$ cd ~/.bazaar/plugins
$ bzr branch lp:bzr-fastimport fastimport   # imports the fastimport plugin
$ cd fastimport
$ sudo python setup.py install --record=files.txt   # installs the plugin
----
@z

@x
For this plugin to work, you'll also need the `fastimport` Python module.
You can check whether it is present or not and install it with the following commands:
@y
For this plugin to work, you'll also need the `fastimport` Python module.
You can check whether it is present or not and install it with the following commands:
@z

@x
[source,console]
----
$ python -c "import fastimport"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named fastimport
$ pip install fastimport
----
@y
[source,console]
----
$ python -c "import fastimport"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named fastimport
$ pip install fastimport
----
@z

@x
If it is not available, you can download it at address https://pypi.python.org/pypi/fastimport/.
@y
If it is not available, you can download it at address https://pypi.python.org/pypi/fastimport/.
@z

@x
In the second case (on Windows), `bzr-fastimport` is automatically installed with the standalone version and the default installation (let all the checkboxes checked).
So in this case you have nothing to do.
@y
In the second case (on Windows), `bzr-fastimport` is automatically installed with the standalone version and the default installation (let all the checkboxes checked).
So in this case you have nothing to do.
@z

@x
At this point, the way to import a Bazaar repository differs according to that you have a single branch or you are working with a repository that has several branches.
@y
At this point, the way to import a Bazaar repository differs according to that you have a single branch or you are working with a repository that has several branches.
@z

@x
===== Project with a single branch
@y
===== Project with a single branch
@z

@x
Now `cd` in the directory that contains your Bazaar repository and initialize the Git repository:
@y
Now `cd` in the directory that contains your Bazaar repository and initialize the Git repository:
@z

@x
[source,console]
----
$ cd /path/to/the/bzr/repository
$ git init
----
@y
[source,console]
----
$ cd /path/to/the/bzr/repository
$ git init
----
@z

@x
Now, you can simply export your Bazaar repository and convert it into a Git repository using the following command:
@y
Now, you can simply export your Bazaar repository and convert it into a Git repository using the following command:
@z

@x
[source,console]
----
$ bzr fast-export --plain . | git fast-import
----
@y
[source,console]
----
$ bzr fast-export --plain . | git fast-import
----
@z

@x
Depending on the size of the project, your Git repository is built in a lapse from a few seconds to a few minutes.
@y
Depending on the size of the project, your Git repository is built in a lapse from a few seconds to a few minutes.
@z

@x
===== Case of a project with a main branch and a working branch
@y
===== Case of a project with a main branch and a working branch
@z

@x
You can also import a Bazaar repository that contains branches.
Let us suppose that you have two branches: one represents the main branch (myProject.trunk), the other one is the working branch (myProject.work).
@y
You can also import a Bazaar repository that contains branches.
Let us suppose that you have two branches: one represents the main branch (myProject.trunk), the other one is the working branch (myProject.work).
@z

@x
[source,console]
----
$ ls
myProject.trunk myProject.work
----
@y
[source,console]
----
$ ls
myProject.trunk myProject.work
----
@z

@x
Create the Git repository and `cd` into it:
@y
Create the Git repository and `cd` into it:
@z

@x
[source,console]
----
$ git init git-repo
$ cd git-repo
----
@y
[source,console]
----
$ git init git-repo
$ cd git-repo
----
@z

@x
Pull the `master` branch into git:
@y
Pull the `master` branch into git:
@z

@x
[source,console]
----
$ bzr fast-export --export-marks=../marks.bzr ../myProject.trunk | \
git fast-import --export-marks=../marks.git
----
@y
[source,console]
----
$ bzr fast-export --export-marks=../marks.bzr ../myProject.trunk | \
git fast-import --export-marks=../marks.git
----
@z

@x
Pull the working branch into Git:
@y
Pull the working branch into Git:
@z

@x
[source,console]
----
$ bzr fast-export --marks=../marks.bzr --git-branch=work ../myProject.work | \
git fast-import --import-marks=../marks.git --export-marks=../marks.git
----
@y
[source,console]
----
$ bzr fast-export --marks=../marks.bzr --git-branch=work ../myProject.work | \
git fast-import --import-marks=../marks.git --export-marks=../marks.git
----
@z

@x
Now `git branch` shows you the `master` branch as well as the `work` branch.
Check the logs to make sure they're complete and get rid of the `marks.bzr` and `marks.git` files.
@y
Now `git branch` shows you the `master` branch as well as the `work` branch.
Check the logs to make sure they're complete and get rid of the `marks.bzr` and `marks.git` files.
@z

@x
===== Synchronizing the staging area
@y
===== Synchronizing the staging area
@z

@x
Whatever the number of branches you had and the import method you used, your staging area is not synchronized with `HEAD`, and with the import of several branches, your working directory is not synchronized either.
This situation is easily solved by the following command:
@y
Whatever the number of branches you had and the import method you used, your staging area is not synchronized with `HEAD`, and with the import of several branches, your working directory is not synchronized either.
This situation is easily solved by the following command:
@z

@x
[source,console]
----
$ git reset --hard HEAD
----
@y
[source,console]
----
$ git reset --hard HEAD
----
@z

@x
===== Ignoring the files that were ignored with .bzrignore
@y
===== Ignoring the files that were ignored with .bzrignore
@z

@x
Now let's have a look at the files to ignore.
The first thing to do is to rename `.bzrignore` into `.gitignore`.
If the `.bzrignore` file contains one or several lines starting with "!!" or "RE:", you'll have to modify it and perhaps create several `.gitignore` files in order to ignore exactly the same files that Bazaar was ignoring.
@y
Now let's have a look at the files to ignore.
The first thing to do is to rename `.bzrignore` into `.gitignore`.
If the `.bzrignore` file contains one or several lines starting with "!!" or "RE:", you'll have to modify it and perhaps create several `.gitignore` files in order to ignore exactly the same files that Bazaar was ignoring.
@z

@x
Finally, you will have to create a commit that contains this modification for the migration:
@y
Finally, you will have to create a commit that contains this modification for the migration:
@z

@x
[source,console]
----
$ git mv .bzrignore .gitignore
$ # modify .gitignore if needed
$ git commit -am 'Migration from Bazaar to Git'
----
@y
[source,console]
----
$ git mv .bzrignore .gitignore
$ # modify .gitignore if needed
$ git commit -am 'Migration from Bazaar to Git'
----
@z

@x
===== Sending your repository to the server
@y
===== Sending your repository to the server
@z

@x
Here we are!
Now you can push the repository onto its new home server:
@y
Here we are!
Now you can push the repository onto its new home server:
@z

@x
[source,console]
----
$ git remote add origin git@my-git-server:mygitrepository.git
$ git push origin --all
$ git push origin --tags
----
@y
[source,console]
----
$ git remote add origin git@my-git-server:mygitrepository.git
$ git push origin --all
$ git push origin --tags
----
@z

@x
Your Git repository is ready to use.
@y
Your Git repository is ready to use.
@z
