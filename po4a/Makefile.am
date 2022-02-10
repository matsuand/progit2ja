SUBDIRS = images book

THIS      = progit2ja
THISDIR   = .
THISSUB   = .
THRESH    = 0
EXTFLAGS  = 
PO4AFLAGS = -k $(THRESH) $(EXTFLAGS)

all: $(top_srcdir)/docs/progit.html

$(top_srcdir)/docs/progit.html: po4a
	@rbenv exec asciidoctor \
	  --attribute lang="ja" \
	  --attribute stylesheet="$(top_srcdir)/po4a/asciidoctor.css" \
	  progit.asc -o $@

include $(top_srcdir)/build-aux/po4a.mk
