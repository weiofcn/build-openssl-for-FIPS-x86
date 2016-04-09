# targets
BIN = test
OBJS= test.c

# openssl
OPENSSLDIR = ../ssl/

# relevant path
INCLUDES = -I$(OPENSSLDIR)/include/
INCLUDES += -I$(OPENSSLDIR)/fips2.0/include/
LFLAGS = -L$(OPENSSLDIR)/lib/

# compiler
CC = $(OPENSSLDIR)/fips2.0/bin/fipsld
export FIPSLD_CC=gcc
CFLAGS = -Wall

# for FIPS
FIPSMODULE = $(OPENSSLDIR)/fips2.0/lib/fipscanister.o

# librarys
#LIBS = -lcrypto -lssl -ldl
LIBS = $(OPENSSLDIR)/lib/libcrypto.a
LIBS += $(OPENSSLDIR)/lib/libssl.a
LIBS += -ldl

$(BIN): $(OBJS) $(FIPSMODULE)
	$(CC) $(CLFAGS) -o $@ $(OBJS) $(INCLUDES) $(LFLAGS) $(LIBS)

clean:
	rm -rf $(BIN) *.o
