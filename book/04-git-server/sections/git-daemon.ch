%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Git Daemon
@y
=== Git Daemon
@z

@x
(((serving repositories, git protocol)))
Next we'll set up a daemon serving repositories using the "`Git`" protocol.
This is a common choice for fast, unauthenticated access to your Git data.
Remember that since this is not an authenticated service, anything you serve over this protocol is public within its network.
@y
(((serving repositories, git protocol)))
Next we'll set up a daemon serving repositories using the "`Git`" protocol.
This is a common choice for fast, unauthenticated access to your Git data.
Remember that since this is not an authenticated service, anything you serve over this protocol is public within its network.
@z

@x
If you're running this on a server outside your firewall, it should be used only for projects that are publicly visible to the world.
If the server you're running it on is inside your firewall, you might use it for projects that a large number of people or computers (continuous integration or build servers) have read-only access to, when you don't want to have to add an SSH key for each.
@y
If you're running this on a server outside your firewall, it should be used only for projects that are publicly visible to the world.
If the server you're running it on is inside your firewall, you might use it for projects that a large number of people or computers (continuous integration or build servers) have read-only access to, when you don't want to have to add an SSH key for each.
@z

@x
In any case, the Git protocol is relatively easy to set up.
Basically, you need to run this command in a daemonized manner:(((git commands, daemon)))
@y
In any case, the Git protocol is relatively easy to set up.
Basically, you need to run this command in a daemonized manner:(((git commands, daemon)))
@z

@x
[source,console]
----
$ git daemon --reuseaddr --base-path=/srv/git/ /srv/git/
----
@y
[source,console]
----
$ git daemon --reuseaddr --base-path=/srv/git/ /srv/git/
----
@z

@x
The `--reuseaddr` option allows the server to restart without waiting for old connections to time out, while the `--base-path` option allows people to clone projects without specifying the entire path, and the path at the end tells the Git daemon where to look for repositories to export.
If you're running a firewall, you'll also need to punch a hole in it at port 9418 on the box you're setting this up on.
@y
The `--reuseaddr` option allows the server to restart without waiting for old connections to time out, while the `--base-path` option allows people to clone projects without specifying the entire path, and the path at the end tells the Git daemon where to look for repositories to export.
If you're running a firewall, you'll also need to punch a hole in it at port 9418 on the box you're setting this up on.
@z

@x
You can daemonize this process a number of ways, depending on the operating system you're running.
@y
You can daemonize this process a number of ways, depending on the operating system you're running.
@z

@x
Since `systemd` is the most common init system among modern Linux distributions, you can use it for that purpose.
Simply place a file in `/etc/systemd/system/git-daemon.service` with these contents:
@y
Since `systemd` is the most common init system among modern Linux distributions, you can use it for that purpose.
Simply place a file in `/etc/systemd/system/git-daemon.service` with these contents:
@z

@x
[source,console]
----
[Unit]
Description=Start Git Daemon
@y
[source,console]
----
[Unit]
Description=Start Git Daemon
@z

@x
[Service]
ExecStart=/usr/bin/git daemon --reuseaddr --base-path=/srv/git/ /srv/git/
@y
[Service]
ExecStart=/usr/bin/git daemon --reuseaddr --base-path=/srv/git/ /srv/git/
@z

@x
Restart=always
RestartSec=500ms
@y
Restart=always
RestartSec=500ms
@z

@x
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=git-daemon
@y
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=git-daemon
@z

@x
User=git
Group=git
@y
User=git
Group=git
@z

@x
[Install]
WantedBy=multi-user.target
----
@y
[Install]
WantedBy=multi-user.target
----
@z

@x
You might have noticed that Git daemon is started here with `git` as both group and user.
Modify it to fit your needs and make sure the provided user exists on the system.
Also, check that the Git binary is indeed located at `/usr/bin/git` and change the path if necessary.
@y
You might have noticed that Git daemon is started here with `git` as both group and user.
Modify it to fit your needs and make sure the provided user exists on the system.
Also, check that the Git binary is indeed located at `/usr/bin/git` and change the path if necessary.
@z

@x
Finally, you'll run `systemctl enable git-daemon` to automatically start the service on boot, and can start and stop the service with, respectively, `systemctl start git-daemon` and `systemctl stop git-daemon`.
@y
Finally, you'll run `systemctl enable git-daemon` to automatically start the service on boot, and can start and stop the service with, respectively, `systemctl start git-daemon` and `systemctl stop git-daemon`.
@z

@x
On other systems, you may want to use `xinetd`, a script in your `sysvinit` system, or something else -- as long as you get that command daemonized and watched somehow.
@y
On other systems, you may want to use `xinetd`, a script in your `sysvinit` system, or something else -- as long as you get that command daemonized and watched somehow.
@z

@x
Next, you have to tell Git which repositories to allow unauthenticated Git server-based access to.
You can do this in each repository by creating a file named `git-daemon-export-ok`.
@y
Next, you have to tell Git which repositories to allow unauthenticated Git server-based access to.
You can do this in each repository by creating a file named `git-daemon-export-ok`.
@z

@x
[source,console]
----
$ cd /path/to/project.git
$ touch git-daemon-export-ok
----
@y
[source,console]
----
$ cd /path/to/project.git
$ touch git-daemon-export-ok
----
@z

@x
The presence of that file tells Git that it's OK to serve this project without authentication.
@y
The presence of that file tells Git that it's OK to serve this project without authentication.
@z
