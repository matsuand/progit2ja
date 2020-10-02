SUBDIRS=01-introduction 02-git-basics 03-git-branching 04-git-server \
	05-distributed-git 06-github 07-git-tools 08-customizing-git \
	09-git-and-other-scms 10-git-internals A-git-in-other-environments \
	B-embedding-git

thisdir  = book
origdir  = @abs_origdir@/$(thisdir)
top_origdir = @abs_origdir@
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@/$(thisdir)

.PHONY: all
all: ctie $(trans) $(abs_installdir)/contributors.txt

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	contributors \
	dedication \
	index \
	introduction \
	license \
	preface_ben \
	preface_schacon \
	toc

ch_ascs = $(bases:=.ch)  # ch means change files
tr_ascs = $(bases:=.asc) # tr means translated files
EXTRA_DIST = $(ch_ascs)

trans = ${addprefix $(abs_installdir)/, $(tr_ascs)}

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	$(MKDIR_P) $(abs_installdir)
	@$(top_srcdir)/bin/ctiemake.sh $(tr_ascs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_ascs))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_ascs)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.asc|"` $@; fi

$(abs_installdir)/contributors.txt:
	(cd $(top_origdir) && git shortlog -s | grep -v -E "(Straub|Chacon)" | cut -f 2- | column -c 120 > $@)
