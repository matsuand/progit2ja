%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Account Setup and Configuration
@y
=== Account Setup and Configuration
@z

@x
(((GitHub, user accounts)))
The first thing you need to do is set up a free user account.
Simply visit https://github.com[], choose a user name that isn't already taken, provide an email address and a password, and click the big green "`Sign up for GitHub`" button.
@y
(((GitHub, user accounts)))
The first thing you need to do is set up a free user account.
Simply visit https://github.com[], choose a user name that isn't already taken, provide an email address and a password, and click the big green "`Sign up for GitHub`" button.
@z

@x
.The GitHub sign-up form
image::images/signup.png[The GitHub sign-up form]
@y
.The GitHub sign-up form
image::images/signup.png[The GitHub sign-up form]
@z

@x
The next thing you'll see is the pricing page for upgraded plans, but it's safe to ignore this for now.
GitHub will send you an email to verify the address you provided.
Go ahead and do this; it's pretty important (as we'll see later).
@y
The next thing you'll see is the pricing page for upgraded plans, but it's safe to ignore this for now.
GitHub will send you an email to verify the address you provided.
Go ahead and do this; it's pretty important (as we'll see later).
@z

@x
[NOTE]
====
GitHub provides almost all of its functionality with free accounts, except some advanced features.
@y
[NOTE]
====
GitHub provides almost all of its functionality with free accounts, except some advanced features.
@z

@x
GitHub's paid plans include advanced tools and features as well as increased limits for free services, but we won't be covering those in this book.
To get more information about available plans and their comparison, visit https://github.com/pricing[].
====
@y
GitHub's paid plans include advanced tools and features as well as increased limits for free services, but we won't be covering those in this book.
To get more information about available plans and their comparison, visit https://github.com/pricing[].
====
@z

@x
Clicking the Octocat logo at the top-left of the screen will take you to your dashboard page.
You're now ready to use GitHub.
@y
Clicking the Octocat logo at the top-left of the screen will take you to your dashboard page.
You're now ready to use GitHub.
@z

@x
==== SSH Access
@y
==== SSH Access
@z

@x
(((SSH keys, with GitHub)))
As of right now, you're fully able to connect with Git repositories using the `https://` protocol, authenticating with the username and password you just set up.
However, to simply clone public projects, you don't even need to sign up - the account we just created comes into play when we fork projects and push to our forks a bit later.
@y
(((SSH keys, with GitHub)))
As of right now, you're fully able to connect with Git repositories using the `https://` protocol, authenticating with the username and password you just set up.
However, to simply clone public projects, you don't even need to sign up - the account we just created comes into play when we fork projects and push to our forks a bit later.
@z

@x
If you'd like to use SSH remotes, you'll need to configure a public key.
If you don't already have one, see <<ch04-git-on-the-server#_generate_ssh_key>>.
Open up your account settings using the link at the top-right of the window:
@y
If you'd like to use SSH remotes, you'll need to configure a public key.
If you don't already have one, see <<ch04-git-on-the-server#_generate_ssh_key>>.
Open up your account settings using the link at the top-right of the window:
@z

@x
.The "`Account settings`" link
image::images/account-settings.png[The “Account settings” link]
@y
.The "`Account settings`" link
image::images/account-settings.png[The “Account settings” link]
@z

@x
Then select the "`SSH keys`" section along the left-hand side.
@y
Then select the "`SSH keys`" section along the left-hand side.
@z

@x
.The "`SSH keys`" link.
image::images/ssh-keys.png[The “SSH keys” link]
@y
.The "`SSH keys`" link.
image::images/ssh-keys.png[The “SSH keys” link]
@z

@x
From there, click the "`Add an SSH key`" button, give your key a name, paste the contents of your `~/.ssh/id_rsa.pub` (or whatever you named it) public-key file into the text area, and click "`Add key`".
@y
From there, click the "`Add an SSH key`" button, give your key a name, paste the contents of your `~/.ssh/id_rsa.pub` (or whatever you named it) public-key file into the text area, and click "`Add key`".
@z

@x
[NOTE]
====
Be sure to name your SSH key something you can remember.
You can name each of your keys (e.g. "My Laptop" or "Work Account") so that if you need to revoke a key later, you can easily tell which one you're looking for.
====
@y
[NOTE]
====
Be sure to name your SSH key something you can remember.
You can name each of your keys (e.g. "My Laptop" or "Work Account") so that if you need to revoke a key later, you can easily tell which one you're looking for.
====
@z

@x
[[_personal_avatar]]
==== Your Avatar
@y
[[_personal_avatar]]
==== Your Avatar
@z

