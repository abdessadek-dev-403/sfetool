CC = gcc

CFLAGS = -Wall -Iinclude -g

LDFLAGS = -lssl -lcrypto -lcutils

CUTILS_PATH = /home/abdullah/workspace/c/libcutils

SRC = src/main.c src/auth.c src/sfetool.c

OBJ = bin/main.o bin/auth.o bin/sfetool.o

HEADER = include/auth.h include/sfetool.h

TARGET = bin/sfetool

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) -L$(CUTILS_PATH) $(LDFLAGS)

bin/%.o: src/%.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf bin/*

run:
	./$(TARGET)

.PHONY: clean run