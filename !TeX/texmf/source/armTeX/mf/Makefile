# This file makes MF in its various incarnations.

# It is a cut-down version of Makefile.in from the web2c distribution.
# AMU seems to convert MF.p, MF.pas etc. into p.MF, pas.MF etc., so
# some dependencies didn't work. Also, RISC OS doesn't have `sed', so
# I've changed that small MF change file by hand.

# So to make a MF from scratch you type:
#   1) amu veryclean
#   2) amu mf.p
#   3) amu biginimf bigvirmf OR amu inimf virmf
# N.B. When making a small MF, add -DSMALLMF to the CFLAGS
# Then copy (big){inimf,virmf} to your executables directory, and
# tex.pool to the pool directory. Note that mf.pool is the same for
# the 32-bit and 16-bit versions.

# Mark. (marks@stack.urc.tue.nl)

BINPATH = TeXsrc:Bin.

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

objs=$(fileioo) o.mf0 o.mf1 o.mf2
iobjs=o.iextra o.inimf
vobjs=o.vextra o.imf

CC = gcc
CFLAGS = -throwback -depend !Depend -W -f
CPPFLAGS = -Ilib: 

LINK = Drlink
LDFLAGS = -lib OSLib:o.OSLib -rescan
libs = $(commono) C:o.stubs

default: all
	@

all: biginimf bigvirmf
	@

install: all
	squeeze biginimf $(BINPATH)biginimf
	squeeze bigvirmf $(BINPATH)bigvirmf 

biginimf: $(iobjs) $(objs) $(commono)
	$(LINK) -o biginimf $(LDFLAGS) $(iobjs) $(objs) $(libs)

bigvirmf: $(vobjs) $(objs) $(commono)
	$(LINK) -o bigvirmf $(LDFLAGS) $(vobjs) $(objs) $(libs)

mf/p: mf/web mf/ch
	remove mf/pool
	tangle @.mf.web @.mf.ch
	-rename mf.pool mf/pool

# The convert script produces the following:
# c.mf0 c.mf1 c.mf2
# c.imf h.coerce h.mfd, but AMU seems to want only one filename at
# the start of the line. As all files are replaced by splitup, this isn't
# much of a problem
c.mf0 c.mf1 c.mf2 c.imf h.coerce h.mfd: h.fixcoerce $(commondefines) mf/p
	If "$@" = "h.mfd" Then Obey convert ^.lib

# The (hand-coded) file $(extrac) and the (generated) file imf.c have
# #ifdefs for INIMF, so we compile them differently.
o.iextra: c.iextra
	$(CC) $(CPPFLAGS) -DINIMF -DINI $(CFLAGS) -c c.iextra

o.inimf: c.inimf
	$(CC) $(CPPFLAGS) -DINIMF $(CFLAGS) -c c.inimf

# Avoid compiling files in another directory.
c.iextra: $(extrac)
	copy $(extrac) c.iextra ~c~vf

c.inimf: c.imf
	copy c.imf c.inimf ~c~v

o.imf: c.imf $(commonh) h.mfd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c imf

c.vextra: $(extrac)
	copy $(extrac) c.vextra ~c~vf

o.vextra: c.vextra $(commonh) h.mfd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c vextra

c.openinout: $(fileioc)
	copy $(fileioc) c.openinout ~c~vf

o.openinout: c.openinout
	$(CC) $(CFLAGS) $(CPPFLAGS) -c openinout

o.mf0: c.mf0 $(commonh) h.mfd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c mf0
o.mf1: c.mf1 $(commonh) h.mfd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c mf1
o.mf2: c.mf2 $(commonh) h.mfd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c mf2

veryclean: clean
	remove biginimf
	remove bigvirmf
	remove mf/pool

clean:
	-wipe c.* ~c~v
	-wipe o.* ~c~v
	remove h.coerce
	remove mf.p

