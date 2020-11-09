%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== About Version Control
@y
//////////////////////////
=== About Version Control
//////////////////////////
=== バージョン管理について
@z

@x
(((version control)))
@y
(((version control)))
@z

@x
What is "`version control`", and why should you care?
Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.
For the examples in this book, you will use software source code as the files being version controlled, though in reality you can do this with nearly any type of file on a computer.
@y
//////////////////////////
What is "`version control`", and why should you care?
Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.
For the examples in this book, you will use software source code as the files being version controlled, though in reality you can do this with nearly any type of file on a computer.
//////////////////////////
(((version control)))
「バージョン管理 (version control)」とは何でしょう？
なぜ気にする必要があるのでしょう？
バージョン管理とは、ファイルに対してある程度の期間にわたって、変更内容を記録するためのシステムです。
これにより、いつでも特定の時期のバージョンを取り出すことができます。
本書では、ソフトウェアのソースコードをバージョン管理していく例を取り上げますが、実際にはコンピューター上にて扱う、どのような種類のファイルでも対象とすることができます。
@z

@x
If you are a graphic or web designer and want to keep every version of an image or layout (which you would most certainly want to), a Version Control System (VCS) is a very wise thing to use.
It allows you to revert selected files back to a previous state, revert the entire project back to a previous state, compare changes over time, see who last modified something that might be causing a problem, who introduced an issue and when, and more.
Using a VCS also generally means that if you screw things up or lose files, you can easily recover.
In addition, you get all this for very little overhead.
@y
//////////////////////////
If you are a graphic or web designer and want to keep every version of an image or layout (which you would most certainly want to), a Version Control System (VCS) is a very wise thing to use.
It allows you to revert selected files back to a previous state, revert the entire project back to a previous state, compare changes over time, see who last modified something that might be causing a problem, who introduced an issue and when, and more.
Using a VCS also generally means that if you screw things up or lose files, you can easily recover.
In addition, you get all this for very little overhead.
//////////////////////////
あなたがグラフィックデザイナーかウェブデザイナーであるとして、画像やレイアウトのあらゆるバージョンを管理したいとします。
(そういったものこそ、管理したいのが実際でしょう。)
こういうときには、バージョン管理システム (Version Control System; VCS) を選ぶのが賢明です。
これを使うと、ファイルの状態を以前のものに戻すことができます。
プロジェクト全体を戻すこともできます。
いつの時点のものであっても違いを比較することができます。
問題が発生したときには、最後に修正した人がだれであるか、だれが問題を引き起こしたかも確認できます。
できることは、まだまだあります。
VCS を使えば、仮にファイルがめちゃくちゃになってしまったり、失ってしまっても、簡単に元に戻すことができます。
しかもこういった作業は、たいした手間をかけずにできることです。
@z

@x
==== Local Version Control Systems
@y
//////////////////////////
==== Local Version Control Systems
//////////////////////////
==== ローカル型のバージョン管理システム
@z

@x
(((version control,local)))
@y
(((version control,local)))
@z

@x
Many people's version-control method of choice is to copy files into another directory (perhaps a time-stamped directory, if they're clever).
This approach is very common because it is so simple, but it is also incredibly error prone.
It is easy to forget which directory you're in and accidentally write to the wrong file or copy over files you don't mean to.
@y
//////////////////////////
Many people's version-control method of choice is to copy files into another directory (perhaps a time-stamped directory, if they're clever).
This approach is very common because it is so simple, but it is also incredibly error prone.
It is easy to forget which directory you're in and accidentally write to the wrong file or copy over files you don't mean to.
//////////////////////////
(((version control,local)))
バージョンを管理するというので、ファイルを別のディレクトリにコピーする方法を行うことがよくあります。
賢い方は日時を含めたディレクトリ名を用いるでしょう。
このやり方はよく行われますが、なぜかと言えば簡単にできるからです。
ただ一方で、誤りが必ず起きるやり方でもあります。
今どのディレクトリにいるのかなんて、すぐ分からなくなります。
うっかりして別のファイルを書き換えてしまったり、そのつもりがないのにファイルを上書きコピーしてしまうこともあります。
@z

@x
To deal with this issue, programmers long ago developed local VCSs that had a simple database that kept all the changes to files under revision control.
@y
//////////////////////////
To deal with this issue, programmers long ago developed local VCSs that had a simple database that kept all the changes to files under revision control.
//////////////////////////
こういった問題点を克服しようと、かつてのプログラマーがローカル型の VCS というものを開発しました。
このシステムには単純なデータベースがあり、ファイルに対しての変更をすべてリビジョン管理 (revision control) という形により記録していました。
@z

