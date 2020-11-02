%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== What is Git?
@y
//////////////////////////
=== What is Git?
//////////////////////////
=== Git とは何か？
@z

@x
So, what is Git in a nutshell?
This is an important section to absorb, because if you understand what Git is and the fundamentals of how it works, then using Git effectively will probably be much easier for you.
As you learn Git, try to clear your mind of the things you may know about other VCSs, such as CVS, Subversion or Perforce -- doing so will help you avoid subtle confusion when using the tool.
Even though Git's user interface is fairly similar to these other VCSs, Git stores and thinks about information in a very different way, and understanding these differences will help you avoid becoming confused while using it.(((Subversion)))(((Perforce)))
@y
//////////////////////////
So, what is Git in a nutshell?
This is an important section to absorb, because if you understand what Git is and the fundamentals of how it works, then using Git effectively will probably be much easier for you.
As you learn Git, try to clear your mind of the things you may know about other VCSs, such as CVS, Subversion or Perforce -- doing so will help you avoid subtle confusion when using the tool.
Even though Git's user interface is fairly similar to these other VCSs, Git stores and thinks about information in a very different way, and understanding these differences will help you avoid becoming confused while using it.(((Subversion)))(((Perforce)))
//////////////////////////
簡単に言って Git とは何なのか？
This is an important section to absorb, because if you understand what Git is and the fundamentals of how it works, then using Git effectively will probably be much easier for you.
As you learn Git, try to clear your mind of the things you may know about other VCSs, such as CVS, Subversion or Perforce -- doing so will help you avoid subtle confusion when using the tool.
Even though Git's user interface is fairly similar to these other VCSs, Git stores and thinks about information in a very different way, and understanding these differences will help you avoid becoming confused while using it.(((Subversion)))(((Perforce)))
@z

@x
==== Snapshots, Not Differences
@y
//////////////////////////
==== Snapshots, Not Differences
//////////////////////////
==== Snapshots, Not Differences
@z

@x
The major difference between Git and any other VCS (Subversion and friends included) is the way Git thinks about its data.
Conceptually, most other systems store information as a list of file-based changes.
These other systems (CVS, Subversion, Perforce, Bazaar, and so on) think of the information they store as a set of files and the changes made to each file over time (this is commonly described as _delta-based_ version control).
@y
//////////////////////////
The major difference between Git and any other VCS (Subversion and friends included) is the way Git thinks about its data.
Conceptually, most other systems store information as a list of file-based changes.
These other systems (CVS, Subversion, Perforce, Bazaar, and so on) think of the information they store as a set of files and the changes made to each file over time (this is commonly described as _delta-based_ version control).
//////////////////////////
The major difference between Git and any other VCS (Subversion and friends included) is the way Git thinks about its data.
Conceptually, most other systems store information as a list of file-based changes.
These other systems (CVS, Subversion, Perforce, Bazaar, and so on) think of the information they store as a set of files and the changes made to each file over time (this is commonly described as _delta-based_ version control).
@z

@x
.Storing data as changes to a base version of each file
image::images/deltas.png[Storing data as changes to a base version of each file]
@y
//////////////////////////
.Storing data as changes to a base version of each file
image::images/deltas.png[Storing data as changes to a base version of each file]
//////////////////////////
.Storing data as changes to a base version of each file
image::images/deltas.png[Storing data as changes to a base version of each file]
@z

@x
Git doesn't think of or store its data this way.
Instead, Git thinks of its data more like a series of snapshots of a miniature filesystem.
With Git, every time you commit, or save the state of your project, Git basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot.
To be efficient, if files have not changed, Git doesn't store the file again, just a link to the previous identical file it has already stored.
Git thinks about its data more like a *stream of snapshots*.
@y
//////////////////////////
Git doesn't think of or store its data this way.
Instead, Git thinks of its data more like a series of snapshots of a miniature filesystem.
With Git, every time you commit, or save the state of your project, Git basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot.
To be efficient, if files have not changed, Git doesn't store the file again, just a link to the previous identical file it has already stored.
Git thinks about its data more like a *stream of snapshots*.
//////////////////////////
Git doesn't think of or store its data this way.
Instead, Git thinks of its data more like a series of snapshots of a miniature filesystem.
With Git, every time you commit, or save the state of your project, Git basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot.
To be efficient, if files have not changed, Git doesn't store the file again, just a link to the previous identical file it has already stored.
Git thinks about its data more like a *stream of snapshots*.
@z

