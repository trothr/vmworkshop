#
#
#         Name: vmworkshop/1995/tools/makefile
#
#

#BASEURL         =       http://www2.marist.edu/~workshop
BASEURL         =       http://vm.marist.edu/~workshop

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | xargs make

# "tools95.html" is the root of the 1995 VM Workshop tools archive
tools95.html:
	wget $(BASEURL)/tools95.html

# index for this year is defined by "tools95.html"
index.html:	tools95.html
	cp -p tools95.html index.html

# the first index lists HTML files, which then list the other files
index.f1:	index.html
	cat index.html \
	  | sed -r 's# +# #g' \
	  | sed 's#href=#\nhref=#g' \
	  | grep -i '^href=' \
	  | sed 's#href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	  | grep -v '^mailto:' | grep -v '^http:' \
	  | sed 's# $$##g' | grep -v ' ' \
	  | grep -v '/$$' \
	  | tr A-Z a-z \
	  > index.f1

# the list of all files is derived from the collected HTML files
index.fl:	index.f1
	cat index.f1 | xargs echo make
	cat *.html \
	  | sed 's#href=#\nhref=#g' \
	  | grep '^href=' \
	  | sed 's#href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' \
	  | sed 's#"##g' \
	  | grep -v '^mailto:' \
	  | grep -v '^http:' \
	  | grep -v '/$$' \
	  | uniq | sort | uniq \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
	wget $(BASEURL)/$@

# a rule to clean things up
clean:
	rm -f index.*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* *.html *.vmarc *.rexx *.exec *.module




