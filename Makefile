CC     = gcc
CFLAGS = `pkg-config --cflags gtk+-3.0 gmodule-2.0` -export-dynamic
LIBS   = `pkg-config --libs   gtk+-3.0 gmodule-2.0` -export-dynamic
DEBUG  = -Wall -g
 
OBJECTS = speakalator.o callbacks.o serial.o dictionary.o english3.o phoneme.o
 
all: speakalator
 
speakalator: $(OBJECTS)
	$(CC) $(DEBUG) $(CFLAGS) $(OBJECTS) -o $@ $(LIBS)
speakalator.o: speakalator.c support.h
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
callbacks.o: callbacks.c support.h handles.h
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
serial.o: serial.c serial.h
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
dictionary.o: dictionary.c
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
english3.o: english3.c
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
phoneme.o: phoneme.c
	$(CC) $(DEBUG) $(CFLAGS) -c $< -o $@ $(LIBS)
 
clean:
	rm -f *.o speakalator

run:
	./speakalator

backup:
	tar -cvzf ../speakalator.tgz .

binary:
	@cp speakalator ../speakalator-`uname -s|tr '[:upper:]' '[:lower:]'`-`uname -m | tr '[:upper:]' '[:lower:]'`