@x
.Storing data as snapshots of the project over time
image::images/snapshots.png[Git stores data as snapshots of the project over time]
@y
//////////////////////////
.Storing data as snapshots of the project over time
image::images/snapshots.png[Git stores data as snapshots of the project over time]
//////////////////////////
.Storing data as snapshots of the project over time
image::images/snapshots.png[Git stores data as snapshots of the project over time]
@z

@x
This is an important distinction between Git and nearly all other VCSs.
It makes Git reconsider almost every aspect of version control that most other systems copied from the previous generation.
This makes Git more like a mini filesystem with some incredibly powerful tools built on top of it, rather than simply a VCS.
We'll explore some of the benefits you gain by thinking of your data this way when we cover Git branching in <<ch03-git-branching#ch03-git-branching>>.
@y
//////////////////////////
This is an important distinction between Git and nearly all other VCSs.
It makes Git reconsider almost every aspect of version control that most other systems copied from the previous generation.
This makes Git more like a mini filesystem with some incredibly powerful tools built on top of it, rather than simply a VCS.
We'll explore some of the benefits you gain by thinking of your data this way when we cover Git branching in <<ch03-git-branching#ch03-git-branching>>.
//////////////////////////
This is an important distinction between Git and nearly all other VCSs.
It makes Git reconsider almost every aspect of version control that most other systems copied from the previous generation.
This makes Git more like a mini filesystem with some incredibly powerful tools built on top of it, rather than simply a VCS.
We'll explore some of the benefits you gain by thinking of your data this way when we cover Git branching in <<ch03-git-branching#ch03-git-branching>>.
@z

@x
==== Nearly Every Operation Is Local
@y
//////////////////////////
==== Nearly Every Operation Is Local
//////////////////////////
==== Nearly Every Operation Is Local
@z

@x
Most operations in Git need only local files and resources to operate -- generally no information is needed from another computer on your network.
If you're used to a CVCS where most operations have that network latency overhead, this aspect of Git will make you think that the gods of speed have blessed Git with unworldly powers.
Because you have the entire history of the project right there on your local disk, most operations seem almost instantaneous.
@y
//////////////////////////
Most operations in Git need only local files and resources to operate -- generally no information is needed from another computer on your network.
If you're used to a CVCS where most operations have that network latency overhead, this aspect of Git will make you think that the gods of speed have blessed Git with unworldly powers.
Because you have the entire history of the project right there on your local disk, most operations seem almost instantaneous.
//////////////////////////
Most operations in Git need only local files and resources to operate -- generally no information is needed from another computer on your network.
If you're used to a CVCS where most operations have that network latency overhead, this aspect of Git will make you think that the gods of speed have blessed Git with unworldly powers.
Because you have the entire history of the project right there on your local disk, most operations seem almost instantaneous.
@z

@x
For example, to browse the history of the project, Git doesn't need to go out to the server to get the history and display it for you -- it simply reads it directly from your local database.
This means you see the project history almost instantly.
If you want to see the changes introduced between the current version of a file and the file a month ago, Git can look up the file a month ago and do a local difference calculation, instead of having to either ask a remote server to do it or pull an older version of the file from the remote server to do it locally.
@y
//////////////////////////
For example, to browse the history of the project, Git doesn't need to go out to the server to get the history and display it for you -- it simply reads it directly from your local database.
This means you see the project history almost instantly.
If you want to see the changes introduced between the current version of a file and the file a month ago, Git can look up the file a month ago and do a local difference calculation, instead of having to either ask a remote server to do it or pull an older version of the file from the remote server to do it locally.
//////////////////////////
For example, to browse the history of the project, Git doesn't need to go out to the server to get the history and display it for you -- it simply reads it directly from your local database.
This means you see the project history almost instantly.
If you want to see the changes introduced between the current version of a file and the file a month ago, Git can look up the file a month ago and do a local difference calculation, instead of having to either ask a remote server to do it or pull an older version of the file from the remote server to do it locally.
@z

