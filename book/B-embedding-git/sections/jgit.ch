%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== JGit
@y
=== JGit
@z

@x
(((jgit)))(((Java)))
If you want to use Git from within a Java program, there is a fully featured Git library called JGit.
JGit is a relatively full-featured implementation of Git written natively in Java, and is widely used in the Java community.
The JGit project is under the Eclipse umbrella, and its home can be found at https://www.eclipse.org/jgit/[].
@y
(((jgit)))(((Java)))
If you want to use Git from within a Java program, there is a fully featured Git library called JGit.
JGit is a relatively full-featured implementation of Git written natively in Java, and is widely used in the Java community.
The JGit project is under the Eclipse umbrella, and its home can be found at https://www.eclipse.org/jgit/[].
@z

@x
==== Getting Set Up
@y
==== Getting Set Up
@z

@x
There are a number of ways to connect your project with JGit and start writing code against it.
Probably the easiest is to use Maven – the integration is accomplished by adding the following snippet to the `<dependencies>` tag in your pom.xml file:
@y
There are a number of ways to connect your project with JGit and start writing code against it.
Probably the easiest is to use Maven – the integration is accomplished by adding the following snippet to the `<dependencies>` tag in your pom.xml file:
@z

@x
[source,xml]
----
<dependency>
    <groupId>org.eclipse.jgit</groupId>
    <artifactId>org.eclipse.jgit</artifactId>
    <version>3.5.0.201409260305-r</version>
</dependency>
----
@y
[source,xml]
----
<dependency>
    <groupId>org.eclipse.jgit</groupId>
    <artifactId>org.eclipse.jgit</artifactId>
    <version>3.5.0.201409260305-r</version>
</dependency>
----
@z

@x
The `version` will most likely have advanced by the time you read this; check https://mvnrepository.com/artifact/org.eclipse.jgit/org.eclipse.jgit[] for updated repository information.
Once this step is done, Maven will automatically acquire and use the JGit libraries that you'll need.
@y
The `version` will most likely have advanced by the time you read this; check https://mvnrepository.com/artifact/org.eclipse.jgit/org.eclipse.jgit[] for updated repository information.
Once this step is done, Maven will automatically acquire and use the JGit libraries that you'll need.
@z

@x
If you would rather manage the binary dependencies yourself, pre-built JGit binaries are available from https://www.eclipse.org/jgit/download[].
You can build them into your project by running a command like this:
@y
If you would rather manage the binary dependencies yourself, pre-built JGit binaries are available from https://www.eclipse.org/jgit/download[].
You can build them into your project by running a command like this:
@z

@x
[source,console]
----
javac -cp .:org.eclipse.jgit-3.5.0.201409260305-r.jar App.java
java -cp .:org.eclipse.jgit-3.5.0.201409260305-r.jar App
----
@y
[source,console]
----
javac -cp .:org.eclipse.jgit-3.5.0.201409260305-r.jar App.java
java -cp .:org.eclipse.jgit-3.5.0.201409260305-r.jar App
----
@z

@x
==== Plumbing
@y
==== Plumbing
@z

@x
JGit has two basic levels of API: plumbing and porcelain.
The terminology for these comes from Git itself, and JGit is divided into roughly the same kinds of areas: porcelain APIs are a friendly front-end for common user-level actions (the sorts of things a normal user would use the Git command-line tool for), while the plumbing APIs are for interacting with low-level repository objects directly.
@y
JGit has two basic levels of API: plumbing and porcelain.
The terminology for these comes from Git itself, and JGit is divided into roughly the same kinds of areas: porcelain APIs are a friendly front-end for common user-level actions (the sorts of things a normal user would use the Git command-line tool for), while the plumbing APIs are for interacting with low-level repository objects directly.
@z

