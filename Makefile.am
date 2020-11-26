SUBDIRS = book ctie images

thisdir  = .
origdir  = @abs_origdir@
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@
abs_thisdir = $(shell cd $(thisdir) && pwd)

thisdate = `date +'%Y/%m/%d'`
hashvalue = `(cd @abs_origdir@ && git log -1 --pretty=format:"%ad %h" --date=short) | sed "s|\-|/|g"`

ALLSUBS=$(shell find book -type f -name '*.asc' -print)

.DEFAULT_GOAL := build
build:  all $(srcdir)/docs/index.html $(abs_installdir)/html.css
$(srcdir)/docs/index.html: $(abs_installdir)/progit.html
	@$(MKDIR_P) $(srcdir)/docs
	cp -p $(abs_installdir)/progit.html $@
	@sed -i -e "s#\<img src\=\"images/#\<img src\=\"assets/images/#g" $@
$(abs_installdir)/progit.html: ctie $(trans) $(copys) $(ALLSUBS) $(abs_installdir)/attributes-ja.adoc
	@(cd $(abs_installdir) && rbenv exec asciidoctor progit.asc -o progit.html)
	@(cd $(abs_installdir) && sed -i -e "s|THISDATE|$(thisdate)|" \
					-e "s|HASHVALUE|$(hashvalue)|" progit.html)
$(abs_installdir)/html.css: $(origdir)/theme/html/html.css
	cp -p $^ $@
	cp $(abs_installdir)/html.css $(srcdir)
$(abs_installdir)/attributes-ja.adoc: $(srcdir)/attributes-ja.adoc
	cp -p $^ $@

@MAINT@.PHONY: git-scm
@MAINT@git-scm: build
@MAINT@	(cd $(GITSCMDIR) && sqlite3 ./db/development.sqlite3 "delete from sections;delete from chapters;delete from xrefs;")
@MAINT@	(cd $(GITSCMDIR) && GENLANG=ja GENPATH=$(abs_thisdir) rbenv exec rake local_genbook2)
@MAINT@	@cp -p $(GITSCMDIR)/db/development.sqlite3 .

@MAINT@.PHONY: dividedpages
@MAINT@dividepages: #git-scm
@MAINT@	@perl $(top_srcdir)/bin/getDividedPages.perl $(top_srcdir)
@MAINT@	@find $(top_srcdir)/docs -name "*.html" -type f | xargs sed -i -f $(srcdir)/admon.sed

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	A-git-in-other-environments          \
	B-embedding-git-in-your-applications \
	C-git-commands                       \
	ch01-getting-started                 \
	ch02-git-basics-chapter              \
	ch03-git-branching                   \
	ch04-git-on-the-server               \
	ch05-distributed-git                 \
	ch06-github                          \
	ch07-git-tools                       \
	ch08-customizing-git                 \
	ch09-git-and-other-systems           \
	ch10-git-internals                   \
	index                                \
	LICENSE                              \
	progit                               \
	README                               \
	TRANSLATION_NOTES

ch_ascs = $(bases:=.ch)  # ch means change files
tr_ascs = $(bases:=.asc) # tr means translated files
EXTRA_DIST = $(ch_ascs) bin/buildch.perl bin/copymake.sh bin/ctiemake.sh

copyfiles = \
	.travis.yml     \
	atlas.json      \
	CONTRIBUTING.md \
	Gemfile         \
	Pro.ico         \
	Rakefile        \
	status.json     \
	TRANSLATING.md

trans = ${addprefix $(abs_installdir)/, $(tr_ascs)}
copies = ${addprefix $(abs_installdir)/, $(copyfiles)}

.PHONY: all
all: $(trans) $(copies)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(tr_ascs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_ascs))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_ascs)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.asc|"` $@; fi

-include copyfiles.sub
copyfiles.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyfiles $(abs_installdir) $(copyfiles)
