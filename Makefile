BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)
SOURCES=native/arb_wrap.c native/complex.c native/ml.c native/pade_resolvent.c
JAVA_HOME=$(shell readlink -f `which javac` | sed "s:bin/javac::")
C_INCLUDES=-I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux -I/usr/include/flint
CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion \
  -Dflint_rand_struct=flint_rand_s \
  -Dflint_rand_init=flint_randinit \
  -Dflint_rand_clear=flint_randclear \
  -Dflint_rand_set_seed=flint_randseed 
SWIGFLAGS=-v -java -package arb -outdir src/main/java/arb

# Static libflint.a is REQUIRED — the resulting libarblib.so must not depend on
# a shared libflint at runtime so it can be loaded from inside the JAR.
# Build FLINT 3.3+ with CFLAGS="-fPIC" ./configure --prefix=/usr/local && make install
# then re-run make.
FLINT_STATIC_CANDIDATES := /usr/local/lib/libflint.a \
                            /usr/lib/libflint.a \
                            /usr/lib/x86_64-linux-gnu/libflint.a
FLINT_STATIC := $(firstword $(wildcard $(FLINT_STATIC_CANDIDATES)))
ifeq ($(FLINT_STATIC),)
  $(error Static libflint.a not found in any of: $(FLINT_STATIC_CANDIDATES). \
    Build FLINT 3.3+ with 'CFLAGS=-fPIC ./configure --prefix=/usr/local && make -j$$(nproc) install' \
    then re-run make.)
endif
FLINT_LIB_DIR := $(dir $(FLINT_STATIC))

all: libarblib.so 

jar: build/libs/arb4j-$(VERSION).jar 

build/libs/arb4j-$(VERSION).jar: install

native/arb_wrap.c: $(shell find native -name "*.i") 
	swig $(SWIGFLAGS) native/arb.i
	# FLINT 3.1/3.2 workaround: stride field removed (restored in 3.3)
	sed -i 's|if (arg1) (arg1)->stride = arg2;|// stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c
	sed -i 's|result = (long) ((arg1)->stride);|result = 0; // stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c

libarblib.so: $(SOURCES)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -L$(FLINT_LIB_DIR) -olibarblib.so \
	  -Wl,-Bstatic -lflint -Wl,-Bdynamic -lxdo 

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
