SUBDIRS=sections

thisdir  = book/07-git-tools
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
abs_installdir = @abs_installdir@/$(thisdir)

copyfiles = \
	git-credential-read-only

copies = ${addprefix $(abs_installdir)/, $(copyfiles)}

.PHONY: all
all: $(copies)

-include copyfiles.sub
copyfiles.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyfiles $(abs_installdir) $(copyfiles)
