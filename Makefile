all: libarblib.so

SOURCES:=native/arb_wrap.c native/color.c native/complex.c 

libarblib.so: $(SOURCES)
#	clang -fsanitize=address -g -fPIC -shared $(SOURCES) -I/usr/lib/jvm/jdk-17/include -I/usr/lib/jvm/jdk-17/include/linux -olibarblib.so -lflint-arb 
	clang -O3 -g -fPIC -shared $(SOURCES) -I/usr/lib/jvm/jdk-17/include -I/usr/lib/jvm/jdk-17/include/linux -olibarblib.so -lflint-arb 

clean:
	rm -f libarblib.so *.o
