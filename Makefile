BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)
SOURCES=native/arb_wrap.c native/complex.c native/ml.c native/pade_resolvent.c
JAVA_HOME=$(shell readlink -f `which javac` | sed "s:bin/javac::")
SWIGFLAGS=-v -java -package arb -outdir src/main/java/arb
CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion \
  -Dflint_rand_struct=flint_rand_s \
  -Dflint_rand_init=flint_randinit \
  -Dflint_rand_clear=flint_randclear \
  -Dflint_rand_set_seed=flint_randseed

# GMP, MPFR, and FLINT are each fetched once, built with -fPIC
# --disable-shared, and cached under ~/.cache/arb4j.
# Subsequent make runs reuse the cached .a files without re-downloading.
CACHE := $(HOME)/.cache/arb4j

GMP_VERSION  := 6.2.1
GMP_PREFIX   := $(CACHE)/gmp-$(GMP_VERSION)
GMP_STATIC   := $(GMP_PREFIX)/lib/libgmp.a
GMP_TARBALL  := $(CACHE)/gmp-$(GMP_VERSION).tar.xz
GMP_URL      := https://gmplib.org/download/gmp/gmp-$(GMP_VERSION).tar.xz
GMP_SRCDIR   := $(CACHE)/gmp-$(GMP_VERSION)-src

MPFR_VERSION := 4.2.2
MPFR_PREFIX  := $(CACHE)/mpfr-$(MPFR_VERSION)
MPFR_STATIC  := $(MPFR_PREFIX)/lib/libmpfr.a
MPFR_TARBALL := $(CACHE)/mpfr-$(MPFR_VERSION).tar.xz
MPFR_URL     := https://www.mpfr.org/mpfr-$(MPFR_VERSION)/mpfr-$(MPFR_VERSION).tar.xz
MPFR_SRCDIR  := $(CACHE)/mpfr-$(MPFR_VERSION)-src

FLINT_VERSION := 3.3.1
FLINT_PREFIX  := $(CACHE)/flint-$(FLINT_VERSION)
FLINT_STATIC  := $(FLINT_PREFIX)/lib/libflint.a
FLINT_TARBALL := $(CACHE)/flint-$(FLINT_VERSION).tar.gz
FLINT_URL     := https://github.com/flintlib/flint/releases/download/v$(FLINT_VERSION)/flint-$(FLINT_VERSION).tar.gz
FLINT_SRCDIR  := $(CACHE)/flint-$(FLINT_VERSION)-src

C_INCLUDES=-I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux \
           -I$(FLINT_PREFIX)/include -I$(FLINT_PREFIX)/include/flint \
           -I$(MPFR_PREFIX)/include -I$(GMP_PREFIX)/include

all: libarblib.so

jar: build/libs/arb4j-$(VERSION).jar

build/libs/arb4j-$(VERSION).jar: install

native/arb_wrap.c: $(shell find native -name "*.i")
	swig $(SWIGFLAGS) native/arb.i
	# FLINT 3.1/3.2 workaround: stride field removed (restored in 3.3)
	sed -i 's|if (arg1) (arg1)->stride = arg2;|// stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c
	sed -i 's|result = (long) ((arg1)->stride);|result = 0; // stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c

$(GMP_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(GMP_URL)

$(GMP_STATIC): $(GMP_TARBALL)
	mkdir -p $(GMP_SRCDIR)
	tar -xJf $(GMP_TARBALL) -C $(GMP_SRCDIR) --strip-components=1
	cd $(GMP_SRCDIR) && \
	  ./configure --prefix=$(GMP_PREFIX) \
	              --disable-shared --enable-static \
	              --disable-assembly \
	              CC=clang CFLAGS="-fPIC -O2" && \
	  make -j$$(nproc) && \
	  make install

$(MPFR_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(MPFR_URL)

$(MPFR_STATIC): $(MPFR_TARBALL) $(GMP_STATIC)
	mkdir -p $(MPFR_SRCDIR)
	tar -xJf $(MPFR_TARBALL) -C $(MPFR_SRCDIR) --strip-components=1
	cd $(MPFR_SRCDIR) && \
	  ./configure --prefix=$(MPFR_PREFIX) \
	              --disable-shared --enable-static \
	              --with-gmp=$(GMP_PREFIX) \
	              CC=clang CFLAGS="-fPIC -O2" \
	              LDFLAGS="-L$(GMP_PREFIX)/lib" && \
	  make -j$$(nproc) && \
	  make install

$(FLINT_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(FLINT_URL)

$(FLINT_STATIC): $(FLINT_TARBALL) $(MPFR_STATIC)
	mkdir -p $(FLINT_SRCDIR)
	tar -xzf $(FLINT_TARBALL) -C $(FLINT_SRCDIR) --strip-components=1
	cd $(FLINT_SRCDIR) && \
	  ./configure --prefix=$(FLINT_PREFIX) \
	              --disable-shared --enable-static \
	              --with-gmp=$(GMP_PREFIX) \
	              --with-mpfr=$(MPFR_PREFIX) \
	              CC=clang CFLAGS="-fPIC -O2" && \
	  make -j$$(nproc) && \
	  make install

libarblib.so: $(SOURCES) $(FLINT_STATIC)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) \
	  -L$(FLINT_PREFIX)/lib -L$(MPFR_PREFIX)/lib -L$(GMP_PREFIX)/lib \
	  -olibarblib.so \
	  -Wl,-Bstatic -lflint -lmpfr -lgmp \
	  -Wl,-Bdynamic -lxdo
	strip libarblib.so

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
