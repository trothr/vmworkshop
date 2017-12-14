#
#
#         Name: vmworkshop/www.vsoft-software.com/makefile
#
#

BASEURL         =       http://www.vsoft-software.com

# "all" becomes the default target by appearing first
all:		index.fl
	cat index.fl | xargs make

# index for this archive (better than an auto-index of just the files)
downloads.html:
	wget $(BASEURL)/downloads.html

# the list of all files contributed to the this archive
index.fl:	downloads.html
	cat downloads.html \
	  | sed -r 's# +# #g' \
	  | sed 's#href=#\nhref=#g' \
	  | grep -i '^href=' \
	  | sed 's#href=#*#g' | sed 's#>#*#g' \
	  | awk -F'*' '{print $$2}' | sed 's#"##g' \
	| sed 's#$(BASEURL)/##g' \
	| grep -v 'z_VMLicenseandCharges' \
	  | grep -v '^mailto:' | grep -v '^http:' \
	  | sed 's# $$##g' | grep -v ' ' \
	  | grep -v '/$$' \
	  | tr A-Z a-z \
	  > index.fl

# for each item, the default rule is to us 'wget' under the base URL
%:
	wget $(BASEURL)/$@

# a rule to clean things up
clean:
	rm -f index.*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* *.html *.vmarc *.rexx *.exec *.module \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif *.mailable