@x
This also means that there is very little you can't do if you're offline or off VPN.
If you get on an airplane or a train and want to do a little work, you can commit happily (to your _local_ copy, remember?) until you get to a network connection to upload.
If you go home and can't get your VPN client working properly, you can still work.
In many other systems, doing so is either impossible or painful.
In Perforce, for example, you can't do much when you aren't connected to the server; in Subversion and CVS, you can edit files, but you can't commit changes to your database (because your database is offline).
This may not seem like a huge deal, but you may be surprised what a big difference it can make.
@y
//////////////////////////
This also means that there is very little you can't do if you're offline or off VPN.
If you get on an airplane or a train and want to do a little work, you can commit happily (to your _local_ copy, remember?) until you get to a network connection to upload.
If you go home and can't get your VPN client working properly, you can still work.
In many other systems, doing so is either impossible or painful.
In Perforce, for example, you can't do much when you aren't connected to the server; in Subversion and CVS, you can edit files, but you can't commit changes to your database (because your database is offline).
This may not seem like a huge deal, but you may be surprised what a big difference it can make.
//////////////////////////
This also means that there is very little you can't do if you're offline or off VPN.
If you get on an airplane or a train and want to do a little work, you can commit happily (to your _local_ copy, remember?) until you get to a network connection to upload.
If you go home and can't get your VPN client working properly, you can still work.
In many other systems, doing so is either impossible or painful.
In Perforce, for example, you can't do much when you aren't connected to the server; in Subversion and CVS, you can edit files, but you can't commit changes to your database (because your database is offline).
This may not seem like a huge deal, but you may be surprised what a big difference it can make.
@z

@x
==== Git Has Integrity
@y
//////////////////////////
==== Git Has Integrity
//////////////////////////
==== Git Has Integrity
@z

@x
Everything in Git is checksummed before it is stored and is then referred to by that checksum.
This means it's impossible to change the contents of any file or directory without Git knowing about it.
This functionality is built into Git at the lowest levels and is integral to its philosophy.
You can't lose information in transit or get file corruption without Git being able to detect it.
@y
//////////////////////////
Everything in Git is checksummed before it is stored and is then referred to by that checksum.
This means it's impossible to change the contents of any file or directory without Git knowing about it.
This functionality is built into Git at the lowest levels and is integral to its philosophy.
You can't lose information in transit or get file corruption without Git being able to detect it.
//////////////////////////
Everything in Git is checksummed before it is stored and is then referred to by that checksum.
This means it's impossible to change the contents of any file or directory without Git knowing about it.
This functionality is built into Git at the lowest levels and is integral to its philosophy.
You can't lose information in transit or get file corruption without Git being able to detect it.
@z

@x
The mechanism that Git uses for this checksumming is called a SHA-1 hash.(((SHA-1)))
This is a 40-character string composed of hexadecimal characters (0–9 and a–f) and calculated based on the contents of a file or directory structure in Git.
A SHA-1 hash looks something like this:
@y
//////////////////////////
The mechanism that Git uses for this checksumming is called a SHA-1 hash.(((SHA-1)))
This is a 40-character string composed of hexadecimal characters (0–9 and a–f) and calculated based on the contents of a file or directory structure in Git.
A SHA-1 hash looks something like this:
//////////////////////////
The mechanism that Git uses for this checksumming is called a SHA-1 hash.(((SHA-1)))
This is a 40-character string composed of hexadecimal characters (0–9 and a–f) and calculated based on the contents of a file or directory structure in Git.
A SHA-1 hash looks something like this:
@z

