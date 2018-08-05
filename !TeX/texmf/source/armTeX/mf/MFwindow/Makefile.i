# This file makes an archive library consisting of the window support
# for all the devices.  To make Metafont support another device, just
# add a file here, and the obvious declarations in ../../common/texmf.c
# (the device support is the last section in that file).
# 
# By making the result into an archive file, the final binary has only
# the devices which are actually desired, thus saving some small amount
# of time and space.

SHELL = /bin/sh

srcdir = @srcdir@
VPATH = @srcdir@

CC = @CC@
CFLAGS = -g
# We need `-I.' for mfd.h (when compiling the files from ../lib).
CPPFLAGS = -I../../$(srcdir)/lib -I. $(xincludedir)

LN = @LN_S@
RANLIB = @RANLIB@

# X-specific compiler/linker arguments.
xincludedir = @xincludedir@

lib=window.a
objs=hp2627.o sun.o tek.o uniterm.o x10.o x11.o


.SUFFIXES:
.SUFFIXES: .o .c
.c.o:
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $*.c


default:	all

all:	$(lib)

$(lib):	$(objs)
	rm -f $(lib)
	ar qc $(lib) $(objs)
	$(RANLIB) $(lib)

$(objs): ../mfd.h


Makefile: Makefile.in ../../config.status
	(cd ../..; sh config.status)

# Prevent GNU make 3 from overflowing arg limit on system V.
.NOEXPORT:


c-sources: sun.c x11.c
.PHONY: c-sources

sun.c:
	$(LN) ../../$(srcdir)/mf/MFwindow/sun-xview.c sun.c

x11.c:
	$(LN) ../../$(srcdir)/mf/MFwindow/x11-Xt.c x11.c

install:

mostlyclean:
	rm -f *.o $(lib)

clean: mostlyclean
	rm -f \#*\# *~ *.bak *.ckp core

distclean realclean: clean
	rm -f sun.c x11.c Makefile
