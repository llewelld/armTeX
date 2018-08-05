# This file makes TeX in its various incarnations.

# It is a cut-down version of Makefile.in from the web2c distribution.
# AMU seems to convert tex.p, tex.pas etc. into p.tex, pas.tex etc., so
# some dependencies didn't work.

# As the trip test had to be run only once, it wasn't interesting to
# convert all of the stuff catering for it. I  simply followed the
# steps from App. A of the `A torture test for \TeX' document and
# used the values from trip_sed. The two sed files are retained in
# this directory to allow for easy changes.

# So to make a TeX from scratch you type:
#   1)  amu veryclean
#   2) amu tex.p
#       amu biginitex bigvirtex OR
# Then copy (big){initex,virtex} to your executables directory, and
# tex.pool to the pool directory. Note that tex.pool is the same for
# the 32-bit and 16-bit versions.

# Mark. (marks@stack.urc.tue.nl)
# Small TeX moved into separate makefile
# Jakob Stoklund Olesen <stoklund@mi.aau.dk> 12. Mar 1998

BINPATH = TeXsrc:bin.

# Routines used everywhere.
commondefines=^.lib.common_def ^.lib.texmf_def
commonh=^.lib.h.common ^.lib.h.texmfmem
commono=^.lib.library

# Routines used in TeX and Metafont.
extrac=^.lib.c.texmf
extrah=^.lib.h.texmf

# Routines used in TeX, Metafont, and BibTeX.
fileioc=^.lib.c.openinout
fileioo=o.openinout

# If you have applied patches to make Michael Ferguson's multi-lingual
# TeX, or perhaps other patches as well, uncomment the next line.
objs=$(fileioo) o.tex0 o.tex1
iobjs=o.iextra o.initex
vobjs=o.vextra o.itex

CC = gcc
CFLAGS = -mthrowback -W
CPPFLAGS = -DTeX -Ilib:

LINK = Drlink
LDFLAGS = -lib OSLIB:o.OSLib -rescan

libs = $(commono) C:o.Stubs $(extralibs)

default: all
	|
all: biginitex bigvirtex patgen
	|
install: all
	squeeze biginitex $(BINPATH)biginitex
	squeeze bigvirtex $(BINPATH)bigvirtex
	squeeze patgen $(BINPATH)patgen

biginitex: $(iobjs) $(objs) $(commono)
	$(LINK) -o biginitex $(LDFLAGS) $(iobjs) $(objs) $(libs)

bigvirtex: $(vobjs) $(objs) $(commono)
	$(LINK) -o bigvirtex $(LDFLAGS) $(vobjs) $(objs) $(libs)

tex/p: tex/web tex/ch
	tangle @.tex.web @.tex.ch
	remove tex/pool
	rename tex.pool tex/pool

# The convert script produces the following:
# c.tex0 c.tex1
# c.itex h.coerce h.texd, but AMU seems to want only one filename at
# the start of the line. As all files are replaced by splitup, this isn't
# much of a problem
c.tex0 c.tex1 c.itex h.coerce h.texd: h.fixcoerce $(commondefines) tex/p
	If "$@" = "h.texd" Then convert ^.lib

# The (hand-coded) file $(extrac) and the (generated) file itex.c have
# #ifdefs for INITEX, so we compile them differently.
o.iextra: c.iextra
	$(CC) $(CPPFLAGS) -DINITEX -DINI $(CFLAGS) -c c.iextra

o.initex: c.initex
	$(CC) $(CPPFLAGS) -DINITEX $(CFLAGS) -c c.initex

# Avoid compiling files in another directory.
c.iextra: $(extrac)
	remove c.iextra
	copy $(extrac) c.iextra ~C~V

c.initex: c.itex
	remove c.initex
	copy c.itex c.initex ~C~V

o.itex: c.itex $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c itex.c

c.vextra: $(extrac)
	remove c.vextra
	copy $(extrac) c.vextra ~C~V

o.vextra: c.vextra $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c vextra

c.openinout: $(fileioc)
	remove c.openinout
	copy $(fileioc) c.openinout ~C~V

o.openinout: c.openinout
	$(CC) $(CFLAGS) $(CPPFLAGS) -c openinout

o.tex0: c.tex0 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex0
o.tex1: c.tex1 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex1

patgen: o.patgen2 $(commono)
	$(LINK) -o patgen $(LDFLAGS) o.patgen2 $(libs)
o.patgen2: c.patgen2 $(commonh)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) patgen2
c.patgen2: patgen2/p $(commondefines)
	^.lib.convert patgen2 c.patgen2 
patgen2/p: patgen2/web patgen2/ch
	tangle @.patgen2.web @.patgen2.ch

veryclean: clean
	remove patgen
	remove biginitex
	remove bigvirtex
	remove tex/pool

clean:
	-wipe o.* ~c~v
	-wipe c.* ~c~v
	remove h.patgen2
	remove h.coerce
	remove tex.p
	remove patgen2.p
	remove h.texd
       