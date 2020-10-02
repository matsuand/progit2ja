%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_signing]]
=== Signing Your Work
@y
[[_signing]]
=== Signing Your Work
@z

@x
Git is cryptographically secure, but it's not foolproof.
If you're taking work from others on the internet and want to verify that commits are actually from a trusted source, Git has a few ways to sign and verify work using GPG.
@y
Git is cryptographically secure, but it's not foolproof.
If you're taking work from others on the internet and want to verify that commits are actually from a trusted source, Git has a few ways to sign and verify work using GPG.
@z

@x
==== GPG Introduction
@y
==== GPG Introduction
@z

@x
First of all, if you want to sign anything you need to get GPG configured and your personal key installed.
@y
First of all, if you want to sign anything you need to get GPG configured and your personal key installed.
@z

@x
[source,console]
----
$ gpg --list-keys
/Users/schacon/.gnupg/pubring.gpg
---------------------------------
pub   2048R/0A46826A 2014-06-04
uid                  Scott Chacon (Git signing key) <schacon@gmail.com>
sub   2048R/874529A9 2014-06-04
----
@y
[source,console]
----
$ gpg --list-keys
/Users/schacon/.gnupg/pubring.gpg
---------------------------------
pub   2048R/0A46826A 2014-06-04
uid                  Scott Chacon (Git signing key) <schacon@gmail.com>
sub   2048R/874529A9 2014-06-04
----
@z

@x
If you don't have a key installed, you can generate one with `gpg --gen-key`.
@y
If you don't have a key installed, you can generate one with `gpg --gen-key`.
@z

@x
[source,console]
----
$ gpg --gen-key
----
@y
[source,console]
----
$ gpg --gen-key
----
@z

@x
Once you have a private key to sign with, you can configure Git to use it for signing things by setting the `user.signingkey` config setting.
@y
Once you have a private key to sign with, you can configure Git to use it for signing things by setting the `user.signingkey` config setting.
@z

@x
[source,console]
----
$ git config --global user.signingkey 0A46826A
----
@y
[source,console]
----
$ git config --global user.signingkey 0A46826A
----
@z

@x
Now Git will use your key by default to sign tags and commits if you want.
@y
Now Git will use your key by default to sign tags and commits if you want.
@z

@x
==== Signing Tags
@y
==== Signing Tags
@z

@x
If you have a GPG private key setup, you can now use it to sign new tags.
All you have to do is use `-s` instead of `-a`:
@y
If you have a GPG private key setup, you can now use it to sign new tags.
All you have to do is use `-s` instead of `-a`:
@z

@x
[source,console]
----
$ git tag -s v1.5 -m 'my signed 1.5 tag'
@y
[source,console]
----
$ git tag -s v1.5 -m 'my signed 1.5 tag'
@z

@x
You need a passphrase to unlock the secret key for
user: "Ben Straub <ben@straub.cc>"
2048-bit RSA key, ID 800430EB, created 2014-05-04
----
@y
You need a passphrase to unlock the secret key for
user: "Ben Straub <ben@straub.cc>"
2048-bit RSA key, ID 800430EB, created 2014-05-04
----
@z

@x
If you run `git show` on that tag, you can see your GPG signature attached to it:
@y
If you run `git show` on that tag, you can see your GPG signature attached to it:
@z

@x
[source,console]
----
$ git show v1.5
tag v1.5
Tagger: Ben Straub <ben@straub.cc>
Date:   Sat May 3 20:29:41 2014 -0700
@y
[source,console]
----
$ git show v1.5
tag v1.5
Tagger: Ben Straub <ben@straub.cc>
Date:   Sat May 3 20:29:41 2014 -0700
@z

@x
my signed 1.5 tag
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
@y
my signed 1.5 tag
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
@z

