BASEDIR=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VERSION=$(shell $(BASEDIR)/bin/arb4jVersion)

INCLUDES=-I/usr/include/x86_64-linux-gnu -I/usr/include/linux -I/usr/include/flint \
 -I/usr/include -I/usr/include/i386-linux-gnu -I/usr/lib/gcc/x86_64-linux-gnu/11/include/

SOURCES=native/arb_wrap.c native/complex.c 

JAVA_HOME=$(shell readlink -f /usr/bin/javac | sed "s:bin/javac::")

C_INCLUDES=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I/usr/local/include -I/usr/local/include/flint

CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion

SWIGFLAGS=-v -java -package arb -outdir src/main/java/arb

all: libarblib.so jar

jar: build/libs/arb4j-$(VERSION).jar libarblib.so

build/libs/arb4j-$(VERSION).jar: libarblib.so $(shell find src) $(shell find native)
	gradle build

native/arb_wrap.c: $(shell find native -name "*.i") 
	swig $(SWIGFLAGS) $(INCLUDES) native/arb.i

libarblib.so: $(SOURCES)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -olibarblib.so -lflint  

clean:
	rm -rf libarblib.so *.o native/arb_wrap.c build/*

cleanGenerated:
	cd $(BASEDIR)/src/main/java/arb && rm -fv Real.java Complex.java RealPolynomial.java ComplexPolynomial.java SWIGTYPE*.java Float.java Rational.java DirichletCharacter.java DirichletGroup.java DirichletPrimeGroup.java FastDFT*.java GMPRandomState.java Magnitude.java Mantissa*.java RandomState.java RealMatrix.java ComplexMatrix.java 

test:
	gradle test

documentation:
	gradle javadoc

docs: documentation

doc: docs
