# This file makes WEB-related programs: tangle, weave, and pooltype.
# tangle is made using the supplied version. When upgrading, this will
# be sufficient to build the new tangle.

# Path to install binaries
PREFIX = TeXsrc:bin.

# Routines used everywhere.
commondefines=^.lib.common_def ^.lib.texmf_def
commonh=^.lib.h.common ^.lib.h.texmfmem
commono=^.lib.library

CC = gcc
CFLAGS = -mthrowback -W
CPPFLAGS = -Ilib:

CCLD = drlink
LDFLAGS =
extralibs = OSLib:o.OSLib
libs = $(commono) $(extralibs) C:o.Stubs

all: triptrap bin/weave bin/pooltype
	@

install: bin/tangle bin/weave bin/pooltype
	copy bin.tangle $(PREFIX)tangle ~v~cf
	copy bin.weave $(PREFIX)weave ~v~cf
	copy bin.pooltype $(PREFIX)pooltype ~v~cf

triptrap: bin.tangle
	@

bin/tangle: o.tangle $(commono)
	$(CCLD) -o bin.tangle $(LDFLAGS) o.tangle $(libs)
	squeeze bin.tangle
o.tangle: c.tangle $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tangle
c.tangle: tangle/p $(commondefines)
	^.lib.convert tangle c.tangle
tangle/p: tangle/web tangle/ch-final
	ADFS::Ambrose.$.Data.ARMTeX.Build.!TeX.texmf.source.armTeX.web.bin.tangle tangle.web tangle.ch-final
tangle/ch-final: tangle/ch tangle/ch-riscos
	tie -c tangle.ch-final tangle.web tangle.ch tangle.ch-riscos   

bin/weave: o.weave $(commono)
	$(CCLD) -o bin.weave $(LDFLAGS) o.weave $(libs)
	squeeze bin.weave
o.weave: c.weave $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c weave
c.weave: weave/p $(commondefines)
	^.lib.convert weave c.weave
weave/p: weave/web weave/ch
	tangle weave.web weave.ch


bin/pooltype: o.pooltype $(commono)
	$(CCLD) -o bin.pooltype $(LDFLAGS) o.pooltype $(libs) 
	squeeze bin.pooltype
o.pooltype: c.pooltype $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c pooltype
c.pooltype: pooltype/p $(commondefines)
	^.lib.convert pooltype c.pooltype
pooltype/p: pooltype.web pooltype.ch
	tangle pooltype.web pooltype.ch


clean:
	remove tangle.p
	remove weave.p
	remove pooltype.p
	remove o.tangle
	remove o.weave
	remove o.pooltype
	remove c.weave
	remove c.pooltype
	remove h.weave
	remove h.pooltype

veryclean: clean
	remove bin.weave # NEVER remove tangle!
	remove bin.pooltype