@x
iQEcBAABAgAGBQJTZbQlAAoJEF0+sviABDDrZbQH/09PfE51KPVPlanr6q1v4/Ut
LQxfojUWiLQdg2ESJItkcuweYg+kc3HCyFejeDIBw9dpXt00rY26p05qrpnG+85b
hM1/PswpPLuBSr+oCIDj5GMC2r2iEKsfv2fJbNW8iWAXVLoWZRF8B0MfqX/YTMbm
ecorc4iXzQu7tupRihslbNkfvfciMnSDeSvzCpWAHl7h8Wj6hhqePmLm9lAYqnKp
8S5B/1SSQuEAjRZgI4IexpZoeKGVDptPHxLLS38fozsyi0QyDyzEgJxcJQVMXxVi
RUysgqjcpT8+iQM1PblGfHR4XAhuOqN5Fx06PSaFZhqvWFezJ28/CLyX5q+oIVk=
=EFTF
-----END PGP SIGNATURE-----
@y
iQEcBAABAgAGBQJTZbQlAAoJEF0+sviABDDrZbQH/09PfE51KPVPlanr6q1v4/Ut
LQxfojUWiLQdg2ESJItkcuweYg+kc3HCyFejeDIBw9dpXt00rY26p05qrpnG+85b
hM1/PswpPLuBSr+oCIDj5GMC2r2iEKsfv2fJbNW8iWAXVLoWZRF8B0MfqX/YTMbm
ecorc4iXzQu7tupRihslbNkfvfciMnSDeSvzCpWAHl7h8Wj6hhqePmLm9lAYqnKp
8S5B/1SSQuEAjRZgI4IexpZoeKGVDptPHxLLS38fozsyi0QyDyzEgJxcJQVMXxVi
RUysgqjcpT8+iQM1PblGfHR4XAhuOqN5Fx06PSaFZhqvWFezJ28/CLyX5q+oIVk=
=EFTF
-----END PGP SIGNATURE-----
@z

@x
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@y
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700
@z

@x
    Change version number
----
@y
    Change version number
----
@z

@x
==== Verifying Tags
@y
==== Verifying Tags
@z

@x
To verify a signed tag, you use `git tag -v <tag-name>`.
This command uses GPG to verify the signature.
You need the signer's public key in your keyring for this to work properly:
@y
To verify a signed tag, you use `git tag -v <tag-name>`.
This command uses GPG to verify the signature.
You need the signer's public key in your keyring for this to work properly:
@z

@x
[source,console]
----
$ git tag -v v1.4.2.1
object 883653babd8ee7ea23e6a5c392bb739348b1eb61
type commit
tag v1.4.2.1
tagger Junio C Hamano <junkio@cox.net> 1158138501 -0700
@y
[source,console]
----
$ git tag -v v1.4.2.1
object 883653babd8ee7ea23e6a5c392bb739348b1eb61
type commit
tag v1.4.2.1
tagger Junio C Hamano <junkio@cox.net> 1158138501 -0700
@z

@x
GIT 1.4.2.1
@y
GIT 1.4.2.1
@z

@x
Minor fixes since 1.4.2, including git-mv and git-http with alternates.
gpg: Signature made Wed Sep 13 02:08:25 2006 PDT using DSA key ID F3119B9A
gpg: Good signature from "Junio C Hamano <junkio@cox.net>"
gpg:                 aka "[jpeg image of size 1513]"
Primary key fingerprint: 3565 2A26 2040 E066 C9A7  4A7D C0C6 D9A4 F311 9B9A
----
@y
Minor fixes since 1.4.2, including git-mv and git-http with alternates.
gpg: Signature made Wed Sep 13 02:08:25 2006 PDT using DSA key ID F3119B9A
gpg: Good signature from "Junio C Hamano <junkio@cox.net>"
gpg:                 aka "[jpeg image of size 1513]"
Primary key fingerprint: 3565 2A26 2040 E066 C9A7  4A7D C0C6 D9A4 F311 9B9A
----
@z

@x
If you don't have the signer's public key, you get something like this instead:
@y
If you don't have the signer's public key, you get something like this instead:
@z

