%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
= Pro Git, Second Edition
@y
= Pro Git, Second Edition
@z

@x
Welcome to the second edition of the Pro Git book.
@y
Welcome to the second edition of the Pro Git book.
@z

@x
You can find this book online at: https://git-scm.com/book
@y
You can find this book online at: https://git-scm.com/book
@z

@x
Like the first edition, the second edition of Pro Git is open source under a Creative Commons license.
@y
Like the first edition, the second edition of Pro Git is open source under a Creative Commons license.
@z

@x
A couple of things have changed since open sourcing the first edition.
For one, we've moved from Markdown to the amazing AsciiDoc format for the text of the book; here's an https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/[AsciiDoc quick reference].
@y
A couple of things have changed since open sourcing the first edition.
For one, we've moved from Markdown to the amazing AsciiDoc format for the text of the book; here's an https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/[AsciiDoc quick reference].
@z

@x
We've also moved to keeping the translations in separate repositories rather than subdirectories of the English repository.
See link:TRANSLATING.md[the translating document] for more information.
@y
We've also moved to keeping the translations in separate repositories rather than subdirectories of the English repository.
See link:TRANSLATING.md[the translating document] for more information.
@z

@x
== How To Generate the Book
@y
== How To Generate the Book
@z

@x
You can generate the e-book files manually with Asciidoctor.
We used to be able to build .mobi files (Kindle), but cannot do so now, see #1496 for more information.
If you run the following you _may_ actually get HTML, Epub and PDF output files:
@y
You can generate the e-book files manually with Asciidoctor.
We used to be able to build .mobi files (Kindle), but cannot do so now, see #1496 for more information.
If you run the following you _may_ actually get HTML, Epub and PDF output files:
@z

@x
----
$ bundle install
$ bundle exec rake book:build
Converting to HTML...
 -- HTML output at progit.html
Converting to EPub...
 -- Epub output at progit.epub
Converting to PDF...
 -- PDF output at progit.pdf
----
@y
----
$ bundle install
$ bundle exec rake book:build
Converting to HTML...
 -- HTML output at progit.html
Converting to EPub...
 -- Epub output at progit.epub
Converting to PDF...
 -- PDF output at progit.pdf
----
@z

@x
== Signaling an Issue
@y
== Signaling an Issue
@z

@x
Before signaling an issue, please check that there isn't already a similar one in the bug tracking system.
@y
Before signaling an issue, please check that there isn't already a similar one in the bug tracking system.
@z

@x
Also, if this issue has been spotted on the git-scm.com site, please cross-check that it is still present in this repo.
The issue may have already been corrected, but the changes have not been deployed yet.
@y
Also, if this issue has been spotted on the git-scm.com site, please cross-check that it is still present in this repo.
The issue may have already been corrected, but the changes have not been deployed yet.
@z

@x
== Contributing
@y
== Contributing
@z

@x
If you'd like to help out by making a change, take a look at the link:CONTRIBUTING.md[contributor's guide].
@y
If you'd like to help out by making a change, take a look at the link:CONTRIBUTING.md[contributor's guide].
@z
