CC  = gcc -Wall -Wextra
BIN = CrossWords
INC = include/
CFLAGS =`sdl-config --libs --cflags` -lESDL -lpthread #-lGL -lGLU -lGLEW -lSDL2_gpu 
CSDL = `sdl-config --cflags`

$(BIN): main.o engine.o mliste.o
	$(CC) main.o engine.o mliste.o -o $(BIN) -lm $(CFLAGS)

main.o: main.c $(INC)engine.h
	$(CC) -c main.c $(CSDL)

engine.o: engine.c $(INC)engine.h
	$(CC) -c engine.c

mliste.o: mliste.c $(INC)mliste.h
	$(CC) -c mliste.c

clean:
	@rm -f *.o
	@rm $(BIN)