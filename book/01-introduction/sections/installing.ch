%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== Installing Git
@y
//////////////////////////
=== Installing Git
//////////////////////////
=== Git のインストール
@z

@x
Before you start using Git, you have to make it available on your computer.
Even if it's already installed, it's probably a good idea to update to the latest version.
You can either install it as a package or via another installer, or download the source code and compile it yourself.
@y
//////////////////////////
Before you start using Git, you have to make it available on your computer.
Even if it's already installed, it's probably a good idea to update to the latest version.
You can either install it as a package or via another installer, or download the source code and compile it yourself.
//////////////////////////
Git を使うからには、まずコンピューター上に Git を導入して利用できるようにすることが必要です。
すでにインストールされている場合は、最新バージョンに更新するのがよいでしょう。
インストールする場合は、パッケージやインストーラーを使ってインストールします。
あるいはソースコードを入手してコンパイルすることもできます。
@z

@x
[NOTE]
====
This book was written using Git version *2.8.0*.
Though most of the commands we use should work even in ancient versions of Git, some of them might not or might act slightly differently if you're using an older version.
Since Git is quite excellent at preserving backwards compatibility, any version after 2.8 should work just fine.
====
@y
//////////////////////////
[NOTE]
====
This book was written using Git version *2.8.0*.
Though most of the commands we use should work even in ancient versions of Git, some of them might not or might act slightly differently if you're using an older version.
Since Git is quite excellent at preserving backwards compatibility, any version after 2.8 should work just fine.
====
//////////////////////////
[NOTE]
====
本書は Git のバージョン *2.8.0* を用いて説明します。
古いバージョンでもコマンド実行はできると思いますが、場合によっては動作しなかったり、動作が異なっていたりすることもあります。
もっとも Git は下位互換性に優れているため、バージョン 2.8 以降であれば問題なく動作するはずです。
====
@z

@x
==== Installing on Linux
@y
//////////////////////////
==== Installing on Linux
//////////////////////////
==== Linux へのインストール
@z

@x
(((Linux, installing)))
If you want to install the basic Git tools on Linux via a binary installer, you can generally do so through the package management tool that comes with your distribution.
If you're on Fedora (or any closely-related RPM-based distribution, such as RHEL or CentOS), you can use `dnf`:
@y
//////////////////////////
(((Linux, installing)))
If you want to install the basic Git tools on Linux via a binary installer, you can generally do so through the package management tool that comes with your distribution.
If you're on Fedora (or any closely-related RPM-based distribution, such as RHEL or CentOS), you can use `dnf`:
//////////////////////////
(((Linux, installing)))
Linux 上においてバイナリインストーラーを使って Git ツール類をインストールする場合は、利用しているディストリビューションが提供している標準的なパッケージ管理ツールを利用します。
例えば Fedora を利用している場合（あるいは Fedora に類似し、RPM ベースのディストリビューションである RHEL や CentOS などの場合）`dnf` を利用します。
@z

@x
[source,console]
----
$ sudo dnf install git-all
----
@y
//////////////////////////
[source,console]
----
$ sudo dnf install git-all
----
//////////////////////////
[source,端末]
----
$ sudo dnf install git-all
----
@z

@x
If you're on a Debian-based distribution, such as Ubuntu, try `apt`:
@y
//////////////////////////
If you're on a Debian-based distribution, such as Ubuntu, try `apt`:
//////////////////////////
また Debian 系のディストリビューション、たとえば Ubuntu などを利用している場合は `apt` を使います。
@z

@x
[source,console]
----
$ sudo apt install git-all
----
@y
//////////////////////////
[source,console]
----
$ sudo apt install git-all
----
//////////////////////////
[source,端末]
----
$ sudo apt install git-all
----
@z

@x
For more options, there are instructions for installing on several different Unix distributions on the Git website, at https://git-scm.com/download/linux[].
@y
//////////////////////////
For more options, there are instructions for installing on several different Unix distributions on the Git website, at https://git-scm.com/download/linux[].
//////////////////////////
Git のウェブサイト https://git-scm.com/download/linux[] には、これ以外の Unix 系システムに対するインストール手順を示しています。
@z

@x
==== Installing on macOS
@y
//////////////////////////
==== Installing on macOS
//////////////////////////
==== Mac へのインストール
@z

@x
(((macOS, installing)))
@y
(((macOS, installing)))
@z

@x
There are several ways to install Git on a Mac.
The easiest is probably to install the Xcode Command Line Tools.(((Xcode)))
On Mavericks (10.9) or above you can do this simply by trying to run `git` from the Terminal the very first time.
@y
//////////////////////////
There are several ways to install Git on a Mac.
The easiest is probably to install the Xcode Command Line Tools.(((Xcode)))
On Mavericks (10.9) or above you can do this simply by trying to run `git` from the Terminal the very first time.
//////////////////////////
Mac 上に Git をインストールする方法はいくつかあります。
一番簡単なのは Xcode コマンドラインツールをインストールするものです。
(((Xcode)))
Mavericks (10.9) またはそれ以降では、ターミナルを開いていきなり `git` と入力するだけです。
@z