@x
[source]
----
24b9da6552252987aa493b52f8696cd6d3b00373
----
@y
[source]
----
24b9da6552252987aa493b52f8696cd6d3b00373
----
@z

@x
You will see these hash values all over the place in Git because it uses them so much.
In fact, Git stores everything in its database not by file name but by the hash value of its contents.
@y
//////////////////////////
You will see these hash values all over the place in Git because it uses them so much.
In fact, Git stores everything in its database not by file name but by the hash value of its contents.
//////////////////////////
You will see these hash values all over the place in Git because it uses them so much.
In fact, Git stores everything in its database not by file name but by the hash value of its contents.
@z

@x
==== Git Generally Only Adds Data
@y
//////////////////////////
==== Git Generally Only Adds Data
//////////////////////////
==== Git Generally Only Adds Data
@z

@x
When you do actions in Git, nearly all of them only _add_ data to the Git database.
It is hard to get the system to do anything that is not undoable or to make it erase data in any way.
As with any VCS, you can lose or mess up changes you haven't committed yet, but after you commit a snapshot into Git, it is very difficult to lose, especially if you regularly push your database to another repository.
@y
//////////////////////////
When you do actions in Git, nearly all of them only _add_ data to the Git database.
It is hard to get the system to do anything that is not undoable or to make it erase data in any way.
As with any VCS, you can lose or mess up changes you haven't committed yet, but after you commit a snapshot into Git, it is very difficult to lose, especially if you regularly push your database to another repository.
//////////////////////////
When you do actions in Git, nearly all of them only _add_ data to the Git database.
It is hard to get the system to do anything that is not undoable or to make it erase data in any way.
As with any VCS, you can lose or mess up changes you haven't committed yet, but after you commit a snapshot into Git, it is very difficult to lose, especially if you regularly push your database to another repository.
@z

@x
This makes using Git a joy because we know we can experiment without the danger of severely screwing things up.
For a more in-depth look at how Git stores its data and how you can recover data that seems lost, see <<ch02-git-basics-chapter#_undoing>>.
@y
//////////////////////////
This makes using Git a joy because we know we can experiment without the danger of severely screwing things up.
For a more in-depth look at how Git stores its data and how you can recover data that seems lost, see <<ch02-git-basics-chapter#_undoing>>.
//////////////////////////
This makes using Git a joy because we know we can experiment without the danger of severely screwing things up.
For a more in-depth look at how Git stores its data and how you can recover data that seems lost, see <<ch02-git-basics-chapter#_undoing>>.
@z

@x
==== The Three States
@y
//////////////////////////
==== The Three States
//////////////////////////
==== 3 つの状態
@z

@x
Pay attention now -- here is the main thing to remember about Git if you want the rest of your learning process to go smoothly.
Git has three main states that your files can reside in: _modified_, _staged_, and _committed_:
@y
//////////////////////////
Pay attention now -- here is the main thing to remember about Git if you want the rest of your learning process to go smoothly.
Git has three main states that your files can reside in: _modified_, _staged_, and _committed_:
//////////////////////////
ここからは注意して読んでください。
here is the main thing to remember about Git if you want the rest of your learning process to go smoothly.
Git has three main states that your files can reside in: _modified_, _staged_, and _committed_:
@z

@x
* Modified means that you have changed the file but have not committed it to your database yet.
* Staged means that you have marked a modified file in its current version to go into your next commit snapshot.
* Committed means that the data is safely stored in your local database.
@y
//////////////////////////
* Modified means that you have changed the file but have not committed it to your database yet.
* Staged means that you have marked a modified file in its current version to go into your next commit snapshot.
* Committed means that the data is safely stored in your local database.
//////////////////////////
* Modified means that you have changed the file but have not committed it to your database yet.
* Staged means that you have marked a modified file in its current version to go into your next commit snapshot.
* Committed means that the data is safely stored in your local database.
@z

