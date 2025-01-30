#
#
#         Name: vmtrack.velocitysoftware.com/makefile
#
#

BASEURL         =       http://vmtrack.velocitysoftware.com

# "all" becomes the default target by appearing first
all:		index.fl code.fl
	@echo "$(MAKE):"
	@echo "$(MAKE): ignore 'Timestamp out of range' errors"
	@echo "$(MAKE):"
	cat index.fl code.fl | uniq | sort | uniq | xargs make

# index for this archive (better than an auto-index of just the files)
index.html:
	wget $(BASEURL)/index.html

# the list of all files in this archive referenced in the "index"
index.fl:	index.html
	cat index.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#href=#\nhref=#g' \
	  | sed 's#<img#\n<img#g' \
	  > index.t0
	cat index.t0 | grep '^href=' > index.t1
	cat index.t0 | grep '^<img' \
		| sed 's#src=#\nsrc=#g' | grep '^src=' > index.t2
	cat index.t1 index.t2 \
	  | sed 's#"##g' \
	  | grep -v '^href=mailto:' \
	  | grep -v '^href=http:' \
	  | grep -v '^href=https:' \
	  | sed 's#># #g' | awk '{print $$1}' \
	  | sed 's#href=##' \
	  | sed 's#src=##' \
	  | uniq | sort | uniq \
	  > index.fl
	@rm index.t0 index.t1 index.t2

# the list of all files in this archive referenced in the "index"
code.fl:	code.html
	cat code.html \
	  | sed -r 's# +# #g' \
	  | tr A-Z a-z \
	  | sed 's#href=#\nhref=#g' \
	  | sed 's#<img#\n<img#g' \
	  > code.t0
	cat code.t0 | grep '^href=' > code.t1
	cat code.t0 | grep '^<img' \
		| sed 's#src=#\nsrc=#g' | grep '^src=' > code.t2
	cat code.t1 code.t2 \
	  | sed 's#"##g' \
	  | grep -v '^href=mailto:' \
	  | grep -v '^href=http:' \
	  | grep -v '^href=https:' \
	  | sed 's#># #g' | awk '{print $$1}' \
	  | sed 's#href=##' \
	  | sed 's#src=##' \
	  | uniq | sort | uniq \
	  > code.fl
	@rm code.t0 code.t1 code.t2

# for each item, the default rule is to us 'wget' under the base URL
%:
	wget $(BASEURL)/$@

# a rule to clean things up
clean:
	rm -f index.* code.* *.fl *';'*

# a more aggressive rule to get rid of everything
veryclean:
	rm -f index.* code.* *.fl *';'* \
		*.html *.vmarc *.rexx *.exec *.module \
		*.assemble *.zip *.jpg *.aws *.doc *.text \
		*.read1st *.helpcms *.gif


