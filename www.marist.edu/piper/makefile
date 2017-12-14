#
#
#         Name: vmworkshop/www.marist.edu/piper/makefile
#
#

#BASEURL         =       http://pucc.princeton.edu/~piper
#BASEURL         =       http://www2.marist.edu/~piper
BASEURL         =       http://vm.marist.edu/~piper

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | xargs $(MAKE)

# index for this archive (better than an auto-index of just the files)
index.html:
	wget $(BASEURL)/index.html
	@mkdir -p party

# the list of all files contributed to the this archive
index.fl:	index.html party/intro.html
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
	  | grep -v '#' \
	  > index.fl
	cat party/intro.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#<a href=#\n<a href=#g' \
	  | grep '^<a href=' \
	  | sed 's#<a href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	  | grep -v '^mailto:' | grep -v '^http:' | grep -v '^ftp:' \
	  | sed 's# $$##g' | grep -v ' ' | grep -v '^#' \
	  | grep -v '/$$' \
	  | grep -v '#' \
	  | awk '{print "party/" $$1}' >> index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
#	wget $(BASEURL)/$@
# For files with "$" in the name, we have to get tricky:
	@echo 'wget -O $@ $(BASEURL)/$@' | sed 's#\$$#%24#g' | sh -x

# a rule to clean things up
clean:
	rm -f index.*

# a more aggressive rule to get rid of everything
veryclean:
#									-
	rm -f index.* *.html *.vmarc *.rexx *.exec *.module *.xedit \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif *.mailable \
	\
	*.announce *.asmsql *.book *.cntrl *.cslpack *.data* \
	*.'$$exec' \
	*.helplib *.helpxedi *.listing *.maclib *.main *.modpack \
	*.news* *.pdf *.pli *.ps *.script *.txt *.txtlib *.updt* \
	*.updtlist *.vmdt *.vpipe *.3820pack *.list3820 *.pack3820