@x
This leads us to the three main sections of a Git project: the working tree, the staging area, and the Git directory.
@y
//////////////////////////
This leads us to the three main sections of a Git project: the working tree, the staging area, and the Git directory.
//////////////////////////
This leads us to the three main sections of a Git project: the working tree, the staging area, and the Git directory.
@z

@x
.Working tree, staging area, and Git directory
image::images/areas.png["Working tree, staging area, and Git directory."]
@y
//////////////////////////
.Working tree, staging area, and Git directory
image::images/areas.png["Working tree, staging area, and Git directory."]
//////////////////////////
.Working tree, staging area, and Git directory
image::images/areas.png["Working tree, staging area, and Git directory."]
@z

@x
The working tree is a single checkout of one version of the project.
These files are pulled out of the compressed database in the Git directory and placed on disk for you to use or modify.
@y
//////////////////////////
The working tree is a single checkout of one version of the project.
These files are pulled out of the compressed database in the Git directory and placed on disk for you to use or modify.
//////////////////////////
The working tree is a single checkout of one version of the project.
These files are pulled out of the compressed database in the Git directory and placed on disk for you to use or modify.
@z

@x
The staging area is a file, generally contained in your Git directory, that stores information about what will go into your next commit.
Its technical name in Git parlance is the ``index'', but the phrase ``staging area'' works just as well.
@y
//////////////////////////
The staging area is a file, generally contained in your Git directory, that stores information about what will go into your next commit.
Its technical name in Git parlance is the ``index'', but the phrase ``staging area'' works just as well.
//////////////////////////
The staging area is a file, generally contained in your Git directory, that stores information about what will go into your next commit.
Its technical name in Git parlance is the ``index'', but the phrase ``staging area'' works just as well.
@z

@x
The Git directory is where Git stores the metadata and object database for your project.
This is the most important part of Git, and it is what is copied when you _clone_ a repository from another computer.
@y
//////////////////////////
The Git directory is where Git stores the metadata and object database for your project.
This is the most important part of Git, and it is what is copied when you _clone_ a repository from another computer.
//////////////////////////
The Git directory is where Git stores the metadata and object database for your project.
This is the most important part of Git, and it is what is copied when you _clone_ a repository from another computer.
@z

@x
The basic Git workflow goes something like this:
@y
//////////////////////////
The basic Git workflow goes something like this:
//////////////////////////
The basic Git workflow goes something like this:
@z

@x
1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds _only_ those changes to the staging area.
3. You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.
@y
//////////////////////////
1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds _only_ those changes to the staging area.
3. You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.
//////////////////////////
1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds _only_ those changes to the staging area.
3. You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.
@z

@x
If a particular version of a file is in the Git directory, it's considered _committed_.
If it has been modified and was added to the staging area, it is _staged_.
And if it was changed since it was checked out but has not been staged, it is _modified_.
In <<ch02-git-basics-chapter#ch02-git-basics-chapter>>, you'll learn more about these states and how you can either take advantage of them or skip the staged part entirely.
@y
//////////////////////////
If a particular version of a file is in the Git directory, it's considered _committed_.
If it has been modified and was added to the staging area, it is _staged_.
And if it was changed since it was checked out but has not been staged, it is _modified_.
In <<ch02-git-basics-chapter#ch02-git-basics-chapter>>, you'll learn more about these states and how you can either take advantage of them or skip the staged part entirely.
//////////////////////////
If a particular version of a file is in the Git directory, it's considered _committed_.
If it has been modified and was added to the staging area, it is _staged_.
And if it was changed since it was checked out but has not been staged, it is _modified_.
In <<ch02-git-basics-chapter#ch02-git-basics-chapter>>, you'll learn more about these states and how you can either take advantage of them or skip the staged part entirely.
@z