@x
.Local version control
image::images/local.png[Local version control diagram]
@y
//////////////////////////
.Local version control
image::images/local.png[Local version control diagram]
//////////////////////////
.ローカル型バージョン管理
image::images/local.png[ローカル型バージョン管理の概要図]
@z

@x
One of the most popular VCS tools was a system called RCS, which is still distributed with many computers today.
https://www.gnu.org/software/rcs/[RCS] works by keeping patch sets (that is, the differences between files) in a special format on disk; it can then re-create what any file looked like at any point in time by adding up all the patches.
@y
//////////////////////////
One of the most popular VCS tools was a system called RCS, which is still distributed with many computers today.
https://www.gnu.org/software/rcs/[RCS] works by keeping patch sets (that is, the differences between files) in a special format on disk; it can then re-create what any file looked like at any point in time by adding up all the patches.
//////////////////////////
かつて人気を博した VCS ツールとして RCS というものがあります。
このシステムは今でも、各種コンピューター向けに提供されています。
https://www.gnu.org/software/rcs/[RCS] ではパッチセット (つまりファイルの変更差異を表わすもの) を、独自のフォーマットにより保持しながら動作します。
どのファイルであっても過去のどの時点でも、そのパッチを重ね合わせて適用することで再生成できるようになっています。
@z

@x
==== Centralized Version Control Systems
@y
//////////////////////////
==== Centralized Version Control Systems
//////////////////////////
==== 集中型バージョン管理システム
@z

@x
(((version control,centralized)))
@y
(((version control,centralized)))
@z

@x
The next major issue that people encounter is that they need to collaborate with developers on other systems.
To deal with this problem, Centralized Version Control Systems (CVCSs) were developed.
These systems (such as CVS, Subversion, and Perforce) have a single server that contains all the versioned files, and a number of clients that check out files from that central place. (((CVS)))(((Subversion)))(((Perforce)))
For many years, this has been the standard for version control.
@y
//////////////////////////
The next major issue that people encounter is that they need to collaborate with developers on other systems.
To deal with this problem, Centralized Version Control Systems (CVCSs) were developed.
These systems (such as CVS, Subversion, and Perforce) have a single server that contains all the versioned files, and a number of clients that check out files from that central place. (((CVS)))(((Subversion)))(((Perforce)))
For many years, this has been the standard for version control.
//////////////////////////
(((version control,centralized)))
開発者にとって次に問題となってきたのが、他のメンバーが別のマシン上で作業しつつ、しかも共同で作業を進める必要がでてきたことです。
これに対処するために、集中型バージョン管理システム (Centralized Version Control System; CVCS) が開発されました。
CVS、Subversion、Perforce というものがこれにあたります。
(((CVS)))(((Subversion)))(((Perforce)))
このシステムには 1 つのサーバーがあって、バージョン管理されたファイルが収められています。
中心となるサーバーにはクライアントが多数接続し、各ファイルをチェックアウトして利用します。
しばらくの間は、このバージョン管理が標準的なものとなっていました。
@z

@x
.Centralized version control
image::images/centralized.png[Centralized version control diagram]
@y
//////////////////////////
.Centralized version control
image::images/centralized.png[Centralized version control diagram]
//////////////////////////
.集中型バージョン管理
image::images/centralized.png[集中型バージョン管理の概要図]
@z

@x
This setup offers many advantages, especially over local VCSs.
For example, everyone knows to a certain degree what everyone else on the project is doing.
Administrators have fine-grained control over who can do what, and it's far easier to administer a CVCS than it is to deal with local databases on every client.
@y
//////////////////////////
This setup offers many advantages, especially over local VCSs.
For example, everyone knows to a certain degree what everyone else on the project is doing.
Administrators have fine-grained control over who can do what, and it's far easier to administer a CVCS than it is to deal with local databases on every client.
//////////////////////////
このシステムの仕組みは、特にローカル型の VCS に比べて、優れている点が数多くあります。
そもそもプロジェクトのメンバーは、他のメンバーが何をしているのか、ある程度知っています。
そして管理者は、だれに何をさせるかも細かく管理しているものです。
そうなると各クライアントにローカルなデータベースがある状況に比べて、CVCS を管理することの方がはるかに簡単なことです。
@z

