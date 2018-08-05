# Makefile for all the little utilities here

CC	= gcc
CFLAGS	= -mthrowback
CPPFLAGS= -IC:

LINK	= gcc -o $@

FIXLIBS	= OSLib:o.OSLib

.SUFFIXES: .o .c

.c.o:;	$(CC) -IOSLib: -c $(CFLAGS) -o $@ $<

# Pseudo-targets:
install: fcat whichslot newtypes
	squeeze fcat texsrc:bin.fcat
	squeeze whichslot texsrc:bin.whichslot
	squeeze newtypes texsrc:bin.newtypes

# Targets:
fcat: fcat.o
	$(LINK) fcat.o $(FIXLIBS)

whichslot: whichslot.o
	$(LINK) whichslot.o $(FIXLIBS)

newtypes: newtypes.o
	$(LINK) newtypes.o $(FIXLIBS)

# Dynamic dependencies:
o.newtypes:	c.newtypes
