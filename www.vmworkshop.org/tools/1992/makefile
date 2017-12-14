#
#
#         Name: vmworkshop/www.vmworkshop.org/tools/1992/makefile
#
#

BASEURL         =       ftp://www.vmworkshop.org/tools/1992

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | uniq | sort | uniq | xargs make

# index for this archive (better than an auto-index of just the files)
index.html:
	#wget $(BASEURL)/index.html
	wget -q -O - $(BASEURL)/ > index.html

# the list of all files in this archive referenced in the "index"
index.fl:	index.html
	cat index.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#href=#\nhref=#g' \
	  | sed 's#<img#\n<img#g' \
	  | sed 's#"##g' \
	  | grep -v '^href=mailto:' \
	  | grep -v '^href=http:' \
	  | grep -v '^href=https:' \
	  | grep '^href=' \
	  | sed 's#># #g' | awk '{print $$1}' \
	  | sed 's#href=##' \
	  | awk -F/ '{print $$6}' \
	  | uniq | sort | uniq \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
	wget $(BASEURL)/$@

# a rule to clean things up
clean:
	rm -f index.* *.fl *';'*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* code.* *.fl *';'* \
		*.html *.vmarc *.rexx *.exec *.module \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif


