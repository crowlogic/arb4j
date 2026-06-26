BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)
SOURCES=native/arb_wrap.c native/complex.c native/ml.c
JAVA_HOME=$(shell readlink -f `which javac` | sed "s:bin/javac::")
FLINT_PREFIX ?= /usr
FLINT_LIB_DIR ?= $(FLINT_PREFIX)/lib
C_INCLUDES=-I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux -I$(FLINT_PREFIX)/include -I$(FLINT_PREFIX)/include/flint
CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion \
  -Dflint_rand_struct=flint_rand_s \
  -Dflint_rand_init=flint_randinit \
  -Dflint_rand_clear=flint_randclear \
  -Dflint_rand_set_seed=flint_randseed 
FLINT_STATIC_LIBS := $(wildcard $(FLINT_LIB_DIR)/libflint.a) $(wildcard $(FLINT_LIB_DIR)/libmpfr.a) $(wildcard $(FLINT_LIB_DIR)/libgmp.a) $(wildcard /usr/lib/x86_64-linux-gnu/libmpfr.a) $(wildcard /usr/lib/x86_64-linux-gnu/libgmp.a)
XDO_STATIC_LIBS := $(wildcard $(FLINT_LIB_DIR)/libxdo.a) $(wildcard /usr/lib/x86_64-linux-gnu/libxdo.a)
ifeq ($(strip $(FLINT_STATIC_LIBS) $(XDO_STATIC_LIBS)),)
LDFLAGS=-lflint -lmpfr -lgmp -lxdo
else
LDFLAGS=-Wl,-Bstatic -Wl,--start-group $(FLINT_STATIC_LIBS) $(XDO_STATIC_LIBS) -Wl,--end-group -Wl,-Bdynamic -lm -lstdc++ -lxdo
endif
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
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -olibarblib.so $(LDFLAGS)

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
