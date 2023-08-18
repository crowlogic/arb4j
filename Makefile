BASEDIR=$(dirname $(readlink -f $0))/..
INCLUDES=-I/usr/include/x86_64-linux-gnu -I/usr/include/linux -I/usr/include/flint -I/usr/include -I/usr/include/i386-linux-gnu -I/usr/lib/gcc/x86_64-linux-gnu/11/include/
SOURCES:=native/arb_wrap.c native/color.c native/complex.c
JAVA_HOME=$(shell readlink -f /usr/bin/javac | sed "s:bin/javac::")

all: libarblib.so

native/arb_wrap.c: native/*.i
	swig -small -v -java -package arb -outdir src/main/java/arb $(INCLUDES) native/arb.i

libarblib.so: $(SOURCES)
	clang -g -O3 -fPIC -shared -Wno-int-conversion $(SOURCES) -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -olibarblib.so -lflint-arb  

clean:
	rm -f libarblib.so *.o native/arb_wrap.c