@x
[source,console]
----
$ git --version
----
@y
//////////////////////////
[source,console]
----
$ git --version
----
//////////////////////////
[source,端末]
----
$ git --version
----
@z

@x
If you don't have it installed already, it will prompt you to install it.
@y
//////////////////////////
If you don't have it installed already, it will prompt you to install it.
//////////////////////////
インストールされていない場合は、インストールが始まります。
@z

@x
If you want a more up to date version, you can also install it via a binary installer.
A macOS Git installer is maintained and available for download at the Git website, at https://git-scm.com/download/mac[].
@y
//////////////////////////
If you want a more up to date version, you can also install it via a binary installer.
A macOS Git installer is maintained and available for download at the Git website, at https://git-scm.com/download/mac[].
//////////////////////////
できるだけ最新バージョンを利用したいときは、バイナリインストーラーを使ってインストールすることができます。
macOS Git インストーラーというものが提供されていて、Git のウェブサイト https://git-scm.com/download/mac[] から入手することができます。
@z

@x
.Git macOS Installer
image::images/git-osx-installer.png[Git macOS installer]
@y
//////////////////////////
.Git macOS Installer
image::images/git-osx-installer.png[Git macOS installer]
//////////////////////////
.Git macOS インストーラー
image::images/git-osx-installer.png[Git macOS インストーラー]
@z

@x
You can also install it as part of the GitHub for macOS install.
Their GUI Git tool has an option to install command line tools as well.
You can download that tool from the GitHub for macOS website, at https://desktop.github.com[].
@y
//////////////////////////
You can also install it as part of the GitHub for macOS install.
Their GUI Git tool has an option to install command line tools as well.
You can download that tool from the GitHub for macOS website, at https://desktop.github.com[].
//////////////////////////
macOS 用の GitHub をインストールすることにすれば、同時に Git もインストールされます。
GUI ツールを利用して、コマンドラインツールをインストールすることもできます。
この macOS 用 GitHub は https://desktop.github.com[] から入手できます。
@z

@x
==== Installing on Windows
@y
//////////////////////////
==== Installing on Windows
//////////////////////////
==== Windows へのインストール
@z

@x
There are also a few ways to install Git on Windows.(((Windows, installing)))
The most official build is available for download on the Git website.
Just go to https://git-scm.com/download/win[] and the download will start automatically.
Note that this is a project called Git for Windows, which is separate from Git itself; for more information on it, go to https://gitforwindows.org[].
@y
//////////////////////////
There are also a few ways to install Git on Windows.(((Windows, installing)))
The most official build is available for download on the Git website.
Just go to https://git-scm.com/download/win[] and the download will start automatically.
Note that this is a project called Git for Windows, which is separate from Git itself; for more information on it, go to https://gitforwindows.org[].
//////////////////////////
Windows に Git をインストールする方法はいくつかあります。
(((Windows, installing)))
公式に提供されるものは Git のウェブサイトから入手できます。
https://git-scm.com/download/win[] にアクセスすれば、ダウンロードが自動的に始まります。
ここでタウンロードするのは Git for Windows というプロジェクトの配布物であり、Git とは異なるものです。
詳しくは https://gitforwindows.org[] を参照してください。
@z

@x
To get an automated installation you can use the https://chocolatey.org/packages/git[Git Chocolatey package].
Note that the Chocolatey package is community maintained.
@y
//////////////////////////
To get an automated installation you can use the https://chocolatey.org/packages/git[Git Chocolatey package].
Note that the Chocolatey package is community maintained.
//////////////////////////
https://chocolatey.org/packages/git[Git Chocolatey パッケージ] を使うと、自動化されたインストールを行うことができます。
この Chocolatey パッケージは特定のコミュニティがメンテナンスしているものです。
@z

@x
Another easy way to get Git installed is by installing GitHub Desktop.
The installer includes a command line version of Git as well as the GUI.
It also works well with PowerShell, and sets up solid credential caching and sane CRLF settings.(((PowerShell)))(((CRLF)))(((credential caching)))
We'll learn more about those things a little later, but suffice it to say they're things you want.
You can download this from the https://desktop.github.com[GitHub Desktop website].
@y
//////////////////////////
Another easy way to get Git installed is by installing GitHub Desktop.
The installer includes a command line version of Git as well as the GUI.
It also works well with PowerShell, and sets up solid credential caching and sane CRLF settings.(((PowerShell)))(((CRLF)))(((credential caching)))
We'll learn more about those things a little later, but suffice it to say they're things you want.
You can download this from the https://desktop.github.com[GitHub Desktop website].
//////////////////////////
もう 1 つ GitHub Desktop というものもあります。
このインストーラーからは、GUI だけでなくコマンドライン版もインストールされます。
Powershell における動作に優れ、認証情報キャッシュや CRLFS 改行コードの設定も適正に行われます。
(((Powershell)))(((CRLF)))(((credential caching)))
これについては、もう少し後で説明しますが、こういった機能こそ、必要であるものに違いありません。
これは https://desktop.github.com[GitHub Desktop ウェブサイト] から入手することができます。
@z

