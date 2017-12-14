#
#
#         Name: vmworkshop/www.marist.edu/neale/makefile
#
#

#BASEURL         =       http://pucc.princeton.edu/~neale
#BASEURL         =       http://www2.marist.edu/~neale
BASEURL         =       http://vm.marist.edu/~neale

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | grep -v '/' | xargs $(MAKE)

# index for this archive (better than an auto-index of just the files)
index.html:
	wget $(BASEURL)/index.html

# the list of all files contributed to the this archive
index.f1:	index.html
	cat index.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#<a href=#\n<a href=#g' \
	  | grep '^<a href=' \
	  | sed 's#<a href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	  | grep -v '^mailto:' | grep -v '^http:' | grep -v '^ftp:' \
	  | sed 's# $$##g' | grep -v ' ' | grep -v '^#' \
	  | grep -v '/$$' \
	  > index.f1

# the list of all files contributed to the this archive
index.fl:	index.html index.f1
	cat index.f1 | grep -v '/' | xargs $(MAKE)
	cat *.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#<a href=#\n<a href=#g' \
	  | grep '^<a href=' \
	  | sed 's#<a href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	  | grep -v '^mailto:' | grep -v '^http:' | grep -v '^ftp:' \
	  | sed 's# $$##g' | grep -v ' ' | grep -v '^#' \
	  | grep -v '/$$' \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
#	wget $(BASEURL)/$@
# For files with "$" in the name, we have to get tricky:
	@echo 'wget $(BASEURL)/$@' | sed 's#\$$#%24#g' | sh -x

# a rule to clean things up
clean:
	rm -f index.*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* *.html *.pdf




