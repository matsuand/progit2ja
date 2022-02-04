SUBDIRS = images book

THIS      = progit2ja
THISDIR   = .
THISSUB   = .
THRESH    = 0
EXTFLAGS  = 
PO4AFLAGS = -k $(THRESH) $(EXTFLAGS)

all: $(top_srcdir)/docs/progit.html

$(top_srcdir)/docs/progit.html: po4a
	@rbenv exec asciidoctor progit.asc -o $@

include $(top_srcdir)/build-aux/po4a.mk
