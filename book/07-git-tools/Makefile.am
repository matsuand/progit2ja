SUBDIRS=sections

thisdir  = book/07-git-tools
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@/$(thisdir)

files = \
	git-credential-read-only

copys = ${addprefix $(abs_installdir)/, $(files)}

.PHONY: all
all: $(copys)

-include copyfiles.sub
copyfiles.sub: $(top_srcdir)/bin/copymake.sh
	@$^ copyfiles . $(files)