@x
The starting point for most JGit sessions is the `Repository` class, and the first thing you'll want to do is create an instance of it.
For a filesystem-based repository (yes, JGit allows for other storage models), this is accomplished using `FileRepositoryBuilder`:
@y
The starting point for most JGit sessions is the `Repository` class, and the first thing you'll want to do is create an instance of it.
For a filesystem-based repository (yes, JGit allows for other storage models), this is accomplished using `FileRepositoryBuilder`:
@z

@x
[source,java]
----
// Create a new repository
Repository newlyCreatedRepo = FileRepositoryBuilder.create(
    new File("/tmp/new_repo/.git"));
newlyCreatedRepo.create();
@y
[source,java]
----
// Create a new repository
Repository newlyCreatedRepo = FileRepositoryBuilder.create(
    new File("/tmp/new_repo/.git"));
newlyCreatedRepo.create();
@z

@x
// Open an existing repository
Repository existingRepo = new FileRepositoryBuilder()
    .setGitDir(new File("my_repo/.git"))
    .build();
----
@y
// Open an existing repository
Repository existingRepo = new FileRepositoryBuilder()
    .setGitDir(new File("my_repo/.git"))
    .build();
----
@z

@x
The builder has a fluent API for providing all the things it needs to find a Git repository, whether or not your program knows exactly where it's located.
It can use environment variables (`.readEnvironment()`), start from a place in the working directory and search (`.setWorkTree(…).findGitDir()`), or just open a known `.git` directory as above.
@y
The builder has a fluent API for providing all the things it needs to find a Git repository, whether or not your program knows exactly where it's located.
It can use environment variables (`.readEnvironment()`), start from a place in the working directory and search (`.setWorkTree(…).findGitDir()`), or just open a known `.git` directory as above.
@z

@x
Once you have a `Repository` instance, you can do all sorts of things with it.
Here's a quick sampling:
@y
Once you have a `Repository` instance, you can do all sorts of things with it.
Here's a quick sampling:
@z

@x
[source,java]
----
// Get a reference
Ref master = repo.getRef("master");
@y
[source,java]
----
// Get a reference
Ref master = repo.getRef("master");
@z

@x
// Get the object the reference points to
ObjectId masterTip = master.getObjectId();
@y
// Get the object the reference points to
ObjectId masterTip = master.getObjectId();
@z

@x
// Rev-parse
ObjectId obj = repo.resolve("HEAD^{tree}");
@y
// Rev-parse
ObjectId obj = repo.resolve("HEAD^{tree}");
@z

@x
// Load raw object contents
ObjectLoader loader = repo.open(masterTip);
loader.copyTo(System.out);
@y
// Load raw object contents
ObjectLoader loader = repo.open(masterTip);
loader.copyTo(System.out);
@z

@x
// Create a branch
RefUpdate createBranch1 = repo.updateRef("refs/heads/branch1");
createBranch1.setNewObjectId(masterTip);
createBranch1.update();
@y
// Create a branch
RefUpdate createBranch1 = repo.updateRef("refs/heads/branch1");
createBranch1.setNewObjectId(masterTip);
createBranch1.update();
@z

@x
// Delete a branch
RefUpdate deleteBranch1 = repo.updateRef("refs/heads/branch1");
deleteBranch1.setForceUpdate(true);
deleteBranch1.delete();
@y
// Delete a branch
RefUpdate deleteBranch1 = repo.updateRef("refs/heads/branch1");
deleteBranch1.setForceUpdate(true);
deleteBranch1.delete();
@z

@x
// Config
Config cfg = repo.getConfig();
String name = cfg.getString("user", null, "name");
----
@y
// Config
Config cfg = repo.getConfig();
String name = cfg.getString("user", null, "name");
----
@z

@x
There's quite a bit going on here, so let's go through it one section at a time.
@y
There's quite a bit going on here, so let's go through it one section at a time.
@z

