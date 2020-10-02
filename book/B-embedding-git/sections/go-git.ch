%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
=== go-git
@y
=== go-git
@z

@x
(((go-git)))(((Go)))
In case you want to integrate Git into a service written in Golang, there also is a pure Go library implementation.
This implementation does not have any native dependencies and thus is not prone to manual memory management errors.
It is also transparent for the standard Golang performance analysis tooling like CPU, Memory profilers, race detector, etc.
@y
(((go-git)))(((Go)))
In case you want to integrate Git into a service written in Golang, there also is a pure Go library implementation.
This implementation does not have any native dependencies and thus is not prone to manual memory management errors.
It is also transparent for the standard Golang performance analysis tooling like CPU, Memory profilers, race detector, etc.
@z

@x
go-git is focused on extensibility, compatibility and supports most of the plumbing APIs, which is documented at https://github.com/go-git/go-git/blob/master/COMPATIBILITY.md[].
@y
go-git is focused on extensibility, compatibility and supports most of the plumbing APIs, which is documented at https://github.com/go-git/go-git/blob/master/COMPATIBILITY.md[].
@z

@x
Here is a basic example of using Go APIs:
@y
Here is a basic example of using Go APIs:
@z

@x
[source, go]
----
import "github.com/go-git/go-git/v5"
@y
[source, go]
----
import "github.com/go-git/go-git/v5"
@z

@x
r, err := git.PlainClone("/tmp/foo", false, &git.CloneOptions{
    URL:      "https://github.com/go-git/go-git",
    Progress: os.Stdout,
})
----
@y
r, err := git.PlainClone("/tmp/foo", false, &git.CloneOptions{
    URL:      "https://github.com/go-git/go-git",
    Progress: os.Stdout,
})
----
@z

@x
As soon as you have a `Repository` instance, you can access information and perform mutations on it:
@y
As soon as you have a `Repository` instance, you can access information and perform mutations on it:
@z

@x
[source, go]
----
// retrieves the branch pointed by HEAD
ref, err := r.Head()
@y
[source, go]
----
// retrieves the branch pointed by HEAD
ref, err := r.Head()
@z

@x
// get the commit object, pointed by ref
commit, err := r.CommitObject(ref.Hash())
@y
// get the commit object, pointed by ref
commit, err := r.CommitObject(ref.Hash())
@z

@x
// retrieves the commit history
history, err := commit.History()
@y
// retrieves the commit history
history, err := commit.History()
@z

@x
// iterates over the commits and print each
for _, c := range history {
    fmt.Println(c)
}
----
@y
// iterates over the commits and print each
for _, c := range history {
    fmt.Println(c)
}
----
@z

@x
==== Advanced Functionality
@y
==== Advanced Functionality
@z

@x
go-git has few notable advanced features, one of which is a pluggable storage system, which is similar to Libgit2 backends.
The default implementation is in-memory storage, which is very fast.
@y
go-git has few notable advanced features, one of which is a pluggable storage system, which is similar to Libgit2 backends.
The default implementation is in-memory storage, which is very fast.
@z

@x
[source, go]
----
r, err := git.Clone(memory.NewStorage(), nil, &git.CloneOptions{
    URL: "https://github.com/go-git/go-git",
})
----
@y
[source, go]
----
r, err := git.Clone(memory.NewStorage(), nil, &git.CloneOptions{
    URL: "https://github.com/go-git/go-git",
})
----
@z

@x
Pluggable storage provides many interesting options.
For instance, https://github.com/go-git/go-git/tree/master/_examples/storage[] allows you to store references, objects, and configuration in an Aerospike database.
@y
Pluggable storage provides many interesting options.
For instance, https://github.com/go-git/go-git/tree/master/_examples/storage[] allows you to store references, objects, and configuration in an Aerospike database.
@z

@x
Another feature is a flexible filesystem abstraction.
Using https://pkg.go.dev/github.com/go-git/go-billy/v5?tab=doc#Filesystem[] it is easy to store all the files in different way i.e by packing all of them to a single archive on disk or by keeping them all in-memory.
@y
Another feature is a flexible filesystem abstraction.
Using https://pkg.go.dev/github.com/go-git/go-billy/v5?tab=doc#Filesystem[] it is easy to store all the files in different way i.e by packing all of them to a single archive on disk or by keeping them all in-memory.
@z

@x
Another advanced use-case includes a fine-tunable HTTP client, such as the one found at https://github.com/go-git/go-git/blob/master/_examples/custom_http/main.go[].
@y
Another advanced use-case includes a fine-tunable HTTP client, such as the one found at https://github.com/go-git/go-git/blob/master/_examples/custom_http/main.go[].
@z

@x
[source, go]
----
customClient := &http.Client{
    Transport: &http.Transport{ // accept any certificate (might be useful for testing)
        TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
    },
    Timeout: 15 * time.Second,  // 15 second timeout
        CheckRedirect: func(req *http.Request, via []*http.Request) error {
        return http.ErrUseLastResponse // don't follow redirect
    },
}
@y
[source, go]
----
customClient := &http.Client{
    Transport: &http.Transport{ // accept any certificate (might be useful for testing)
        TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
    },
    Timeout: 15 * time.Second,  // 15 second timeout
        CheckRedirect: func(req *http.Request, via []*http.Request) error {
        return http.ErrUseLastResponse // don't follow redirect
    },
}
@z

@x
// Override http(s) default protocol to use our custom client
client.InstallProtocol("https", githttp.NewClient(customClient))
@y
// Override http(s) default protocol to use our custom client
client.InstallProtocol("https", githttp.NewClient(customClient))
@z

@x
// Clone repository using the new client if the protocol is https://
r, err := git.Clone(memory.NewStorage(), nil, &git.CloneOptions{URL: url})
----
@y
// Clone repository using the new client if the protocol is https://
r, err := git.Clone(memory.NewStorage(), nil, &git.CloneOptions{URL: url})
----
@z

@x
==== Further Reading
@y
==== Further Reading
@z

@x
A full treatment of go-git's capabilities is outside the scope of this book.
If you want more information on go-git, there's API documentation at https://pkg.go.dev/github.com/go-git/go-git/v5[], and a set of usage examples at https://github.com/go-git/go-git/tree/master/_examples[].
@y
A full treatment of go-git's capabilities is outside the scope of this book.
If you want more information on go-git, there's API documentation at https://pkg.go.dev/github.com/go-git/go-git/v5[], and a set of usage examples at https://github.com/go-git/go-git/tree/master/_examples[].
@z