@x
==== Installing from Source
@y
//////////////////////////
==== Installing from Source
//////////////////////////
==== ソースからのインストール
@z

@x
Some people may instead find it useful to install Git from source, because you'll get the most recent version.
The binary installers tend to be a bit behind, though as Git has matured in recent years, this has made less of a difference.
@y
//////////////////////////
Some people may instead find it useful to install Git from source, because you'll get the most recent version.
The binary installers tend to be a bit behind, though as Git has matured in recent years, this has made less of a difference.
//////////////////////////
Git をソースからインストールすることの方が使いやすいと言う人もいます。
理由は最新バージョンを入手できるからです。
バイナリインストーラーは、どうしてもバージョンが少し古くなってしまいます。
それでも最近の Git は完成したものなので、さほどの違いはありません。
@z

@x
If you do want to install Git from source, you need to have the following libraries that Git depends on: autotools, curl, zlib, openssl, expat, and libiconv.
For example, if you're on a system that has `dnf` (such as Fedora) or `apt-get` (such as a Debian-based system), you can use one of these commands to install the minimal dependencies for compiling and installing the Git binaries:
@y
//////////////////////////
If you do want to install Git from source, you need to have the following libraries that Git depends on: autotools, curl, zlib, openssl, expat, and libiconv.
For example, if you're on a system that has `dnf` (such as Fedora) or `apt-get` (such as a Debian-based system), you can use one of these commands to install the minimal dependencies for compiling and installing the Git binaries:
//////////////////////////
ソースからインストールする場合は、Git が依存する以下のライブラリをインストールしておく必要があります。
それは autotools、curl、zlib、openssl、expat、libiconv です。
例えば Fedora のように `dnf` がある場合、あるいは Debian 系のように `apt-get` がある場合、以下のようなコマンドを実行します。
これによって必要最小限の依存ライブラリがインストールされ、Git のコンパイルとインストールができるようになります。
@z

@x
[source,console]
----
$ sudo dnf install dh-autoreconf curl-devel expat-devel gettext-devel \
  openssl-devel perl-devel zlib-devel
$ sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev
----
@y
//////////////////////////
[source,console]
----
$ sudo dnf install dh-autoreconf curl-devel expat-devel gettext-devel \
  openssl-devel perl-devel zlib-devel
$ sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev
----
//////////////////////////
[source,端末]
----
$ sudo dnf install dh-autoreconf curl-devel expat-devel gettext-devel \
  openssl-devel perl-devel zlib-devel
$ sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev
----
@z

@x
In order to be able to add the documentation in various formats (doc, html, info), these additional dependencies are required:
@y
//////////////////////////
In order to be able to add the documentation in various formats (doc, html, info), these additional dependencies are required:
//////////////////////////
インストールの際にさまざまな形式のドキュメント（doc、html、info）も生成するには、以下のライブラリが必要となります。
@z

@x
[source,console]
----
$ sudo dnf install asciidoc xmlto docbook2X
$ sudo apt-get install asciidoc xmlto docbook2x
----
@y
//////////////////////////
[source,console]
----
$ sudo dnf install asciidoc xmlto docbook2X
$ sudo apt-get install asciidoc xmlto docbook2x
----
//////////////////////////
[source,端末]
----
$ sudo dnf install asciidoc xmlto docbook2X
$ sudo apt-get install asciidoc xmlto docbook2x
----
@z

@x
[NOTE]
====
Users of RHEL and RHEL-derivatives like CentOS and Scientific Linux will have to https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F[enable the EPEL repository] to download the `docbook2X` package.
====
@y
//////////////////////////
[NOTE]
====
Users of RHEL and RHEL-derivatives like CentOS and Scientific Linux will have to https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F[enable the EPEL repository] to download the `docbook2X` package.
====
//////////////////////////
[NOTE]
====
RHEL とこれをベースとする CentOS や Scientific Linux を利用している場合は、依存パッケージの中の `docbook2X` をダウンロードするために、 https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F[EPEL リポジトリを有効にする] ことが必要です。
====
@z

