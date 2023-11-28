BASEDIR=$(dirname $(readlink -f $0))/..
INCLUDES=-I/usr/include/x86_64-linux-gnu -I/usr/include/linux -I/usr/include/flint -I/usr/include -I/usr/include/i386-linux-gnu -I/usr/lib/gcc/x86_64-linux-gnu/11/include/
SOURCES=native/arb_wrap.c native/complex.c native/color.c
JAVA_HOME=$(shell readlink -f /usr/bin/javac | sed "s:bin/javac::")
C_INCLUDES=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -I/usr/local/include -I/usr/local/include/flint
CFLAGS=-g -O3 -fPIC -shared -Wno-int-conversion
SWIGFLAGS=-small -v -java -package arb -outdir src/main/java/arb

all: libarblib.so

native/arb_wrap.c: native/*.i
	swig $(SWIGFLAGS) $(INCLUDES) native/arb.i

libarblib.so: $(SOURCES)
	clang $(CFLAGS) $(SOURCES) $(C_INCLUDES) -olibarblib.so -lflint  

clean:
	rm -f libarblib.so *.o native/arb_wrap.c
