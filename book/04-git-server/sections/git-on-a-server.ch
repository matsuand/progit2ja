%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_getting_git_on_a_server]]
@y
[[_getting_git_on_a_server]]
@z

@x
=== Getting Git on a Server
@y
//////////////////////////
=== Getting Git on a Server
//////////////////////////
=== Git サーバーの用意
@z

@x
Now we'll cover setting up a Git service running these protocols on your own server.
@y
//////////////////////////
Now we'll cover setting up a Git service running these protocols on your own server.
//////////////////////////
Now we'll cover setting up a Git service running these protocols on your own server.
@z

@x
[NOTE]
====
Here we'll be demonstrating the commands and steps needed to do basic, simplified installations on a Linux-based server, though it's also possible to run these services on macOS or Windows servers.
Actually setting up a production server within your infrastructure will certainly entail differences in security measures or operating system tools, but hopefully this will give you the general idea of what's involved.
====
@y
//////////////////////////
[NOTE]
====
Here we'll be demonstrating the commands and steps needed to do basic, simplified installations on a Linux-based server, though it's also possible to run these services on macOS or Windows servers.
Actually setting up a production server within your infrastructure will certainly entail differences in security measures or operating system tools, but hopefully this will give you the general idea of what's involved.
====
//////////////////////////
[NOTE]
====
Here we'll be demonstrating the commands and steps needed to do basic, simplified installations on a Linux-based server, though it's also possible to run these services on macOS or Windows servers.
Actually setting up a production server within your infrastructure will certainly entail differences in security measures or operating system tools, but hopefully this will give you the general idea of what's involved.
====
@z

@x
In order to initially set up any Git server, you have to export an existing repository into a new bare repository -- a repository that doesn't contain a working directory.
This is generally straightforward to do.
In order to clone your repository to create a new bare repository, you run the clone command with the `--bare` option.(((git commands, clone, bare)))
By convention, bare repository directory names end with the suffix `.git`, like so:
@y
//////////////////////////
In order to initially set up any Git server, you have to export an existing repository into a new bare repository -- a repository that doesn't contain a working directory.
This is generally straightforward to do.
In order to clone your repository to create a new bare repository, you run the clone command with the `--bare` option.(((git commands, clone, bare)))
By convention, bare repository directory names end with the suffix `.git`, like so:
//////////////////////////
In order to initially set up any Git server, you have to export an existing repository into a new bare repository -- a repository that doesn't contain a working directory.
This is generally straightforward to do.
In order to clone your repository to create a new bare repository, you run the clone command with the `--bare` option.(((git commands, clone, bare)))
ベアリポジトリ名は、慣例ではサフィックスとして `.git` をつけます。
たとえば以下のようにします。
@z

@x
[source,console]
----
$ git clone --bare my_project my_project.git
Cloning into bare repository 'my_project.git'...
done.
----
@y
//////////////////////////
[source,console]
----
$ git clone --bare my_project my_project.git
Cloning into bare repository 'my_project.git'...
done.
----
//////////////////////////
[source,端末]
----
$ git clone --bare my_project my_project.git
Cloning into bare repository 'my_project.git'...
done.
----
@z

@x
You should now have a copy of the Git directory data in your `my_project.git` directory.
@y
//////////////////////////
You should now have a copy of the Git directory data in your `my_project.git` directory.
//////////////////////////
You should now have a copy of the Git directory data in your `my_project.git` directory.
@z

@x
This is roughly equivalent to something like:
@y
//////////////////////////
This is roughly equivalent to something like:
//////////////////////////
これはおおざっぱに言えば、以下を実行することと同じです。
@z

@x
[source,console]
----
$ cp -Rf my_project/.git my_project.git
----
@y
//////////////////////////
[source,console]
----
$ cp -Rf my_project/.git my_project.git
----
//////////////////////////
[source,端末]
----
$ cp -Rf my_project/.git my_project.git
----
@z