# Dynamic dependencies:
o.iextra:	c.iextra
o.iextra:	h.mfd
o.iextra:	^.lib.h.texmf
o.iextra:	^.lib.h.config
o.iextra:	^.lib.h.c-auto
o.iextra:	^.lib.h.c-std
o.iextra:	^.lib.h.c-unistd
o.iextra:	^.lib.h.c-std
o.iextra:	^.lib.h.c-memstr
o.iextra:	^.lib.h.c-std
o.iextra:	^.lib.h.c-errno
o.iextra:	^.lib.h.c-minmax
o.iextra:	^.lib.h.c-limits
o.iextra:	^.lib.h.c-std
o.iextra:	^.lib.h.c-pathmx
o.iextra:	^.lib.h.c-limits
o.iextra:	^.lib.h.c-fopen
o.iextra:	^.lib.h.c-proto
o.iextra:	^.lib.h.common
o.iextra:	^.lib.h.getopt
o.iextra:	^.lib.h.lib
o.iextra:	^.lib.h.types
o.iextra:	^.lib.h.ourpaths
o.iextra:	^.lib.h.pascal
o.iextra:	^.lib.h.types
o.iextra:	^.lib.h.riscos_ex
o.iextra:	^.lib.h.texmfmem
o.iextra:	h.coerce
o.iextra:	^.lib.h.c-ctype
o.iextra:	^.lib.h.c-pathch
o.vextra:	c.vextra
o.vextra:	h.mfd
o.vextra:	^.lib.h.texmf
o.vextra:	^.lib.h.config
o.vextra:	^.lib.h.c-auto
o.vextra:	^.lib.h.c-std
o.vextra:	^.lib.h.c-unistd
o.vextra:	^.lib.h.c-std
o.vextra:	^.lib.h.c-memstr
o.vextra:	^.lib.h.c-std
o.vextra:	^.lib.h.c-errno
o.vextra:	^.lib.h.c-minmax
o.vextra:	^.lib.h.c-limits
o.vextra:	^.lib.h.c-std
o.vextra:	^.lib.h.c-pathmx
o.vextra:	^.lib.h.c-limits
o.vextra:	^.lib.h.c-fopen
o.vextra:	^.lib.h.c-proto
o.vextra:	^.lib.h.common
o.vextra:	^.lib.h.getopt
o.vextra:	^.lib.h.lib
o.vextra:	^.lib.h.types
o.vextra:	^.lib.h.ourpaths
o.vextra:	^.lib.h.pascal
o.vextra:	^.lib.h.types
o.vextra:	^.lib.h.riscos_ex
o.vextra:	^.lib.h.texmfmem
o.vextra:	h.coerce
o.vextra:	^.lib.h.c-ctype
o.vextra:	^.lib.h.c-pathch
o.imf:	c.imf
o.imf:	h.mfd
o.imf:	^.lib.h.texmf
o.imf:	^.lib.h.config
o.imf:	^.lib.h.c-auto
o.imf:	^.lib.h.c-std
o.imf:	^.lib.h.c-unistd
o.imf:	^.lib.h.c-std
o.imf:	^.lib.h.c-memstr
o.imf:	^.lib.h.c-std
o.imf:	^.lib.h.c-errno
o.imf:	^.lib.h.c-minmax
o.imf:	^.lib.h.c-limits
o.imf:	^.lib.h.c-std
o.imf:	^.lib.h.c-pathmx
o.imf:	^.lib.h.c-limits
o.imf:	^.lib.h.c-fopen
o.imf:	^.lib.h.c-proto
o.imf:	^.lib.h.common
o.imf:	^.lib.h.getopt
o.imf:	^.lib.h.lib
o.imf:	^.lib.h.types
o.imf:	^.lib.h.ourpaths
o.imf:	^.lib.h.pascal
o.imf:	^.lib.h.types
o.imf:	^.lib.h.riscos_ex
o.imf:	^.lib.h.texmfmem
o.imf:	h.coerce
o.openinout:	c.openinout
o.openinout:	^.lib.h.config
o.openinout:	^.lib.h.c-auto
o.openinout:	^.lib.h.c-std
o.openinout:	^.lib.h.c-unistd
o.openinout:	^.lib.h.c-std
o.openinout:	^.lib.h.c-memstr
o.openinout:	^.lib.h.c-std
o.openinout:	^.lib.h.c-errno
o.openinout:	^.lib.h.c-minmax
o.openinout:	^.lib.h.c-limits
o.openinout:	^.lib.h.c-std
o.openinout:	^.lib.h.c-pathmx
o.openinout:	^.lib.h.c-limits
o.openinout:	^.lib.h.c-fopen
o.openinout:	^.lib.h.c-proto
o.openinout:	^.lib.h.common
o.openinout:	^.lib.h.getopt
o.openinout:	^.lib.h.lib
o.openinout:	^.lib.h.types
o.openinout:	^.lib.h.ourpaths
o.openinout:	^.lib.h.pascal
o.openinout:	^.lib.h.types
o.openinout:	^.lib.h.riscos_ex
o.openinout:	^.lib.h.c-namemx
o.openinout:	^.lib.h.c-limits
o.openinout:	^.lib.h.c-pathch
o.openinout:	^.lib.h.riscos_ex
o.openinout:	h.mfd
o.openinout:	^.lib.h.texmf
o.openinout:	^.lib.h.config
o.openinout:	^.lib.h.texmfmem
o.openinout:	h.coerce
o.mf0:	c.mf0
o.mf0:	h.mfd
o.mf0:	^.lib.h.texmf
o.mf0:	^.lib.h.config
o.mf0:	^.lib.h.c-auto
o.mf0:	^.lib.h.c-std
o.mf0:	^.lib.h.c-unistd
o.mf0:	^.lib.h.c-std
o.mf0:	^.lib.h.c-memstr
o.mf0:	^.lib.h.c-std
o.mf0:	^.lib.h.c-errno
o.mf0:	^.lib.h.c-minmax
o.mf0:	^.lib.h.c-limits
o.mf0:	^.lib.h.c-std
o.mf0:	^.lib.h.c-pathmx
o.mf0:	^.lib.h.c-limits
o.mf0:	^.lib.h.c-fopen
o.mf0:	^.lib.h.c-proto
o.mf0:	^.lib.h.common
o.mf0:	^.lib.h.getopt
o.mf0:	^.lib.h.lib
o.mf0:	^.lib.h.types
o.mf0:	^.lib.h.ourpaths
o.mf0:	^.lib.h.pascal
o.mf0:	^.lib.h.types
o.mf0:	^.lib.h.riscos_ex
o.mf0:	^.lib.h.texmfmem
o.mf0:	h.coerce
o.mf1:	c.mf1
o.mf1:	h.mfd
o.mf1:	^.lib.h.texmf
o.mf1:	^.lib.h.config
o.mf1:	^.lib.h.c-auto
o.mf1:	^.lib.h.c-std
o.mf1:	^.lib.h.c-unistd
o.mf1:	^.lib.h.c-std
o.mf1:	^.lib.h.c-memstr
o.mf1:	^.lib.h.c-std
o.mf1:	^.lib.h.c-errno
o.mf1:	^.lib.h.c-minmax
o.mf1:	^.lib.h.c-limits
o.mf1:	^.lib.h.c-std
o.mf1:	^.lib.h.c-pathmx
o.mf1:	^.lib.h.c-limits
o.mf1:	^.lib.h.c-fopen
o.mf1:	^.lib.h.c-proto
o.mf1:	^.lib.h.common
o.mf1:	^.lib.h.getopt
o.mf1:	^.lib.h.lib
o.mf1:	^.lib.h.types
o.mf1:	^.lib.h.ourpaths
o.mf1:	^.lib.h.pascal
o.mf1:	^.lib.h.types
o.mf1:	^.lib.h.riscos_ex
o.mf1:	^.lib.h.texmfmem
o.mf1:	h.coerce
o.mf2:	c.mf2
o.mf2:	h.mfd
o.mf2:	^.lib.h.texmf
o.mf2:	^.lib.h.config
o.mf2:	^.lib.h.c-auto
o.mf2:	^.lib.h.c-std
o.mf2:	^.lib.h.c-unistd
o.mf2:	^.lib.h.c-std
o.mf2:	^.lib.h.c-memstr
o.mf2:	^.lib.h.c-std
o.mf2:	^.lib.h.c-errno
o.mf2:	^.lib.h.c-minmax
o.mf2:	^.lib.h.c-limits
o.mf2:	^.lib.h.c-std
o.mf2:	^.lib.h.c-pathmx
o.mf2:	^.lib.h.c-limits
o.mf2:	^.lib.h.c-fopen
o.mf2:	^.lib.h.c-proto
o.mf2:	^.lib.h.common
o.mf2:	^.lib.h.getopt
o.mf2:	^.lib.h.lib
o.mf2:	^.lib.h.types
o.mf2:	^.lib.h.ourpaths
o.mf2:	^.lib.h.pascal
o.mf2:	^.lib.h.types
o.mf2:	^.lib.h.riscos_ex
o.mf2:	^.lib.h.texmfmem
o.mf2:	h.coerce
o.inimf:	c.inimf
o.inimf:	h.mfd
o.inimf:	^.lib.h.texmf
o.inimf:	^.lib.h.config
o.inimf:	^.lib.h.c-auto
o.inimf:	^.lib.h.c-std
o.inimf:	^.lib.h.c-unistd
o.inimf:	^.lib.h.c-std
o.inimf:	^.lib.h.c-memstr
o.inimf:	^.lib.h.c-std
o.inimf:	^.lib.h.c-errno
o.inimf:	^.lib.h.c-minmax
o.inimf:	^.lib.h.c-limits
o.inimf:	^.lib.h.c-std
o.inimf:	^.lib.h.c-pathmx
o.inimf:	^.lib.h.c-limits
o.inimf:	^.lib.h.c-fopen
o.inimf:	^.lib.h.c-proto
o.inimf:	^.lib.h.common
o.inimf:	^.lib.h.getopt
o.inimf:	^.lib.h.lib
o.inimf:	^.lib.h.types
o.inimf:	^.lib.h.ourpaths
o.inimf:	^.lib.h.pascal
o.inimf:	^.lib.h.types
o.inimf:	^.lib.h.riscos_ex
o.inimf:	^.lib.h.texmfmem
o.inimf:	h.coerce
