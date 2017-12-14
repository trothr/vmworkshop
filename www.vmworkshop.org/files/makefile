#
#
#
#
#

FILES		=	\
	show-mailable.txt \
	DIRM-XX.html DIRM-xx.txt PF10PF11.txt \
	VMARCL.VMARC


_default:	$(FILES)

#
# SHOW (fast file and spool browser) 
show-mailable.txt:
	wget \
	  http://www.vmworkshop.org/sites/www.vmworkshop.org/files/show-mailable.txt

#
# DIRM-XX
PF10PF11.txt:
	wget \
	  http://www.vmworkshop.org/sites/www.vmworkshop.org/files/PF10PF11.txt

DIRM-xx.txt:
	wget \
	  http://www.vmworkshop.org/sites/www.vmworkshop.org/files/DIRM-xx.txt

DIRM-XX.html:
	curl -s \
	  http://www.vmworkshop.org/node/252 > DIRM-XX.html

#
# VMARCL (FILELIST-like UI for VMARC Files) 
VMARCL.VMARC:
	wget \
	  http://www.vmworkshop.org/sites/www.vmworkshop.org/files/VMARCL.VMARC




