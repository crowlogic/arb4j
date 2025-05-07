BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)
 

SOURCES=native/arb_wrap.c native/complex.c 

JAVA_HOME=$(shell readlink -f /usr/bin/javac | sed "s:bin/javac::")

C_INCLUDES=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I/usr/include/flint

CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion 

SWIGFLAGS=-v -java -package arb -outdir src/main/java/arb

all: libarblib.so jar

jar: build/libs/arb4j-$(VERSION).jar libarblib.so

build/libs/arb4j-$(VERSION).jar: libarblib.so $(shell find src) $(shell find native)
	gradle build

native/arb_wrap.c: $(shell find native -name "*.i") 
	swig $(SWIGFLAGS) native/arb.i

libarblib.so: $(SOURCES)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -olibarblib.so -lflint -lxdo 

clean:
	rm -rf libarblib.so *.o native/arb_wrap.c build/*

test:
	gradle test

documentation:
	gradle javadoc

docs: documentation

doc: docs

install:
	gradle build -x test
	gradle publishToMavenLocal -x test

desktop:
	gradle installDesktop