@x
There are a couple of minor differences in the configuration file but, for your purpose, this is close to the same thing.
It takes the Git repository by itself, without a working directory, and creates a directory specifically for it alone.
@y
//////////////////////////
There are a couple of minor differences in the configuration file but, for your purpose, this is close to the same thing.
It takes the Git repository by itself, without a working directory, and creates a directory specifically for it alone.
//////////////////////////
There are a couple of minor differences in the configuration file but, for your purpose, this is close to the same thing.
It takes the Git repository by itself, without a working directory, and creates a directory specifically for it alone.
@z

@x
[[_bare_repo]]
@y
[[_bare_repo]]
@z

@x
==== Putting the Bare Repository on a Server
@y
//////////////////////////
==== Putting the Bare Repository on a Server
//////////////////////////
==== サーバー上でのベアリポジトリの設置
@z

@x
Now that you have a bare copy of your repository, all you need to do is put it on a server and set up your protocols.
Let's say you've set up a server called `git.example.com` to which you have SSH access, and you want to store all your Git repositories under the `/srv/git` directory.
Assuming that `/srv/git` exists on that server, you can set up your new repository by copying your bare repository over:
@y
//////////////////////////
Now that you have a bare copy of your repository, all you need to do is put it on a server and set up your protocols.
Let's say you've set up a server called `git.example.com` to which you have SSH access, and you want to store all your Git repositories under the `/srv/git` directory.
Assuming that `/srv/git` exists on that server, you can set up your new repository by copying your bare repository over:
//////////////////////////
Now that you have a bare copy of your repository, all you need to do is put it on a server and set up your protocols.
Let's say you've set up a server called `git.example.com` to which you have SSH access, and you want to store all your Git repositories under the `/srv/git` directory.
Assuming that `/srv/git` exists on that server, you can set up your new repository by copying your bare repository over:
@z

@x
[source,console]
----
$ scp -r my_project.git user@git.example.com:/srv/git
----
@y
//////////////////////////
[source,console]
----
$ scp -r my_project.git user@git.example.com:/srv/git
----
//////////////////////////
[source,端末]
----
$ scp -r my_project.git user@git.example.com:/srv/git
----
@z

@x
At this point, other users who have SSH-based read access to the `/srv/git` directory on that server can clone your repository by running:
@y
//////////////////////////
At this point, other users who have SSH-based read access to the `/srv/git` directory on that server can clone your repository by running:
//////////////////////////
At this point, other users who have SSH-based read access to the `/srv/git` directory on that server can clone your repository by running:
@z

@x
[source,console]
----
$ git clone user@git.example.com:/srv/git/my_project.git
----
@y
//////////////////////////
[source,console]
----
$ git clone user@git.example.com:/srv/git/my_project.git
----
//////////////////////////
[source,端末]
----
$ git clone user@git.example.com:/srv/git/my_project.git
----
@z

@x
If a user SSHs into a server and has write access to the `/srv/git/my_project.git` directory, they will also automatically have push access.
@y
//////////////////////////
If a user SSHs into a server and has write access to the `/srv/git/my_project.git` directory, they will also automatically have push access.
//////////////////////////
If a user SSHs into a server and has write access to the `/srv/git/my_project.git` directory, they will also automatically have push access.
@z

@x
Git will automatically add group write permissions to a repository properly if you run the `git init` command with the `--shared` option.
Note that by running this command, you will not destroy any commits, refs, etc. in the process.(((git commands, init, bare)))
@y
//////////////////////////
Git will automatically add group write permissions to a repository properly if you run the `git init` command with the `--shared` option.
Note that by running this command, you will not destroy any commits, refs, etc. in the process.(((git commands, init, bare)))
//////////////////////////
Git will automatically add group write permissions to a repository properly if you run the `git init` command with the `--shared` option.
Note that by running this command, you will not destroy any commits, refs, etc. in the process.(((git commands, init, bare)))
@z