@x
Next, if you wish, you can replace the avatar that is generated for you with an image of your choosing.
First go to the "`Profile`" tab (above the SSH Keys tab) and click "`Upload new picture`".
@y
Next, if you wish, you can replace the avatar that is generated for you with an image of your choosing.
First go to the "`Profile`" tab (above the SSH Keys tab) and click "`Upload new picture`".
@z

@x
.The "`Profile`" link
image::images/your-profile.png[The “Profile” link]
@y
.The "`Profile`" link
image::images/your-profile.png[The “Profile” link]
@z

@x
We'll choose a copy of the Git logo that is on our hard drive and then we get a chance to crop it.
@y
We'll choose a copy of the Git logo that is on our hard drive and then we get a chance to crop it.
@z

@x
.Crop your avatar
image::images/avatar-crop.png[Crop your uploaded avatar]
@y
.Crop your avatar
image::images/avatar-crop.png[Crop your uploaded avatar]
@z

@x
Now anywhere you interact on the site, people will see your avatar next to your username.
@y
Now anywhere you interact on the site, people will see your avatar next to your username.
@z

@x
If you happen to have uploaded an avatar to the popular Gravatar service (often used for Wordpress accounts), that avatar will be used by default and you don't need to do this step.
@y
If you happen to have uploaded an avatar to the popular Gravatar service (often used for Wordpress accounts), that avatar will be used by default and you don't need to do this step.
@z

@x
==== Your Email Addresses
@y
==== Your Email Addresses
@z

@x
The way that GitHub maps your Git commits to your user is by email address.
If you use multiple email addresses in your commits and you want GitHub to link them up properly, you need to add all the email addresses you have used to the Emails section of the admin section.
@y
The way that GitHub maps your Git commits to your user is by email address.
If you use multiple email addresses in your commits and you want GitHub to link them up properly, you need to add all the email addresses you have used to the Emails section of the admin section.
@z

@x
[[_add_email_addresses]]
.Add email addresses
image::images/email-settings.png[Add all your email addresses]
@y
[[_add_email_addresses]]
.Add email addresses
image::images/email-settings.png[Add all your email addresses]
@z

@x
In <<_add_email_addresses>> we can see some of the different states that are possible.
The top address is verified and set as the primary address, meaning that is where you'll get any notifications and receipts.
The second address is verified and so can be set as the primary if you wish to switch them.
The final address is unverified, meaning that you can't make it your primary address.
If GitHub sees any of these in commit messages in any repository on the site, it will be linked to your user now.
@y
In <<_add_email_addresses>> we can see some of the different states that are possible.
The top address is verified and set as the primary address, meaning that is where you'll get any notifications and receipts.
The second address is verified and so can be set as the primary if you wish to switch them.
The final address is unverified, meaning that you can't make it your primary address.
If GitHub sees any of these in commit messages in any repository on the site, it will be linked to your user now.
@z

@x
==== Two Factor Authentication
@y
==== Two Factor Authentication
@z

@x
Finally, for extra security, you should definitely set up Two-factor Authentication or "`2FA`".
Two-factor Authentication is an authentication mechanism that is becoming more and more popular recently to mitigate the risk of your account being compromised if your password is stolen somehow.
Turning it on will make GitHub ask you for two different methods of authentication, so that if one of them is compromised, an attacker will not be able to access your account.
@y
Finally, for extra security, you should definitely set up Two-factor Authentication or "`2FA`".
Two-factor Authentication is an authentication mechanism that is becoming more and more popular recently to mitigate the risk of your account being compromised if your password is stolen somehow.
Turning it on will make GitHub ask you for two different methods of authentication, so that if one of them is compromised, an attacker will not be able to access your account.
@z

@x
You can find the Two-factor Authentication setup under the Security tab of your Account settings.
@y
You can find the Two-factor Authentication setup under the Security tab of your Account settings.
@z

@x
.2FA in the Security Tab
image::images/2fa-1.png[2FA in the Security Tab]
@y
.2FA in the Security Tab
image::images/2fa-1.png[2FA in the Security Tab]
@z

@x
If you click on the "`Set up two-factor authentication`" button, it will take you to a configuration page where you can choose to use a phone app to generate your secondary code (a "`time based one-time password`"), or you can have GitHub send you a code via SMS each time you need to log in.
@y
If you click on the "`Set up two-factor authentication`" button, it will take you to a configuration page where you can choose to use a phone app to generate your secondary code (a "`time based one-time password`"), or you can have GitHub send you a code via SMS each time you need to log in.
@z

@x
After you choose which method you prefer and follow the instructions for setting up 2FA, your account will then be a little more secure and you will have to provide a code in addition to your password whenever you log into GitHub.
@y
After you choose which method you prefer and follow the instructions for setting up 2FA, your account will then be a little more secure and you will have to provide a code in addition to your password whenever you log into GitHub.
@z
