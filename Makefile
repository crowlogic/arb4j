all: libarblib.so

SOURCES:=native/arb_wrap.c native/color.c native/complex.c 
libarblib.so: $(SOURCES)
	clang -g -O3 -fPIC -shared -Wno-error=int-conversion $(SOURCES) -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -olibarblib.so -lflint-arb  

clean:
	rm -f libarblib.so *.o
