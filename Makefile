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

# FLINT is fetched once, built with -fPIC, and cached under ~/.cache/arb4j.
# Subsequent make runs reuse the cached libflint.a without re-downloading.
FLINT_VERSION   := 3.3.1
FLINT_CACHE     := $(HOME)/.cache/arb4j
FLINT_PREFIX    := $(FLINT_CACHE)/flint-$(FLINT_VERSION)
FLINT_STATIC    := $(FLINT_PREFIX)/lib/libflint.a
FLINT_TARBALL   := $(FLINT_CACHE)/flint-$(FLINT_VERSION).tar.gz
FLINT_URL       := https://github.com/flintlib/flint/releases/download/v$(FLINT_VERSION)/flint-$(FLINT_VERSION).tar.gz
FLINT_SRCDIR    := $(FLINT_CACHE)/flint-$(FLINT_VERSION)-src

C_INCLUDES=-I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux \
           -I$(FLINT_PREFIX)/include -I$(FLINT_PREFIX)/include/flint

all: libarblib.so

jar: build/libs/arb4j-$(VERSION).jar

build/libs/arb4j-$(VERSION).jar: install

native/arb_wrap.c: $(shell find native -name "*.i")
	swig $(SWIGFLAGS) native/arb.i
	# FLINT 3.1/3.2 workaround: stride field removed (restored in 3.3)
	sed -i 's|if (arg1) (arg1)->stride = arg2;|// stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c
	sed -i 's|result = (long) ((arg1)->stride);|result = 0; // stride removed in FLINT 3.1-3.2|g' native/arb_wrap.c

# Download FLINT source tarball once; never re-fetches if file exists.
$(FLINT_TARBALL):
	mkdir -p $(FLINT_CACHE)
	curl -L --fail -o $@ $(FLINT_URL)

# Extract, configure, and build FLINT with -fPIC so it can be linked into
# a shared library.  Install into FLINT_PREFIX (inside the cache dir).
# The sentinel is libflint.a itself; rebuild only if it vanishes.
$(FLINT_STATIC): $(FLINT_TARBALL)
	mkdir -p $(FLINT_SRCDIR)
	tar -xzf $(FLINT_TARBALL) -C $(FLINT_SRCDIR) --strip-components=1
	cd $(FLINT_SRCDIR) && \
	  ./configure --prefix=$(FLINT_PREFIX) \
	              --disable-shared --enable-static \
	              CFLAGS="-fPIC -O2" && \
	  make -j$$(nproc) && \
	  make install

libarblib.so: $(SOURCES) $(FLINT_STATIC)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) \
	  -L$(FLINT_PREFIX)/lib -olibarblib.so \
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
