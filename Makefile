#
all: openssl-1.0.1c/.built setenv

openssl-fips-2.0.12.tar.gz:
	#wget http://www.openssl.org/source/openssl-fips-2.0.1.tar.gz
	wget http://45.78.29.98/openssl-fips-2.0.12.tar.gz

openssl-1.0.2g.tar.gz:
	#wget http://www.openssl.org/source/openssl-1.0.1c.tar.gz
	wget http://45.78.29.98/openssl-1.0.2g.tar.gz

ssl/:	
	mkdir ssl

setenv:
	env OPENSSL_FIPS=1

openssl-fips-2.0.12/.built: openssl-fips-2.0.12.tar.gz ssl/ setenv
	gunzip -c openssl-fips-2.0.12.tar.gz | tar xf -
	cd openssl-fips-2.0.12 && \
	export FIPSDIR=$$PWD/../ssl/fips2.0 && \
	./config && \
	make && \
	make install && \
	touch .built

openssl-1.0.1c/.built: openssl-fips-2.0.12/.built openssl-1.0.2g.tar.gz
	gunzip  -c openssl-1.0.2g.tar.gz | tar xf -
	cd openssl-1.0.2g && \
	./config fips shared --openssldir=$$PWD/../ssl --with-fipsdir=$$PWD/../ssl/fips2.0 && \
	make depend && \
	make && \
	make install_sw &&\
	touch .built

clean:
	rm -rf openssl-fips-2.0.12 openssl-1.0.2g ssl

