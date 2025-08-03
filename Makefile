PKGCONFIG = $(shell which pkg-config)
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk4)
LIBS = $(shell $(PKGCONFIG) --libs gtk4)

TARGET = bin/example-0
SOURCES = src/example-0.c

default: all

all: $(TARGET)

$(TARGET): $(SOURCES)
	@if [[ ! -d bin ]]; then mkdir bin; fi
	@if [[ ! -f compile_commands.json ]]; then rm -f $(TARGET) && bear -- make; fi
	gcc $(CFLAGS) $(SOURCES) -o $(TARGET) $(LIBS)

clean:
	rm -f $(TARGET)
