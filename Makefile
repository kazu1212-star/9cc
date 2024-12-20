CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)


9cc: $(OBJS)
	$(CC) -o 9cc $(OBJS) $(LDFLAGS)

$(OBJS): 9cc.h

test: 9cc
	docker run  -it -v ${CURDIR}:/9cc -w /9cc compilerbook ./test.sh

clean:
	rm -f 9cc *.o *~ tmp*

.PHONY: test clean