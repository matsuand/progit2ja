po4a: po4a_stamp

po4a_stamp: $(srcdir)/$(THIS).po $(srcdir)/$(THIS).pot $(THIS).cfg
	@mkdir -p $(THISSUB)
	po4a $(PO4AFLAGS) $(THIS).cfg
	@touch po4a_stamp

$(THIS).cfg: $(top_srcdir)/po4a/template.cfg $(srcdir)/$(THIS).lst
	@echo Creating $@...
	@sed -e "s|__SRCDIR__|@srcdir@|g" \
	     -e "s|__THIS__|$(THIS)|g" $< > $@
	@while read line; do \
	  echo -n "[type: adoc] $(abs_origdir)/$(THISDIR)/"$$line >>$@ ;\
	  echo    " $$""lang:"$$line                 >>$@ ;\
	done < $(srcdir)/$(THIS).lst

stat:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir $@ ;\
	done
	@msgfmt -v --statistics -o /dev/null $(srcdir)/$(THIS).po 2>&1 | \
	  sed -e "s|@top_srcdir@/.*/\(.*\.po\)|\1|g"

clean:
	rm -f po4a_stamp

.PHONY: po4a stat clean

