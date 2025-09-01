TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
BUILD_DIRS = obj bin

.PHONY: run
run: clean default
	./$(TARGET) -f ./mynewdb.db -n 
	./$(TARGET) -f ./mynewdb.db -a "Timmy H.,123 Sheshire Ln.,120"

.PHONY: default
default: $(BUILD_DIRS) $(TARGET)

.PHONY: clean
clean:
	-rm -f obj/*.o
	-rm -f bin/*
	-rm -f *.db

$(TARGET): $(OBJ)
	gcc -o $@ $?

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude

$(BUILD_DIRS):
	mkdir -p $@

