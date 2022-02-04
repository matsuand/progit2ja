THIS      = 07-git-tools
THISDIR   = book/$(THIS)
THISSUB   = sections
THRESH    = 0
EXTFLAGS  = 
PO4AFLAGS = -k $(THRESH) $(EXTFLAGS)

all: git-credential-read-only po4a

git-credential-read-only: $(abs_origdir)/$(THISDIR)/git-credential-read-only
	cp -p $< $@

include $(top_srcdir)/build-aux/po4a.mk