@x
[source,console]
----
gpg: Signature made Wed Sep 13 02:08:25 2006 PDT using DSA key ID F3119B9A
gpg: Can't check signature: public key not found
error: could not verify the tag 'v1.4.2.1'
----
@y
[source,console]
----
gpg: Signature made Wed Sep 13 02:08:25 2006 PDT using DSA key ID F3119B9A
gpg: Can't check signature: public key not found
error: could not verify the tag 'v1.4.2.1'
----
@z

@x
[[_signing_commits]]
==== Signing Commits
@y
[[_signing_commits]]
==== Signing Commits
@z

@x
In more recent versions of Git (v1.7.9 and above), you can now also sign individual commits.
If you're interested in signing commits directly instead of just the tags, all you need to do is add a `-S` to your `git commit` command.
@y
In more recent versions of Git (v1.7.9 and above), you can now also sign individual commits.
If you're interested in signing commits directly instead of just the tags, all you need to do is add a `-S` to your `git commit` command.
@z

@x
[source,console]
----
$ git commit -a -S -m 'Signed commit'
@y
[source,console]
----
$ git commit -a -S -m 'Signed commit'
@z

@x
You need a passphrase to unlock the secret key for
user: "Scott Chacon (Git signing key) <schacon@gmail.com>"
2048-bit RSA key, ID 0A46826A, created 2014-06-04
@y
You need a passphrase to unlock the secret key for
user: "Scott Chacon (Git signing key) <schacon@gmail.com>"
2048-bit RSA key, ID 0A46826A, created 2014-06-04
@z

@x
[master 5c3386c] Signed commit
 4 files changed, 4 insertions(+), 24 deletions(-)
 rewrite Rakefile (100%)
 create mode 100644 lib/git.rb
----
@y
[master 5c3386c] Signed commit
 4 files changed, 4 insertions(+), 24 deletions(-)
 rewrite Rakefile (100%)
 create mode 100644 lib/git.rb
----
@z

@x
To see and verify these signatures, there is also a `--show-signature` option to `git log`.
@y
To see and verify these signatures, there is also a `--show-signature` option to `git log`.
@z

@x
[source,console]
----
$ git log --show-signature -1
commit 5c3386cf54bba0a33a32da706aa52bc0155503c2
gpg: Signature made Wed Jun  4 19:49:17 2014 PDT using RSA key ID 0A46826A
gpg: Good signature from "Scott Chacon (Git signing key) <schacon@gmail.com>"
Author: Scott Chacon <schacon@gmail.com>
Date:   Wed Jun 4 19:49:17 2014 -0700
@y
[source,console]
----
$ git log --show-signature -1
commit 5c3386cf54bba0a33a32da706aa52bc0155503c2
gpg: Signature made Wed Jun  4 19:49:17 2014 PDT using RSA key ID 0A46826A
gpg: Good signature from "Scott Chacon (Git signing key) <schacon@gmail.com>"
Author: Scott Chacon <schacon@gmail.com>
Date:   Wed Jun 4 19:49:17 2014 -0700
@z

@x
    Signed commit
----
@y
    Signed commit
----
@z

@x
Additionally, you can configure `git log` to check any signatures it finds and list them in its output with the `%G?` format.
@y
Additionally, you can configure `git log` to check any signatures it finds and list them in its output with the `%G?` format.
@z

@x
[source,console]
----
$ git log --pretty="format:%h %G? %aN  %s"
@y
[source,console]
----
$ git log --pretty="format:%h %G? %aN  %s"
@z

@x
5c3386c G Scott Chacon  Signed commit
ca82a6d N Scott Chacon  Change the version number
085bb3b N Scott Chacon  Remove unnecessary test code
a11bef0 N Scott Chacon  Initial commit
----
@y
5c3386c G Scott Chacon  Signed commit
ca82a6d N Scott Chacon  Change the version number
085bb3b N Scott Chacon  Remove unnecessary test code
a11bef0 N Scott Chacon  Initial commit
----
@z