@x
If you're using a Debian-based distribution (Debian/Ubuntu/Ubuntu-derivatives), you also need the `install-info` package:
@y
//////////////////////////
If you're using a Debian-based distribution (Debian/Ubuntu/Ubuntu-derivatives), you also need the `install-info` package:
//////////////////////////
Debian 系のディストリビューション（Debian、Ubuntu、Ubuntu の派生）を利用している場合は `install-info` パッケージも必要になります。
@z

@x
[source,console]
----
$ sudo apt-get install install-info
----
@y
//////////////////////////
[source,console]
----
$ sudo apt-get install install-info
----
//////////////////////////
[source,端末]
----
$ sudo apt-get install install-info
----
@z

@x
If you're using a RPM-based distribution (Fedora/RHEL/RHEL-derivatives), you also need the `getopt` package (which is already installed on a Debian-based distro):
@y
//////////////////////////
If you're using a RPM-based distribution (Fedora/RHEL/RHEL-derivatives), you also need the `getopt` package (which is already installed on a Debian-based distro):
//////////////////////////
RPM ベースのディストリビューション（Fedora、RHEL、RHEL の派生）を利用している場合は `getopt` パッケージも必要です。
（Debian ベースのディストリビューションでは、すでにインストールされています。）
@z

@x
[source,console]
----
$ sudo dnf install getopt
----
@y
//////////////////////////
[source,console]
----
$ sudo dnf install getopt
----
//////////////////////////
[source,端末]
----
$ sudo dnf install getopt
----
@z

@x
Additionally, if you're using Fedora/RHEL/RHEL-derivatives, you need to do this:
@y
//////////////////////////
Additionally, if you're using Fedora/RHEL/RHEL-derivatives, you need to do this:
//////////////////////////
さらに Fedora、RHEL、RHEL 派生のディストリビューションを利用している場合は、以下を実行することが必要です。
@z

@x
[source,console]
----
$ sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
----
@y
//////////////////////////
[source,console]
----
$ sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
----
//////////////////////////
[source,端末]
----
$ sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
----
@z

@x
due to binary name differences.
@y
//////////////////////////
due to binary name differences.
//////////////////////////
これを行うのは実行モジュール名が異なっているからです。
@z

@x
When you have all the necessary dependencies, you can go ahead and grab the latest tagged release tarball from several places.
You can get it via the kernel.org site, at https://www.kernel.org/pub/software/scm/git[], or the mirror on the GitHub website, at https://github.com/git/git/releases[].
It's generally a little clearer what the latest version is on the GitHub page, but the kernel.org page also has release signatures if you want to verify your download.
@y
//////////////////////////
When you have all the necessary dependencies, you can go ahead and grab the latest tagged release tarball from several places.
You can get it via the kernel.org site, at https://www.kernel.org/pub/software/scm/git[], or the mirror on the GitHub website, at https://github.com/git/git/releases[].
It's generally a little clearer what the latest version is on the GitHub page, but the kernel.org page also has release signatures if you want to verify your download.
//////////////////////////
必要な依存ライブラリをインストールしたら、タグづけリリースされている最新の tarball を適当なサイトから入手します。
たとえば kernel.org サイト https://www.kernel.org/pub/software/scm/git[] や GitHub ウェブサイト https://github.com/git/git/releases[] のミラーサイトなどです。
GitHub サイトでは、どれが最新であるかがわかりやすくなっています。
一方、kernel.org サイトでは署名ファイルも提供されているので、ダウンロードの検証を必要とする場合はこちらを利用します。
@z

@x
Then, compile and install:
@y
//////////////////////////
Then, compile and install:
//////////////////////////
コンパイルとインストールを以下のようにして行います。
@z

@x
[source,console]
----
$ tar -zxf git-2.8.0.tar.gz
$ cd git-2.8.0
$ make configure
$ ./configure --prefix=/usr
$ make all doc info
$ sudo make install install-doc install-html install-info
----
@y
//////////////////////////
[source,console]
----
$ tar -zxf git-2.8.0.tar.gz
$ cd git-2.8.0
$ make configure
$ ./configure --prefix=/usr
$ make all doc info
$ sudo make install install-doc install-html install-info
----
//////////////////////////
[source,端末]
----
$ tar -zxf git-2.8.0.tar.gz
$ cd git-2.8.0
$ make configure
$ ./configure --prefix=/usr
$ make all doc info
$ sudo make install install-doc install-html install-info
----
@z

@x
After this is done, you can also get Git via Git itself for updates:
@y
//////////////////////////
After this is done, you can also get Git via Git itself for updates:
//////////////////////////
上の作業を終えたら、その後は Git そのものを使って Git を更新することができます。
@z

@x
[source,console]
----
$ git clone git://git.kernel.org/pub/scm/git/git.git
----
@y
//////////////////////////
[source,console]
----
$ git clone git://git.kernel.org/pub/scm/git/git.git
----
//////////////////////////
[source,端末]
----
$ git clone git://git.kernel.org/pub/scm/git/git.git
----
@z
