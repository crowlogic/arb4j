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

FLINT_VERSION := 3.6.0
FLINT_PREFIX  := $(CACHE)/flint-$(FLINT_VERSION)
FLINT_STATIC  := $(FLINT_PREFIX)/lib/libflint.a
FLINT_TARBALL := $(CACHE)/flint-$(FLINT_VERSION).tar.gz
FLINT_URL     := https://github.com/flintlib/flint/releases/download/v$(FLINT_VERSION)/flint-$(FLINT_VERSION).tar.gz
FLINT_SRCDIR  := $(CACHE)/flint-$(FLINT_VERSION)-src

# xdotool ships no static .a, so (like GMP/MPFR/FLINT) we build libxdo.a from
# source and link it statically.
XDO_VERSION := 3.20211022.1
XDO_PREFIX  := $(CACHE)/xdotool-$(XDO_VERSION)
XDO_STATIC  := $(XDO_PREFIX)/lib/libxdo.a
XDO_TARBALL := $(CACHE)/xdotool-$(XDO_VERSION).tar.gz
XDO_URL     := https://github.com/jordansissel/xdotool/releases/download/v$(XDO_VERSION)/xdotool-$(XDO_VERSION).tar.gz
XDO_SRCDIR  := $(CACHE)/xdotool-$(XDO_VERSION)-src

# The ONLY permitted dynamic dependencies of libarblib.so are libc and the
# Linux loader. Everything else — the entire X11 stack and libxkbcommon
# included — is built from source as -fPIC static archives into one cache
# prefix and linked statically. The distro's static .a files are non-PIC and
# cannot be linked into a shared object, so they are useless here.
X_PREFIX  := $(CACHE)/x11-static
X_STAMP   := $(X_PREFIX)/.built
XORG_URL  := https://xorg.freedesktop.org/releases/individual
# name,url — built in this exact dependency order
X_PACKAGES := \
  xorgproto-2024.1,$(XORG_URL)/proto/xorgproto-2024.1.tar.xz \
  libpthread-stubs-0.5,$(XORG_URL)/lib/libpthread-stubs-0.5.tar.xz \
  libXau-1.0.11,$(XORG_URL)/lib/libXau-1.0.11.tar.xz \
  libXdmcp-1.1.5,$(XORG_URL)/lib/libXdmcp-1.1.5.tar.xz \
  xcb-proto-1.17.0,$(XORG_URL)/proto/xcb-proto-1.17.0.tar.xz \
  libxcb-1.17.0,$(XORG_URL)/lib/libxcb-1.17.0.tar.xz \
  xtrans-1.5.2,$(XORG_URL)/lib/xtrans-1.5.2.tar.xz \
  libX11-1.8.10,$(XORG_URL)/lib/libX11-1.8.10.tar.xz \
  libXext-1.3.6,$(XORG_URL)/lib/libXext-1.3.6.tar.xz \
  libXtst-1.2.5,$(XORG_URL)/lib/libXtst-1.2.5.tar.xz \
  libXinerama-1.1.5,$(XORG_URL)/lib/libXinerama-1.1.5.tar.xz

# libxkbcommon builds only with meson+ninja. Neither is assumed installed and
# pip is never used (PEP 668 externally-managed environments reject it).
# meson is pure Python — its release tarball is executed in place via
# meson.py. ninja is bootstrapped from source with python3 + clang++.
MESON_VERSION := 1.6.0
MESON_DIR     := $(CACHE)/meson-$(MESON_VERSION)
MESON_TARBALL := $(CACHE)/meson-$(MESON_VERSION).tar.gz
MESON_URL     := https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)/meson-$(MESON_VERSION).tar.gz
MESON         := python3 $(MESON_DIR)/meson.py

NINJA_VERSION := 1.12.1
NINJA_DIR     := $(CACHE)/ninja-$(NINJA_VERSION)
NINJA_TARBALL := $(CACHE)/ninja-$(NINJA_VERSION).tar.gz
NINJA_URL     := https://github.com/ninja-build/ninja/archive/refs/tags/v$(NINJA_VERSION).tar.gz
NINJA_BIN     := $(NINJA_DIR)/ninja