@x
[source,console]
----
$ ssh user@git.example.com
$ cd /srv/git/my_project.git
$ git init --bare --shared
----
@y
//////////////////////////
[source,console]
----
$ ssh user@git.example.com
$ cd /srv/git/my_project.git
$ git init --bare --shared
----
//////////////////////////
[source,端末]
----
$ ssh user@git.example.com
$ cd /srv/git/my_project.git
$ git init --bare --shared
----
@z

@x
You see how easy it is to take a Git repository, create a bare version, and place it on a server to which you and your collaborators have SSH access.
Now you're ready to collaborate on the same project.
@y
//////////////////////////
You see how easy it is to take a Git repository, create a bare version, and place it on a server to which you and your collaborators have SSH access.
Now you're ready to collaborate on the same project.
//////////////////////////
You see how easy it is to take a Git repository, create a bare version, and place it on a server to which you and your collaborators have SSH access.
Now you're ready to collaborate on the same project.
@z

@x
It's important to note that this is literally all you need to do to run a useful Git server to which several people have access -- just add SSH-able accounts on a server, and stick a bare repository somewhere that all those users have read and write access to.
You're ready to go -- nothing else needed.
@y
//////////////////////////
It's important to note that this is literally all you need to do to run a useful Git server to which several people have access -- just add SSH-able accounts on a server, and stick a bare repository somewhere that all those users have read and write access to.
You're ready to go -- nothing else needed.
//////////////////////////
It's important to note that this is literally all you need to do to run a useful Git server to which several people have access -- just add SSH-able accounts on a server, and stick a bare repository somewhere that all those users have read and write access to.
You're ready to go -- nothing else needed.
@z

@x
In the next few sections, you'll see how to expand to more sophisticated setups.
This discussion will include not having to create user accounts for each user, adding public read access to repositories, setting up web UIs and more.
However, keep in mind that to collaborate with a couple of people on a private project, all you _need_ is an SSH server and a bare repository.
@y
//////////////////////////
In the next few sections, you'll see how to expand to more sophisticated setups.
This discussion will include not having to create user accounts for each user, adding public read access to repositories, setting up web UIs and more.
However, keep in mind that to collaborate with a couple of people on a private project, all you _need_ is an SSH server and a bare repository.
//////////////////////////
In the next few sections, you'll see how to expand to more sophisticated setups.
This discussion will include not having to create user accounts for each user, adding public read access to repositories, setting up web UIs and more.
However, keep in mind that to collaborate with a couple of people on a private project, all you _need_ is an SSH server and a bare repository.
@z

@x
==== Small Setups
@y
//////////////////////////
==== Small Setups
//////////////////////////
==== Small Setups
@z

@x
If you're a small outfit or are just trying out Git in your organization and have only a few developers, things can be simple for you.
One of the most complicated aspects of setting up a Git server is user management.
If you want some repositories to be read-only for certain users and read/write for others, access and permissions can be a bit more difficult to arrange.
@y
//////////////////////////
If you're a small outfit or are just trying out Git in your organization and have only a few developers, things can be simple for you.
One of the most complicated aspects of setting up a Git server is user management.
If you want some repositories to be read-only for certain users and read/write for others, access and permissions can be a bit more difficult to arrange.
//////////////////////////
If you're a small outfit or are just trying out Git in your organization and have only a few developers, things can be simple for you.
One of the most complicated aspects of setting up a Git server is user management.
If you want some repositories to be read-only for certain users and read/write for others, access and permissions can be a bit more difficult to arrange.
@z

@x
===== SSH Access
@y
//////////////////////////
===== SSH Access
//////////////////////////
===== SSHアクセス
@z

@x
(((serving repositories, SSH)))
@y
(((serving repositories, SSH)))
@z

