SUBDIRS = 01-introduction 02-git-basics 03-git-branching 04-git-server \
	05-distributed-git 06-github 07-git-tools 08-customizing-git \
	09-git-and-other-scms 10-git-internals A-git-in-other-environments \
	B-embedding-git

THIS      = book
THISDIR   = $(THIS)
THISSUB   = 01-introduction/sections
THRESH    = 0
EXTFLAGS  = 
PO4AFLAGS = -k $(THRESH) $(EXTFLAGS)

all: contributors.txt po4a

contributors.txt:
	(cd $(abs_origdir) && git shortlog -s | \
	  grep -v -E "(Straub|Chacon)" | cut -f 2- | column -c 120 > $(abs_builddir)/$@)

include $(top_srcdir)/build-aux/po4a.mk
