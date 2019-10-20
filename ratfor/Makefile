PROG =	ratfor

SRCS =	getopt.c lookup.c rat4.c

OBJS =	getopt.o lookup.o rat4.o

LIBS =	

INSTALL = install -s
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man1

CC = gcc
CFLAGS = -O2 -DF77 -DS_CHAR="signed char"
LDFLAGS =

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

install: all
	$(INSTALL) -o root -g root -m 755 ratfor $(BINDIR)
	$(INSTALL) -o root -g root -m 644 ratfor.1 $(MANDIR)

clean:
	rm -f $(PROG) $(OBJS) *~ "#*#"

lookup.o: lookup.h
rat4.o: ratdef.h ratcom.h lookup.h