XKBCOMMON_VERSION := 1.6.0
XKBCOMMON_STATIC  := $(X_PREFIX)/lib/libxkbcommon.a
XKBCOMMON_TARBALL := $(CACHE)/libxkbcommon-$(XKBCOMMON_VERSION).tar.xz
XKBCOMMON_URL     := https://xkbcommon.org/download/libxkbcommon-$(XKBCOMMON_VERSION).tar.xz
XKBCOMMON_SRCDIR  := $(CACHE)/libxkbcommon-$(XKBCOMMON_VERSION)-src

X_PKG_CONFIG_PATH := $(X_PREFIX)/lib/pkgconfig:$(X_PREFIX)/share/pkgconfig

C_INCLUDES=-I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux \
           -I$(FLINT_PREFIX)/include -I$(FLINT_PREFIX)/include/flint \
           -I$(MPFR_PREFIX)/include -I$(GMP_PREFIX)/include \
           -I$(XDO_PREFIX)/include -I$(X_PREFIX)/include

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

$(XDO_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(XDO_URL)

$(XDO_STATIC): $(XDO_TARBALL) $(X_STAMP) $(XKBCOMMON_STATIC)
	mkdir -p $(XDO_SRCDIR)
	tar -xzf $(XDO_TARBALL) -C $(XDO_SRCDIR) --strip-components=1
	mkdir -p $(XDO_PREFIX)/lib $(XDO_PREFIX)/include
	cd $(XDO_SRCDIR) && \
	  clang -fPIC -O2 -I$(X_PREFIX)/include -c xdo.c -o xdo.o && \
	  clang -fPIC -O2 -I$(X_PREFIX)/include -c xdo_search.c -o xdo_search.o && \
	  ar rcs $(XDO_STATIC) xdo.o xdo_search.o && \
	  cp xdo.h xdo_version.h $(XDO_PREFIX)/include/
	# native/complex.c ships its own xdo_activate_window (with an inverted,
	# 1-on-success return convention the Java side relies on). When libxdo was
	# linked dynamically that local strong symbol shadowed the library's; with
	# static linking both definitions collide. Localize the archive's copy so
	# complex.c's version remains the sole global one, preserving behavior.
	objcopy --localize-symbol=xdo_activate_window $(XDO_STATIC)

# meson is pure Python: extract its release tarball and run meson.py in place.
# No pip, no venv, no system package — immune to PEP 668.
$(MESON_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(MESON_URL)

$(MESON_DIR)/meson.py: $(MESON_TARBALL)
	mkdir -p $(MESON_DIR)
	tar -xzf $(MESON_TARBALL) -C $(MESON_DIR) --strip-components=1
	touch $@

# ninja bootstraps itself from source with python3 + a C++ compiler.
$(NINJA_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(NINJA_URL)

$(NINJA_BIN): $(NINJA_TARBALL)
	mkdir -p $(NINJA_DIR)
	tar -xzf $(NINJA_TARBALL) -C $(NINJA_DIR) --strip-components=1
	cd $(NINJA_DIR) && CXX=clang++ python3 configure.py --bootstrap

# The whole X11 stack, built from source as -fPIC static archives in
# dependency order into one prefix. Distro static .a files are non-PIC and
# cannot be linked into a shared object.
$(X_STAMP):
	mkdir -p $(CACHE) $(X_PREFIX)
	set -e; for spec in $(X_PACKAGES); do \
	  name=$${spec%%,*}; url=$${spec#*,}; \
	  tarball=$(CACHE)/$$name.tar.xz; \
	  [ -f $$tarball ] || curl -L --fail -o $$tarball $$url; \
	  srcdir=$(CACHE)/$$name-src; rm -rf $$srcdir; mkdir -p $$srcdir; \
	  tar -xJf $$tarball -C $$srcdir --strip-components=1; \
	  cd $$srcdir && \
	    PKG_CONFIG_PATH=$(X_PKG_CONFIG_PATH) ./configure --prefix=$(X_PREFIX) \
	      --disable-shared --enable-static CC=clang CFLAGS="-fPIC -O2" && \
	    make -j$$(nproc) && make install; \
	  cd $(CACHE); \
	done
	touch $(X_STAMP)

$(XKBCOMMON_TARBALL):
	mkdir -p $(CACHE)
	curl -L --fail -o $@ $(XKBCOMMON_URL)

$(XKBCOMMON_STATIC): $(XKBCOMMON_TARBALL) $(MESON_DIR)/meson.py $(NINJA_BIN) $(X_STAMP)
	rm -rf $(XKBCOMMON_SRCDIR)
	mkdir -p $(XKBCOMMON_SRCDIR)
	tar -xJf $(XKBCOMMON_TARBALL) -C $(XKBCOMMON_SRCDIR) --strip-components=1
	cd $(XKBCOMMON_SRCDIR) && \
	  CC=clang NINJA=$(NINJA_BIN) $(MESON) setup builddir --prefix=$(X_PREFIX) \
	    --libdir=lib --default-library=static -Dc_args=-fPIC \
	    -Denable-x11=false -Denable-wayland=false -Denable-docs=false \
	    -Denable-tools=false -Denable-xkbregistry=false && \
	  NINJA=$(NINJA_BIN) $(MESON) compile -C builddir && \
	  NINJA=$(NINJA_BIN) $(MESON) install -C builddir

# The single canonical native library lives under src/main/resources so Maven
# packages it into the jar at native/libarblib.so via standard resource
# processing. The repo-root libarblib.so is a symlink to it, so dev runs
# (-Djava.library.path=.) and the packaged jar load the exact same binary.
SO_RESOURCE = src/main/resources/native/libarblib.so

# EVERYTHING is linked statically. The only permitted NEEDED entries are
# libc.so.6 and the loader; the link order below follows the static-archive
# dependency chain (xdo→xkbcommon/Xtst/Xinerama→Xext→X11→xcb→Xau/Xdmcp).
$(SO_RESOURCE): $(SOURCES) $(FLINT_STATIC) $(XDO_STATIC) $(XKBCOMMON_STATIC) $(X_STAMP)
	mkdir -p $(dir $(SO_RESOURCE))
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) \
	  -L$(FLINT_PREFIX)/lib -L$(MPFR_PREFIX)/lib -L$(GMP_PREFIX)/lib -L$(XDO_PREFIX)/lib -L$(X_PREFIX)/lib \
	  -o$(SO_RESOURCE) \
	  -Wl,-Bstatic -lflint -lmpfr -lgmp -lxdo -lxkbcommon \
	  -lXtst -lXinerama -lXext -lX11 -lxcb -lXau -lXdmcp \
	  -Wl,-Bdynamic
	strip $(SO_RESOURCE)

libarblib.so: $(SO_RESOURCE)
	ln -sf $(SO_RESOURCE) libarblib.so

BUILD_INFO = src/main/resources/arb/build-info.properties

# Extract X11 package versions from X_PACKAGES (name-version,url pairs).
# Split on commas and spaces to isolate name-version tokens, drop URLs.
X_VERSIONS = $(shell echo '$(X_PACKAGES)' | tr ', ' '\n' | grep -v http | while read pkg; do \
    v=$$(echo "$$pkg" | rev | sed 's/-.*//' | rev); \
    n=$$(echo "$$pkg" | rev | sed 's/^[^-]*-//' | rev | sed "s/-$$v$$//"); \
    echo "$${n}.version=$$v"; \
  done)

$(BUILD_INFO): Makefile
	@mkdir -p $(dir $@)
	@echo "# Auto-generated by make — do not edit" > $@
	@echo "arb4j.version=$(VERSION)" >> $@
	@echo "gmp.version=$(GMP_VERSION)" >> $@
	@echo "mpfr.version=$(MPFR_VERSION)" >> $@
	@echo "flint.version=$(FLINT_VERSION)" >> $@
	@echo "xdotool.version=$(XDO_VERSION)" >> $@
	@echo "xkbcommon.version=$(XKBCOMMON_VERSION)" >> $@
	@echo "$(X_VERSIONS)" | tr ' ' '\n' >> $@
	@echo "swig.version=$(shell swig -version 2>&1 | grep 'SWIG Version' | sed 's/SWIG Version //')" >> $@
	@echo "java.version=$(shell java -version 2>&1 | head -1 | sed 's/.*"\(.*\)"/\1/')" >> $@

all: libarblib.so $(BUILD_INFO)

# NEVER delete the committed, prebuilt libarblib.so ($(SO_RESOURCE)) nor the
# repo-root symlink to it: it is a tracked binary that the entire build/test
# depends on and is expensive to relink. `clean` removes only build artifacts.
clean:
	rm -rf *.o native/arb_wrap.c build/*

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
