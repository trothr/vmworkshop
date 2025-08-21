#
#
#         Name: vmworkshop/makefile (no suffix)
#
#

BASEURL         =       http://www.casita.net/vmworkshop

DIRECTORIES     =       \
                        1985 1986 1987 1988 1989 1990 1991 \
                        1992 1992/presentations 1992/tools \
                        1993 1993/presentations 1993/tools \
                        1994 1994/presentations 1994/tools \
                        1995 1995/presentations 1995/tools \
                        1996 1996/presentations 1996/tools \
                        1997 1997/presentations 1997/tools \
                        1998 1998/presentations 1998/tools \
                        2011 2011/presentations 2011/tools \
                        2012 2012/presentations 2012/tools \
                        2013 2013/presentations 2013/tools \
                        2014 2014/presentations 2014/tools \
                        2015 2015/presentations 2015/tools \
                        2016 2016/presentations 2016/tools \
                        2017 2017/presentations 2017/tools \
                        2018 2018/presentations 2018/tools \
                        2019 2019/presentations 2019/tools \
                        2020 2020/presentations 2020/tools \
                        2021 2021/presentations 2021/tools \
                        2022 2022/presentations 2022/tools \
                        2023 2023/presentations 2023/tools \
                        www.homerow.net \
                        www.homerow.net/asm www.homerow.net/rexx \
                        www.homerow.net/zlinux www.homerow.net/zvm \
                        www.homerow.net/images www.homerow.net/files \
                        www.homerow.net/files/examples \
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






