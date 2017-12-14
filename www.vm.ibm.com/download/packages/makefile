#
#
#         Name: vmworkshop/www.vm.ibm.com/download/packages/makefile
#
#

BASEURL         =       http://www.vm.ibm.com/download/packages

# "all" becomes the default target by appearing first
all:		index.fl license.html
	cat index.fl | xargs make

# index for this archive (better than an auto-index of just the files)
index.html:
	wget $(BASEURL)/index.html

# BKW spake: "You may use the submitted downloadable packages
#  from /download/packages/ in accordance with the download library
#  license terms.  The license is posted at /download/license.html."
license.html:
	wget $(BASEURL)/../license.html

# the list of all files contributed to the this archive
index.fl:	index.html
	cat index.html \
	  | sed -r 's# +# #g' \
	  | sed 's#<a href=#\n<a href=#g' \
	  | grep -i '^<a href=' \
	  | sed 's#<a href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	  | grep -v '^mailto:' | grep -v '^http:' \
	  | sed 's# $$##g' | grep -v ' ' \
	  | grep -v '/$$' \
	  | grep -v '#' | grep -v '\.\.' | grep -v '?' | grep -v '/' \
	  | tr A-Z a-z \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
	echo "wget $(BASEURL)/$@" \
	  | sed 's#\$$#%24#g' \
	  | sh

# a rule to clean things up
clean:
	rm -f index.*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* *.html *.vmarc *.rexx *.exec *.module \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif




