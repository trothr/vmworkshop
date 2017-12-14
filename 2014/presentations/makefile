#
#
#         Name: vmworkshop/2014/presentations
#
#

BASEURL         =       http://www.vmworkshop.org/2014/presentations
FILEURL         =       http://www.vmworkshop.org/sites/www.vmworkshop.org/files

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | uniq | sort | uniq | xargs make

# index for this archive (better than an auto-index of just the files)
#index.html:
#	wget $(BASEURL)/index.html
index.ht:
	wget -O - $(BASEURL) > index.ht

# the list of all files in this archive referenced in the "index"
index.fl:	index.ht
	cat index.ht \
	  | sed 's#<a href=#\n<a href=#g' \
	  | sed -r 's# +# #g' \
	  | grep -i '^<a href=' \
	  | sed 's#># #g' | awk '{print $$2}' \
	  | sed 's#href=##' \
	  | sed 's#"##g' \
	  | grep -i '$(FILEURL)' \
	  | sed 's#$(FILEURL)/##' \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
#	wget $(BASEURL)/$@
	wget $(FILEURL)/$@

# a rule to clean things up
clean:
	rm -f index.* *.fl

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* *.fl *.html *.vmarc *.rexx *.exec *.module \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif *.pdf *.ppt *.odp *.ht


