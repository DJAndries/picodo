SRC = $(wildcard src/*.c)
SRC_OBJ = $(SRC:src/%.c=obj/%.o)

all: obj bin bin/picodo.hex

bin/picodo.hex: $(SRC_OBJ)
	sdcc $(ADD_FLAGS) -Wl-m --use-non-free --stack-size 15 -mpic14 -p16f876 -o $@ $(SRC_OBJ)

obj/%.o: src/%.c
	sdcc $(ADD_FLAGS) --use-non-free -mpic14 --stack-size 15 -p16f876 -c $< -o $@

bin:
	mkdir bin

obj:
	mkdir obj

clean:
	rm -f obj/* bin/*

upload:
	scp ./bin/picodo.* pi@$$PI_IP:/home/pi/
