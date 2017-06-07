
RPI_HOST=192.168.90.9
RPI_USER=alarm
CC=aarch64-linux-gnu-gcc
FLAG=-Wall
CFLAG=${FLAG}
OBJS=main.o
TARGET=main
all:$(TARGET)
	@echo "*** Done ***"

upload:$(TARGET)
	scp $< $(RPI_USER)\@$(RPI_HOST):/home/$(RPI_USER)/$<
$(TARGET):${OBJS}
	${CC} -o $@ ${OBJS}

clean:
	${RM} -rf ${TARGET} *.o
.c.o:
	${CC} -c $< ${CFLAG}
