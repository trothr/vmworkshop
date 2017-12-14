#
#
#         Name: vmworkshop/makefile (no suffix)
#
#

BASEURL         =       http://www.casita.net/vmworkshop

DIRECTORIES     =       \
                        1985 1986 1987 1988 1989 1990 1991 \
                        1992 1992/presentations 1992/tools \
                        1993 1994 \
                        1995 1995/presentations 1995/tools \
                        1996 1996/presentations 1996/tools \
                        1997 1997/presentations 1997/tools \
                        1998 1998/presentations 1998/tools \
                        2011 2011/presentations 2011/tools \
                        2012 2012/presentations 2012/tools \
                        2013 2013/presentations 2013/tools \
                        www.homerow.net \
                        www.homerow.net/asm www.homerow.net/rexx \
                        www.homerow.net/zlinux www.homerow.net/zvm \
                        www.marist.edu \
                        www.marist.edu/neale \
                        www.marist.edu/pipeline \
                        www.vm.ibm.com \
                        www.vm.ibm.com/devpages \
                        www.vm.ibm.com/download \
                        www.vm.ibm.com/download/packages \
                        www.vsoft-software.com \
                        zvm.sru.edu zvm.sru.edu/download

MAKEFILES       =       \
                        1995/tools/makefile \
                        1996/tools/makefile \
                        1997/tools/makefile \
                        1998/tools/makefile \
                        www.marist.edu/pipeline/makefile \
                        www.marist.edu/neale/makefile \
                        www.vm.ibm.com/devpages/makefile \
                        www.vm.ibm.com/download/packages/makefile \
                        www.vsoft-software.com/makefile \
                        zvm.sru.edu/download/makefile

ALLFILES        =       $(MAKEFILES) \
                        history.html

all:	$(DIRECTORIES) $(ALLFILES)
	@find . -name makefile -print \
	  | sed 's#^\./##' | grep '/' \
	  | xargs -n 1 dirname \
	| grep -v vsoft | grep -v www.vm.ibm.com | grep -v neale \
	  | xargs -n 1 $(MAKE) -C

$(DIRECTORIES):
	mkdir -p $@

$(MAKEFILES):
	wget -O $@ $(BASEURL)/$@

history.html:
	wget http://ukcc.uky.edu/~workshop/$@






