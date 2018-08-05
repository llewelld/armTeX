# This file makes the DVI utility programs.

# Routines used everywhere.
commondefines=^.lib.common_def ^.lib.texmf_def
commonh=^.lib.h.common ^.lib.h.texmfmem
commono=^.lib.library

PREFIX = texsrc:bin.

CC = gcc
CFLAGS = -mthrowback
CPPFLAGS = -Ilib:

CCLD = drlink
LDFLAGS =
extralibs = OSLib:o.OSLib
libs = $(commono) C:o.Stubs $(extralibs)

default: all
	@

all: bin.dvitype bin.dvicopy
	@

install: all
	squeeze bin.dvitype $(PREFIX)dvitype
	squeeze bin.dvicopy $(PREFIX)dvicopy

triptrap: bin.dvitype

bin.dvitype: o.dvitype $(commono)
	$(CCLD) -o bin.dvitype $(LDFLAGS) o.dvitype $(libs)
o.dvitype: c.dvitype $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c c.dvitype
c.dvitype: dvitype/p $(commondefines)
	^.lib.convert dvitype c.dvitype
dvitype/p: dvitype/web dvitype/ch
	tangle @.dvitype.web @.dvitype.ch

bin.dvicopy: o.dvicopy $(commono)
	$(CCLD) -o bin.dvicopy $(LDFLAGS) o.dvicopy $(libs)
o.dvicopy: c.dvicopy $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c c.dvicopy
c.dvicopy: dvicopy/p $(commondefines)
	^.lib.convert dvicopy c.dvicopy
dvicopy/p: dvicopy/web dvicopy/ch
	tangle @.dvicopy.web @.dvicopy.ch

clean:
	remove dvitype.p
	remove dvicopy.p
	remove o.dvitype
	remove o.dvicopy
	remove c.dvitype
	remove c.dvicopy
	remove h.dvitype
	remove h.dvicopy

veryclean:
	remove bin.dvitype
	remove bin.dvicopy