@x
The first line gets a pointer to the `master` reference.
JGit automatically grabs the _actual_ `master` ref, which lives at `refs/heads/master`, and returns an object that lets you fetch information about the reference.
You can get the name (`.getName()`), and either the target object of a direct reference (`.getObjectId()`) or the reference pointed to by a symbolic ref (`.getTarget()`).
Ref objects are also used to represent tag refs and objects, so you can ask if the tag is ``peeled,'' meaning that it points to the final target of a (potentially long) string of tag objects.
@y
The first line gets a pointer to the `master` reference.
JGit automatically grabs the _actual_ `master` ref, which lives at `refs/heads/master`, and returns an object that lets you fetch information about the reference.
You can get the name (`.getName()`), and either the target object of a direct reference (`.getObjectId()`) or the reference pointed to by a symbolic ref (`.getTarget()`).
Ref objects are also used to represent tag refs and objects, so you can ask if the tag is ``peeled,'' meaning that it points to the final target of a (potentially long) string of tag objects.
@z

@x
The second line gets the target of the `master` reference, which is returned as an ObjectId instance.
ObjectId represents the SHA-1 hash of an object, which might or might not exist in Git's object database.
The third line is similar, but shows how JGit handles the rev-parse syntax (for more on this, see <<ch07-git-tools#_branch_references>>); you can pass any object specifier that Git understands, and JGit will return either a valid ObjectId for that object, or `null`.
@y
The second line gets the target of the `master` reference, which is returned as an ObjectId instance.
ObjectId represents the SHA-1 hash of an object, which might or might not exist in Git's object database.
The third line is similar, but shows how JGit handles the rev-parse syntax (for more on this, see <<ch07-git-tools#_branch_references>>); you can pass any object specifier that Git understands, and JGit will return either a valid ObjectId for that object, or `null`.
@z

@x
The next two lines show how to load the raw contents of an object.
In this example, we call `ObjectLoader.copyTo()` to stream the contents of the object directly to stdout, but ObjectLoader also has methods to read the type and size of an object, as well as return it as a byte array.
For large objects (where `.isLarge()` returns `true`), you can call `.openStream()` to get an InputStream-like object that can read the raw object data without pulling it all into memory at once.
@y
The next two lines show how to load the raw contents of an object.
In this example, we call `ObjectLoader.copyTo()` to stream the contents of the object directly to stdout, but ObjectLoader also has methods to read the type and size of an object, as well as return it as a byte array.
For large objects (where `.isLarge()` returns `true`), you can call `.openStream()` to get an InputStream-like object that can read the raw object data without pulling it all into memory at once.
@z

@x
The next few lines show what it takes to create a new branch.
We create a RefUpdate instance, configure some parameters, and call `.update()` to trigger the change.
Directly following this is the code to delete that same branch.
Note that `.setForceUpdate(true)` is required for this to work; otherwise the `.delete()` call will return `REJECTED`, and nothing will happen.
@y
The next few lines show what it takes to create a new branch.
We create a RefUpdate instance, configure some parameters, and call `.update()` to trigger the change.
Directly following this is the code to delete that same branch.
Note that `.setForceUpdate(true)` is required for this to work; otherwise the `.delete()` call will return `REJECTED`, and nothing will happen.
@z

@x
The last example shows how to fetch the `user.name` value from the Git configuration files.
This Config instance uses the repository we opened earlier for local configuration, but will automatically detect the global and system configuration files and read values from them as well.
@y
The last example shows how to fetch the `user.name` value from the Git configuration files.
This Config instance uses the repository we opened earlier for local configuration, but will automatically detect the global and system configuration files and read values from them as well.
@z

@x
This is only a small sampling of the full plumbing API; there are many more methods and classes available.
Also not shown here is the way JGit handles errors, which is through the use of exceptions.
JGit APIs sometimes throw standard Java exceptions (such as `IOException`), but there are a host of JGit-specific exception types that are provided as well (such as `NoRemoteRepositoryException`, `CorruptObjectException`, and `NoMergeBaseException`).
@y
This is only a small sampling of the full plumbing API; there are many more methods and classes available.
Also not shown here is the way JGit handles errors, which is through the use of exceptions.
JGit APIs sometimes throw standard Java exceptions (such as `IOException`), but there are a host of JGit-specific exception types that are provided as well (such as `NoRemoteRepositoryException`, `CorruptObjectException`, and `NoMergeBaseException`).
@z

@x
==== Porcelain
@y
==== Porcelain
@z

@x
The plumbing APIs are rather complete, but it can be cumbersome to string them together to achieve common goals, like adding a file to the index, or making a new commit.
JGit provides a higher-level set of APIs to help out with this, and the entry point to these APIs is the `Git` class:
@y
The plumbing APIs are rather complete, but it can be cumbersome to string them together to achieve common goals, like adding a file to the index, or making a new commit.
JGit provides a higher-level set of APIs to help out with this, and the entry point to these APIs is the `Git` class:
@z

@x
[source,java]
----
Repository repo;
// construct repo...
Git git = new Git(repo);
----
@y
[source,java]
----
Repository repo;
// construct repo...
Git git = new Git(repo);
----
@z

@x
The Git class has a nice set of high-level _builder_-style methods that can be used to construct some pretty complex behavior.
Let's take a look at an example -- doing something like `git ls-remote`:
@y
The Git class has a nice set of high-level _builder_-style methods that can be used to construct some pretty complex behavior.
Let's take a look at an example -- doing something like `git ls-remote`:
@z

@x
[source,java]
----
CredentialsProvider cp = new UsernamePasswordCredentialsProvider("username", "p4ssw0rd");
Collection<Ref> remoteRefs = git.lsRemote()
    .setCredentialsProvider(cp)
    .setRemote("origin")
    .setTags(true)
    .setHeads(false)
    .call();
for (Ref ref : remoteRefs) {
    System.out.println(ref.getName() + " -> " + ref.getObjectId().name());
}
----
@y
[source,java]
----
CredentialsProvider cp = new UsernamePasswordCredentialsProvider("username", "p4ssw0rd");
Collection<Ref> remoteRefs = git.lsRemote()
    .setCredentialsProvider(cp)
    .setRemote("origin")
    .setTags(true)
    .setHeads(false)
    .call();
for (Ref ref : remoteRefs) {
    System.out.println(ref.getName() + " -> " + ref.getObjectId().name());
}
----
@z

@x
This is a common pattern with the Git class; the methods return a command object that lets you chain method calls to set parameters, which are executed when you call `.call()`.
In this case, we're asking the `origin` remote for tags, but not heads.
Also notice the use of a `CredentialsProvider` object for authentication.
@y
This is a common pattern with the Git class; the methods return a command object that lets you chain method calls to set parameters, which are executed when you call `.call()`.
In this case, we're asking the `origin` remote for tags, but not heads.
Also notice the use of a `CredentialsProvider` object for authentication.
@z

@x
Many other commands are available through the Git class, including but not limited to `add`, `blame`, `commit`, `clean`, `push`, `rebase`, `revert`, and `reset`.
@y
Many other commands are available through the Git class, including but not limited to `add`, `blame`, `commit`, `clean`, `push`, `rebase`, `revert`, and `reset`.
@z

@x
==== Further Reading
@y
==== Further Reading
@z

@x
This is only a small sampling of JGit's full capabilities.
If you're interested and want to learn more, here's where to look for information and inspiration:
@y
This is only a small sampling of JGit's full capabilities.
If you're interested and want to learn more, here's where to look for information and inspiration:
@z

@x
* The official JGit API documentation can be found at https://www.eclipse.org/jgit/documentation[].
  These are standard Javadoc, so your favorite JVM IDE will be able to install them locally, as well.
* The JGit Cookbook at https://github.com/centic9/jgit-cookbook[] has many examples of how to do specific tasks with JGit.
@y
* The official JGit API documentation can be found at https://www.eclipse.org/jgit/documentation[].
  These are standard Javadoc, so your favorite JVM IDE will be able to install them locally, as well.
* The JGit Cookbook at https://github.com/centic9/jgit-cookbook[] has many examples of how to do specific tasks with JGit.
@z
