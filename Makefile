all: libarblib.so

SOURCES:=native/arb_wrap.cxx native/color.c native/complex.c 

libarblib.so: $(SOURCES)
	clang++ -fsanitize=address -g -fPIC -shared $(SOURCES) -I/usr/lib/jvm/jdk-17/include -I/usr/lib/jvm/jdk-17/include/linux -olibarblib.so -lflint-arb 

clean:
	rm -f libarblib.so *.o
