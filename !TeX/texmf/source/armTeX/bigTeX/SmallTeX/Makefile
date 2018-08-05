# This file makes TeX in its small variant

# It is a cut-down version of Makefile.in from the web2c distribution.
# AMU seems to convert tex.p, tex.pas etc. into p.tex, pas.tex etc., so
# some dependencies didn't work.

# As the trip test had to be run only once, it wasn't interesting to
# convert all of the stuff catering for it. I  simply followed the
# steps from App. A of the `A torture test for \TeX' document and
# used the values from trip_sed. The two sed files are retained in
# this directory to allow for easy changes.

# So to make a TeX from scratch you type:
#       amu veryclean
#       amu initex virtex
# Then copy {initex,virtex} to your executables directory, and
# tex.pool to the pool directory. Note that tex.pool is the same for
# the 32-bit and 16-bit versions.

# Mark. (marks@stack.urc.tue.nl)
#
# I have altered this file to make a Small TeX only in its own dir
# Jakob Stoklund Olesen <stoklund@mi.aau.dk>
#

# The UC: path points to Nick Burrets shared clib stubs
CC = cc
CFLAGS = -throwback -W -f
CPPFLAGS = -DSMALLTeX -DTeX -IC:,^.^.lib

LINK = drlink


# Routines used everywhere.
commondefines=^.^.lib.common_def ^.^.lib.texmf_def
commonh=^.^.lib.h.common ^.^.lib.h.texmfmem
commono=^.^.lib.library

# Routines used in TeX and Metafont.
extrac=^.^.lib.c.texmf
extrah=^.^.lib.h.texmf

# Routines used in TeX, Metafont, and BibTeX.
fileioc=^.^.lib.c.openinout
fileioo=o.openinout

objs=$(fileioo) o.tex0 o.tex1
iobjs=o.iextra o.initex
vobjs=o.vextra o.itex

LINKFLAGS = -lib OSLib:o.OSLib -rescan
libs = $(commono) $(extralibs) C:o.Stubs

default: all
	@

all: initex virtex
	@

install: all
	squeeze virtex texsrc:bin.virtex
	squeeze initex texsrc:bin.initex

initex: $(iobjs) $(objs) $(commono)
	$(LINK) -o initex $(LINKFLAGS) $(iobjs) $(objs) $(libs)

virtex: $(vobjs) $(objs) $(commono)
	$(LINK) -o virtex $(LINKFLAGS) $(vobjs) $(objs) $(libs)

tex/p: ^.tex/web ^.tex/ch sedscript
	sed -f sedscript ^.tex.ch >tex.ch
	copy ^.tex.web tex.web ~v~c
	tangle tex.web tex.ch
	remove tex/pool
	rename tex.pool tex/pool
	remove tex.web

# The convert script produces the following:
# c.tex0 c.tex1 c.itex h.coerce h.texd,
# but AMU seems to want only one filename at
# the start of the line. As all files are replaced by splitup, this isn't
# much of a problem
h.texd: h.fixcoerce $(commondefines) tex/p
	^.convert ^.^.lib

# The (hand-coded) file $(extrac) and the (generated) file itex.c have
# #ifdefs for INITEX, so we compile them differently.
o.iextra: c.iextra
	$(CC) $(CPPFLAGS) -DINITEX -DINI $(CFLAGS) -c c.iextra

o.initex: c.initex
	$(CC) $(CPPFLAGS) -DINITEX $(CFLAGS) -c c.initex

# Avoid compiling files in another directory.
c.iextra: $(extrac)
	copy $(extrac) c.iextra ~c~vf

c.initex: c.itex
	copy c.itex c.initex ~c~vf

o.itex: c.itex $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c itex

c.vextra: $(extrac)
	copy $(extrac) c.vextra ~c~vf

o.vextra: c.vextra $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c vextra

c.openinout: $(fileioc)
	copy $(fileioc) c.openinout ~c~vf

h.fixcoerce: ^.h.fixcoerce
	copy ^.h.fixcoerce h.fixcoerce ~c~vf

o.openinout: c.openinout
	$(CC) $(CFLAGS) $(CPPFLAGS) -c openinout

o.tex0: c.tex0 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex0
o.tex1: c.tex1 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex1

veryclean: clean
	remove initex
	remove virtex

clean:
	-wipe o.* ~c~v
	-wipe c.* ~c~v
	remove h.coerce
	remove h.texd
	remove tex.p
	remove tex/pool
	remove tex.ch

# Dynamic dependencies:
