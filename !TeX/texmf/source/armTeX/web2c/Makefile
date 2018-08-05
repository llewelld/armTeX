# Makefile for web2c
BINPATH = texsrc:bin.
CC=gcc
# making alloca here is a terrible hack
DEFS=-DINTEGERTYPE=int -DSTACK_DIRECTION=-1 -Dalloca=alloca
CFLAGS=-Ilib: -mthrowback -W $(DEFS)
LEX=flex -B
YACC=bison -y
LINK=gcc

LIBS = lib:library OSLib:o.OSLib
default: all


o.Y_tab: c.Y_tab
	$(CC) -c $(CFLAGS) Y_tab.c

c.Y_tab h.Y_tab: y.web2c
	$(YACC) -d y.web2c

o.lexyy: c.lexyy
	$(CC) -c $(CFLAGS) lexyy.c

c.lexyy: l.web2c
	$(LEX) l.web2c

o.web2c: c.web2c h.Y_tab
	$(CC) -c $(CFLAGS) web2c.c

o.fixwrites: c.fixwrites
	$(CC) -c $(CFLAGS) fixwrites.c

o.regfix: c.regfix
	$(CC) -c $(CFLAGS) regfix.c

o.splitup: c.splitup
	$(CC) -c $(CFLAGS) splitup.c

web2c: o.Y_tab o.lexyy o.web2c
	$(LINK) -o web2c o.Y_tab o.lexyy o.web2c $(LIBS)

fixwrites: o.fixwrites
	$(LINK) -o fixwrites o.fixwrites $(LIBS)

regfix: o.regfix
	$(LINK) -o regfix o.regfix $(LIBS)

splitup: o.splitup
	$(LINK) -o splitup o.splitup $(LIBS)

all: web2c splitup regfix fixwrites# peephole
	@

install: all
	squeeze web2c $(BINPATH)web2c
	squeeze splitup $(BINPATH)splitup
	squeeze regfix $(BINPATH)regfix
	squeeze fixwrites $(BINPATH)fixwrites

clean:
	-wipe o.* ~c~v

veryclean: clean
	remove fixwrites
	remove regfix
	remove splitup
	remove web2c

# If you don't have Bison and Flex don't call this
totalclean: veryclean
	remove c.lexyy
	remove c.Y_tab
	remove h.Y_tab