@x
Here we can see that only the latest commit is signed and valid and the previous commits are not.
@y
Here we can see that only the latest commit is signed and valid and the previous commits are not.
@z

@x
In Git 1.8.3 and later, `git merge` and `git pull` can be told to inspect and reject when merging a commit that does not carry a trusted GPG signature with the `--verify-signatures` command.
@y
In Git 1.8.3 and later, `git merge` and `git pull` can be told to inspect and reject when merging a commit that does not carry a trusted GPG signature with the `--verify-signatures` command.
@z

@x
If you use this option when merging a branch and it contains commits that are not signed and valid, the merge will not work.
@y
If you use this option when merging a branch and it contains commits that are not signed and valid, the merge will not work.
@z

@x
[source,console]
----
$ git merge --verify-signatures non-verify
fatal: Commit ab06180 does not have a GPG signature.
----
@y
[source,console]
----
$ git merge --verify-signatures non-verify
fatal: Commit ab06180 does not have a GPG signature.
----
@z

@x
If the merge contains only valid signed commits, the merge command will show you all the signatures it has checked and then move forward with the merge.
@y
If the merge contains only valid signed commits, the merge command will show you all the signatures it has checked and then move forward with the merge.
@z

@x
[source,console]
----
$ git merge --verify-signatures signed-branch
Commit 13ad65e has a good GPG signature by Scott Chacon (Git signing key) <schacon@gmail.com>
Updating 5c3386c..13ad65e
Fast-forward
 README | 2 ++
 1 file changed, 2 insertions(+)
----
@y
[source,console]
----
$ git merge --verify-signatures signed-branch
Commit 13ad65e has a good GPG signature by Scott Chacon (Git signing key) <schacon@gmail.com>
Updating 5c3386c..13ad65e
Fast-forward
 README | 2 ++
 1 file changed, 2 insertions(+)
----
@z

@x
You can also use the `-S` option with the `git merge` command to sign the resulting merge commit itself.
The following example both verifies that every commit in the branch to be merged is signed and furthermore signs the resulting merge commit.
@y
You can also use the `-S` option with the `git merge` command to sign the resulting merge commit itself.
The following example both verifies that every commit in the branch to be merged is signed and furthermore signs the resulting merge commit.
@z

@x
[source,console]
----
$ git merge --verify-signatures -S  signed-branch
Commit 13ad65e has a good GPG signature by Scott Chacon (Git signing key) <schacon@gmail.com>
@y
[source,console]
----
$ git merge --verify-signatures -S  signed-branch
Commit 13ad65e has a good GPG signature by Scott Chacon (Git signing key) <schacon@gmail.com>
@z

@x
You need a passphrase to unlock the secret key for
user: "Scott Chacon (Git signing key) <schacon@gmail.com>"
2048-bit RSA key, ID 0A46826A, created 2014-06-04
@y
You need a passphrase to unlock the secret key for
user: "Scott Chacon (Git signing key) <schacon@gmail.com>"
2048-bit RSA key, ID 0A46826A, created 2014-06-04
@z

@x
Merge made by the 'recursive' strategy.
 README | 2 ++
 1 file changed, 2 insertions(+)
----
@y
Merge made by the 'recursive' strategy.
 README | 2 ++
 1 file changed, 2 insertions(+)
----
@z

@x
==== Everyone Must Sign
@y
==== Everyone Must Sign
@z

@x
Signing tags and commits is great, but if you decide to use this in your normal workflow, you'll have to make sure that everyone on your team understands how to do so.
If you don't, you'll end up spending a lot of time helping people figure out how to rewrite their commits with signed versions.
Make sure you understand GPG and the benefits of signing things before adopting this as part of your standard workflow.
@y
Signing tags and commits is great, but if you decide to use this in your normal workflow, you'll have to make sure that everyone on your team understands how to do so.
If you don't, you'll end up spending a lot of time helping people figure out how to rewrite their commits with signed versions.
Make sure you understand GPG and the benefits of signing things before adopting this as part of your standard workflow.
@z
