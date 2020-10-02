SUBDIRS = book ctie images

thisdir  = .
origdir  = @abs_origdir@
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@

thisdate = `date +'%Y/%m/%d'`
hashvalue = `(cd @abs_origdir@ && git log -1 --pretty=format:"%ad %h" --date=short) | sed "s|\-|/|g"`

ALLASC=$(shell find $(abs_installdir) -type f -name '*.asc' -print)

.DEFAULT_GOAL := build
build:  all $(abs_installdir)/progit.html $(abs_installdir)/html.css $(abs_installdir)/attributes-ja.adoc

$(abs_installdir)/progit.html: ctie $(trans) $(copys) $(abs_installdir)/attributes-ja.adoc $(ALLASC)
	@(cd $(abs_installdir) && bundle exec asciidoctor progit.asc -o progit.html)
	@(cd $(abs_installdir) && sed -i -e "s|THISDATE|$(thisdate)|" \
					-e "s|HASHVALUE|$(hashvalue)|" progit.html)
	cp $(abs_installdir)/progit.html $(srcdir)/index.html
$(abs_installdir)/html.css: $(origdir)/theme/html/html.css
	cp -p $^ $@
	cp $(abs_installdir)/html.css $(srcdir)
$(abs_installdir)/attributes-ja.adoc: $(srcdir)/attributes-ja.adoc
	cp -p $^ $@

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	A-git-in-other-environments \
	B-embedding-git-in-your-applications \
	C-git-commands \
	ch01-getting-started \
	ch02-git-basics-chapter \
	ch03-git-branching \
	ch04-git-on-the-server \
	ch05-distributed-git \
	ch06-github \
	ch07-git-tools \
	ch08-customizing-git \
	ch09-git-and-other-systems \
	ch10-git-internals \
	index \
	LICENSE \
	progit \
	README \
	TRANSLATION_NOTES

ch_ascs = $(bases:=.ch)  # ch means change files
tr_ascs = $(bases:=.asc) # tr means translated files
EXTRA_DIST = $(ch_ascs) bin/buildch.perl bin/copymake.sh bin/ctiemake.sh

copyfiles = \
	.travis.yml \
	atlas.json \
	CONTRIBUTING.md \
	Gemfile \
	Pro.ico \
	Rakefile \
	status.json \
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
