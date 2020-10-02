thisdir  = book/B-embedding-git/sections
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@/$(thisdir)

.PHONY: all
all: ctie $(trans)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	command-line \
	dulwich \
	go-git \
	jgit \
	libgit2

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
