BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)
SOURCES=native/arb_wrap.c native/complex.c native/ml.c native/pade_resolvent.c
JAVA_HOME=$(shell readlink -f `which javac` | sed "s:bin/javac::")
# FLINT must be built with -fPIC for static linking into shared library:
# cd /tmp && wget https://github.com/flintlib/flint/releases/download/v3.3.1/flint-3.3.1.tar.gz
# tar -xzf flint-3.3.1.tar.gz && cd flint-3.3.1
# CFLAGS="-fPIC" ./configure --prefix=/tmp/flint-install-static-pic --enable-static --disable-shared --disable-pthread
# make -j4 && make install
C_INCLUDES=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I/tmp/flint-install-static-pic/include -I/tmp/flint-install-static-pic/include/flint
CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion \
  -Dflint_rand_struct=flint_rand_s \
  -Dflint_rand_init=flint_randinit \
  -Dflint_rand_clear=flint_randclear \
  -Dflint_rand_set_seed=flint_randseed 
SWIGFLAGS=-v -java -package arb -outdir src/main/java/arb

all: libarblib.so 

jar: build/libs/arb4j-$(VERSION).jar 

build/libs/arb4j-$(VERSION).jar: install

native/arb_wrap.c: $(shell find native -name "*.i") 
	swig $(SWIGFLAGS) native/arb.i
	# FLINT 3.1/3.2 workaround: stride field removed (restored in 3.3)
	sed -i 's|if (arg1) (arg1)->stride = arg2;|// stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c
	sed -i 's|result = (long) ((arg1)->stride);|result = 0; // stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c

libarblib.so: $(SOURCES)
	# Static link FLINT (compiled with -fPIC) to avoid runtime libflint.so dependency
	# GMP/MPFR are dynamically linked as they are standard system libraries
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -olibarblib.so -L/tmp/flint-install-static-pic/lib -L/usr/lib -Wl,-Bstatic -lflint -Wl,-Bdynamic -lgmp -lmpfr 

clean:
	rm -rf libarblib.so *.o native/arb_wrap.c build/*

test:
	mvn test

documentation:
	mvn javadoc:javadoc

docs: documentation

doc: docs

install: libarblib.so
	mvn install -Dmaven.test.skip=true

debian-install: libarblib.so
	mvn -Pdebian install -Dmaven.test.skip=true
