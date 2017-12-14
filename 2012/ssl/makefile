#
#
#
#	  -cert /etc/ssl/cacert.pem
#	  -keyfile /etc/ssl/private/cakey.pem
#
#


_default:
	@echo "$(MAKE): specify something to make"
	@sh -c ' exit -1 '

all:	CAkey.pem     CAreq.pem     CAcrt.pem \
	serverkey.pem serverreq.pem servercrt.pem \
	clientkey.pem clientreq.pem clientcrt.pem

# CAkey.pem: CA identity
# CAreq.pem: (intermediate and optional)
# CAcrt.pem: CA certificate, distributed for verification

# serverkey.pem: server identity
# serverreq.pem: intermediate, certificate request
# servercrt.pem: server certificate

# clientkey.pem: client identity
# clientreq.pem: intermediate, certificate request
# clientcrt.pem: client certificate


########################################################################
# CA files
#
CAkey.pem:
	openssl genrsa -out CAkey.pem 4096

CAreq.pem:	CAkey.pem
	@echo "###"
	@echo "### generating a CA certificate (staged)"
	@echo "###"
	openssl req -new \
	  -key CAkey.pem -out CAreq.pem \
	  -config ./openssl.cnf


one-shot:	CAkey.pem
	@echo "###"
	@echo "### generating a self signed CA certificate"
	@echo "###"
	openssl req -new -x509 -days 3700 -extensions v3_ca \
	  -key CAkey.pem -out CAcrt.tmp \
	  -config ./openssl.cnf
	mv CAcrt.tmp CAcrt.pem

two-step: CAcrt.pem

CAcrt.pem:	CAreq.pem
	$(MAKE) index.txt serial
	openssl ca -days 3700  -extensions v3_ca \
	  -keyfile CAkey.pem \
	  -config ./openssl.cnf \
	  -selfsign -in CAreq.pem \
	  -out CAcrt.tmp
	mv CAcrt.tmp CAcrt.pem

index.txt:
	touch index.txt

serial:
	echo "00" > serial

########################################################################
# client files
#
clientkey.pem:
#	openssl genrsa -des3 -out clientkey.pem 1024
#	openssl genrsa       -out clientkey.pem 1024
	openssl genrsa       -out clientkey.pem 4096
#	@chmod go-rw clientkey.pem

# generate a "certificate request" (a request for signature)
clientreq.pem:	clientkey.pem
	@echo "###"
	@echo "### generating a client certificate request"
	@echo "###"
	openssl req -new -key clientkey.pem -out clientreq.pem \
	  -config ./openssl.cnf

# we could generate a self-signed client certificate, but
# in X.509 PKI space, a self-signed client certificate is not useful
# so here we always sign with the CA key and certificate
clientcrt.pem:	clientreq.pem CAcrt.pem CAkey.pem
	@rm -f clientcrt.tmp
	@touch clientcrt.tmp
#	sudo
	openssl ca -in clientreq.pem \
	  -cert CAcrt.pem \
	  -keyfile CAkey.pem \
	  -out clientcrt.tmp \
	  -config ./openssl.cnf
	mv clientcrt.tmp clientcrt.pem

clientcrt.p12:	clientcrt.pem
	openssl pkcs12 -export -clcerts \
	  -in clientcrt.pem -inkey clientkey.pem \
	  -out clientcrt.p12

verify: 	clientcrt.pem
	openssl x509 -in clientcrt.pem -text

########################################################################
# server files
#
serverkey.pem:
	openssl genrsa       -out serverkey.pem 4096

serverreq.pem:	serverkey.pem
	@echo "###"
	@echo "### generating a server certificate request"
	@echo "###"
	openssl req -new -key serverkey.pem -out serverreq.pem \
	  -config ./openssl.cnf

# we could generate a self-signed server certificate, but
# in X.509 PKI space, a self-signed server certificate requires
# manual assertion by the end user which is counter-consumerist
servercrt.pem:	serverreq.pem CAcrt.pem CAkey.pem
	@rm -f servercrt.tmp
	@touch servercrt.tmp
	openssl ca -in serverreq.pem \
	  -cert CAcrt.pem \
	  -keyfile CAkey.pem \
	  -out servercrt.tmp \
	  -config ./openssl.cnf
	mv servercrt.tmp servercrt.pem



########################################################################

openssl.cnf:
	wget http://www.casita.net/vmworkshop/2012/ssl/openssl.cnf

clean:
	@rm -f *.tmp *';'*

distclean:
	@rm -f *.tmp *';'* *.pem index.txt* serial*




