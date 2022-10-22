all: libarblib.so

SOURCES:=native/arb_wrap.c native/color.c native/complex.c 
JAVA_HOME=$(shell readlink -f /usr/bin/javac | sed "s:bin/javac::")

libarblib.so: $(SOURCES)
#	clang -fsanitize=address -g -fPIC -shared $(SOURCES) -I$(JAVA_HOME)include -I$(JAVA_HOME)include/linux -olibarblib.so -lflint-arb 
	clang -O3 -g -fPIC -shared -Wno-error=int-conversion $(SOURCES) -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -olibarblib.so -lflint-arb 

clean:
	rm -f libarblib.so *.o
