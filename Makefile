PKGCONFIG = $(shell which pkg-config)
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk4)
LIBS = $(shell $(PKGCONFIG) --libs gtk4)

TARGET = bin/example-3
SOURCES = src/example-3.c

default: all

all: $(TARGET)

test: $(TARGET) run

$(TARGET): $(SOURCES)
	@if [[ ! -d bin ]]; then mkdir bin; fi
	gcc $(CFLAGS) -o $(TARGET) $(SOURCES) $(LIBS)

run: $(TARGET)
	exec $(TARGET)

compile_commands:
	rm -f $(TARGET) && bear -- make

clean:
	rm -f $(TARGET)
