CC = gcc
TARGET = partialzip
LDFLAGS = -lcurl -lz
uname_s = $(shell uname -s)

all : $(TARGET)

$(TARGET) : partial.o partialzip.o
	$(CC) partial.o partialzip.o -o partialzip -Iinclude $(LDFLAGS)
	@echo "Successfully built $(TARGET) for $(uname_s)"

partial.o : partial.c
	$(CC) -c partial.c -o partial.o -Iinclude

partialzip.o : partialzip.c
	$(CC) -c partialzip.c -o partialzip.o -Iinclude

clean : 
	rm -rf *.o $(TARGET)

install : 
	cp $(TARGET) /usr/bin