@x
However, this setup also has some serious downsides.
The most obvious is the single point of failure that the centralized server represents.
If that server goes down for an hour, then during that hour nobody can collaborate at all or save versioned changes to anything they're working on.
If the hard disk the central database is on becomes corrupted, and proper backups haven't been kept, you lose absolutely everything -- the entire history of the project except whatever single snapshots people happen to have on their local machines.
Local VCS systems suffer from this same problem -- whenever you have the entire history of the project in a single place, you risk losing everything.
@y
//////////////////////////
However, this setup also has some serious downsides.
The most obvious is the single point of failure that the centralized server represents.
If that server goes down for an hour, then during that hour nobody can collaborate at all or save versioned changes to anything they're working on.
If the hard disk the central database is on becomes corrupted, and proper backups haven't been kept, you lose absolutely everything -- the entire history of the project except whatever single snapshots people happen to have on their local machines.
Local VCS systems suffer from this same problem -- whenever you have the entire history of the project in a single place, you risk losing everything.
//////////////////////////
しかしこのシステムには重大な欠点もあります。
明らかな欠点は、中心に位置づけられたサーバーが存在するという、この単純な構成です。
このサーバーが 1 時間でも停止したら、その間だれも共同作業ができませんし、作業中のファイルをバージョン管理のもとに保存することもできません。
サーバーのハードディスク内にあるデータベースが壊れてしまって、それまでに適切にバックアップをとっていなかったとしたら、完全にすべてを失ってしまうということです。
プロジェクトの履歴は全く失われてしまい、だれかがたまたまローカルマシン内に保持していたスナップショットが残る程度です。
ローカル型の VCS でも同じことです。
つまりプロジェクトの履歴は、一箇所に管理している限りは、消失するリスクを抱えているということです。
@z

@x
==== Distributed Version Control Systems
@y
//////////////////////////
==== Distributed Version Control Systems
//////////////////////////
==== 分散型バージョン管理システム
@z

@x
(((version control,distributed)))
@y
(((version control,distributed)))
@z

@x
This is where Distributed Version Control Systems (DVCSs) step in.
In a DVCS (such as Git, Mercurial, Bazaar or Darcs), clients don't just check out the latest snapshot of the files; rather, they fully mirror the repository, including its full history.
Thus, if any server dies, and these systems were collaborating via that server, any of the client repositories can be copied back up to the server to restore it.
Every clone is really a full backup of all the data.
@y
//////////////////////////
This is where Distributed Version Control Systems (DVCSs) step in.
In a DVCS (such as Git, Mercurial, Bazaar or Darcs), clients don't just check out the latest snapshot of the files; rather, they fully mirror the repository, including its full history.
Thus, if any server dies, and these systems were collaborating via that server, any of the client repositories can be copied back up to the server to restore it.
Every clone is really a full backup of all the data.
//////////////////////////
(((version control,distributed)))
ここに分散型バージョン管理システム（Distributed Version Control System; DVCS）が登場します。
DVCS である Git、Mercurial、Bazaar、Darcs などにおいて、クライアントはファイルの最新スナップショットを単に取得するものではありません。
クライアントはリポジトリの完全なミラーを行います。
したがってサーバーがダウンしてしまい、そこに DVCS が稼動していた場合でも、クライアントにあるリポジトリのどれか 1 つをサーバーにコピーし直せば復旧ができます。
クローンの作成というものは、まさに全データのバックアップを取ることなのです。
@z

@x
.Distributed version control
image::images/distributed.png[Distributed version control diagram]
@y
//////////////////////////
.Distributed version control
image::images/distributed.png[Distributed version control diagram]
//////////////////////////
.分散型バージョン管理
image::images/distributed.png[分散型バージョン管理の概要図]
@z

@x
Furthermore, many of these systems deal pretty well with having several remote repositories they can work with, so you can collaborate with different groups of people in different ways simultaneously within the same project.
This allows you to set up several types of workflows that aren't possible in centralized systems, such as hierarchical models.
@y
//////////////////////////
Furthermore, many of these systems deal pretty well with having several remote repositories they can work with, so you can collaborate with different groups of people in different ways simultaneously within the same project.
This allows you to set up several types of workflows that aren't possible in centralized systems, such as hierarchical models.
//////////////////////////
さらに言えばこういったシステムには、リモートリポジトリと協調しながら動作する機能が含まれているものが多いので、他の人たちがまるっきり違った方法で行っている作業であっても、共に同一プロジェクト内で、同時に作業を進めることもできます。
こういうシステムであればこそ階層モデルのように、いろいろな種類の作業を組み立てられるのであって、これは集中型システムでは無理です。
@z
