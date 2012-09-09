all: build/font2openvg build/font2openvg-json

clean:
	rm -rf build

CPP     = g++
CFLAGS  += -c -Wall $(shell freetype-config --cflags)
LDFLAGS += -Wall $(shell freetype-config --libs)

build/font2openvg.o: src/font2openvg.cpp
	mkdir -p `dirname $@`
	$(CPP) -o $@ $(CFLAGS) $<

build/font2openvg: build/font2openvg.o
	$(CPP) -o $@ $(LDFLAGS) $<

build/font2openvg-json.o: src/font2openvg-json.cpp
	mkdir -p `dirname $@`
	$(CPP) -o $@ $(CFLAGS) $<

build/font2openvg-json: build/font2openvg-json.o
	$(CPP) -o $@ $(LDFLAGS) $<
