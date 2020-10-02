%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== A Short History of Git
@y
=== Git の開発経緯
@z

@x
As with many great things in life, Git began with a bit of creative destruction and fiery controversy.
@y
人生には大きな出来事が多々あるものですが、Git もちょっとした創造的破壊と激論の中から始まりました。
@z

@x
The Linux kernel is an open source software project of fairly large scope.(((Linux)))
For most of the lifetime of the Linux kernel maintenance (1991–2002), changes to the software were passed around as patches and archived files.
In 2002, the Linux kernel project began using a proprietary DVCS called BitKeeper.(((BitKeeper)))
@y
Linux カーネルは、広範囲を網羅するオープンソースソフトウェアです。
(((Linux)))
Linux カーネルの開発期間の大半 (1991 年～ 2002 年) において、このソフトウェアに対する変更はパッチやアーカイブファイルを利用して行われていました。
2002 年に Linux カーネルプロジェクトは、BitKeeper というソフトウェア製品の利用を始めます。
(((BitKeeper)))
@z

@x
In 2005, the relationship between the community that developed the Linux kernel and the commercial company that developed BitKeeper broke down, and the tool's free-of-charge status was revoked.
This prompted the Linux development community (and in particular Linus Torvalds, the creator of Linux) to develop their own tool based on some of the lessons they learned while using BitKeeper.(((Linus Torvalds)))
Some of the goals of the new system were as follows:
@y
2005 年に Linux を開発するコミュニティと BitKeeper を開発する企業との関係が崩れ、BitKeeper を無償利用できる条件が解消されます。
Linux 開発コミュニティ（特に Linux の創始者である Linus Torvalds）はすぐさま、BitKeeper の利用から学んだ経験をもとに、独自ツールの開発に着手しました。
(((Linus Torvalds)))
その新しいシステムが目指したのは以下です。
@z

@x
*  Speed
*  Simple design
*  Strong support for non-linear development (thousands of parallel branches)
*  Fully distributed
*  Able to handle large projects like the Linux kernel efficiently (speed and data size)
@y
*  処理速度に優れていること
*  シンプルな設計であること
*  順序だった開発でなくても (同時並行で分散開発することが) 強力にサポートされること
*  完全に分散化できること
*  Linux カーネルのような大規模プロジェクトであっても (処理性能、データ容量のいずれの観点でも) 効率良く取り扱えること
@z

@x
Since its birth in 2005, Git has evolved and matured to be easy to use and yet retain these initial qualities.
It's amazingly fast, it's very efficient with large projects, and it has an incredible branching system for non-linear development (See <<ch03-git-branching#ch03-git-branching>>).
@y
2005 年に誕生して以来 Git は発展し続け、より扱いやすくなりました。当初の品質は今なお維持しています。
処理速度は驚くほど速く、大規模プロジェクトも効率良く取り扱います。
また分散開発に適したブランチ機能がとても優れています。 
（<<ch03-git-branching#ch03-git-branching>> 参照）
@z