@x
If you have a server to which all your developers already have SSH access, it's generally easiest to set up your first repository there, because you have to do almost no work (as we covered in the last section).
If you want more complex access control type permissions on your repositories, you can handle them with the normal filesystem permissions of your server's operating system.
@y
//////////////////////////
If you have a server to which all your developers already have SSH access, it's generally easiest to set up your first repository there, because you have to do almost no work (as we covered in the last section).
If you want more complex access control type permissions on your repositories, you can handle them with the normal filesystem permissions of your server's operating system.
//////////////////////////
If you have a server to which all your developers already have SSH access, it's generally easiest to set up your first repository there, because you have to do almost no work (as we covered in the last section).
If you want more complex access control type permissions on your repositories, you can handle them with the normal filesystem permissions of your server's operating system.
@z

@x
If you want to place your repositories on a server that doesn't have accounts for everyone on your team for whom you want to grant write access, then you must set up SSH access for them.
We assume that if you have a server with which to do this, you already have an SSH server installed, and that's how you're accessing the server.
@y
//////////////////////////
If you want to place your repositories on a server that doesn't have accounts for everyone on your team for whom you want to grant write access, then you must set up SSH access for them.
We assume that if you have a server with which to do this, you already have an SSH server installed, and that's how you're accessing the server.
//////////////////////////
If you want to place your repositories on a server that doesn't have accounts for everyone on your team for whom you want to grant write access, then you must set up SSH access for them.
We assume that if you have a server with which to do this, you already have an SSH server installed, and that's how you're accessing the server.
@z

@x
There are a few ways you can give access to everyone on your team.
The first is to set up accounts for everybody, which is straightforward but can be cumbersome.
You may not want to run `adduser` (or the possible alternative `useradd`) and have to set temporary passwords for every new user.
@y
//////////////////////////
There are a few ways you can give access to everyone on your team.
The first is to set up accounts for everybody, which is straightforward but can be cumbersome.
You may not want to run `adduser` (or the possible alternative `useradd`) and have to set temporary passwords for every new user.
//////////////////////////
There are a few ways you can give access to everyone on your team.
The first is to set up accounts for everybody, which is straightforward but can be cumbersome.
You may not want to run `adduser` (or the possible alternative `useradd`) and have to set temporary passwords for every new user.
@z

@x
A second method is to create a single 'git' user account on the machine, ask every user who is to have write access to send you an SSH public key, and add that key to the `~/.ssh/authorized_keys` file of that new 'git' account.
At that point, everyone will be able to access that machine via the 'git' account.
This doesn't affect the commit data in any way -- the SSH user you connect as doesn't affect the commits you've recorded.
@y
//////////////////////////
A second method is to create a single 'git' user account on the machine, ask every user who is to have write access to send you an SSH public key, and add that key to the `~/.ssh/authorized_keys` file of that new 'git' account.
At that point, everyone will be able to access that machine via the 'git' account.
This doesn't affect the commit data in any way -- the SSH user you connect as doesn't affect the commits you've recorded.
//////////////////////////
A second method is to create a single 'git' user account on the machine, ask every user who is to have write access to send you an SSH public key, and add that key to the `~/.ssh/authorized_keys` file of that new 'git' account.
At that point, everyone will be able to access that machine via the 'git' account.
This doesn't affect the commit data in any way -- the SSH user you connect as doesn't affect the commits you've recorded.
@z

@x
Another way to do it is to have your SSH server authenticate from an LDAP server or some other centralized authentication source that you may already have set up.
As long as each user can get shell access on the machine, any SSH authentication mechanism you can think of should work.
@y
//////////////////////////
Another way to do it is to have your SSH server authenticate from an LDAP server or some other centralized authentication source that you may already have set up.
As long as each user can get shell access on the machine, any SSH authentication mechanism you can think of should work.
//////////////////////////
Another way to do it is to have your SSH server authenticate from an LDAP server or some other centralized authentication source that you may already have set up.
As long as each user can get shell access on the machine, any SSH authentication mechanism you can think of should work.
@z
