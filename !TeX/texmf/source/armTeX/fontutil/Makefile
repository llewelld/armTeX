# This file makes the font utility programs.

# Routines used everywhere.
commondefines=^.lib.common_def ^.lib.texmf_def
commonh=^.lib.h.common ^.lib.h.texmfmem
commono=^.lib.library

PREFIX = texsrc:bin.

CC = cc
CFLAGS = -throwback -W -f
CPPFLAGS = -I^.lib

CCLD = drlink
LDFLAGS = 
extralibs = OSLib:o.OSLib
libs = $(commono) C:o.Stubs $(extralibs)

default: all

all: triptrap $(PREFIX)gftodvi $(PREFIX)gftopk $(PREFIX)mft\
 $(PREFIX)pktogf $(PREFIX)pktype $(PREFIX)vftovp $(PREFIX)vptovf
     @

install: all
	@

triptrap: $(PREFIX)gftype $(PREFIX)pltotf $(PREFIX)tftopl
	@

$(PREFIX)gftodvi: o.gftodvi $(commono)
	$(CCLD) -o $(PREFIX)gftodvi $(LDFLAGS) o.gftodvi $(libs)
	squeeze $(PREFIX)gftodvi
o.gftodvi: c.gftodvi $(commonh) h.gftodmem
	$(CC) $(CFLAGS) $(CPPFLAGS) -c gftodvi
c.gftodvi: gftodvi/p $(commondefines)
	^.lib.convert gftodvi c.gftodvi
gftodvi/p: gftodvi/web gftodvi/ch
	tangle gftodvi.web gftodvi.ch

$(PREFIX)gftopk: o.gftopk $(commono)
	$(CCLD) -o $(PREFIX)gftopk $(LDFLAGS) o.gftopk $(libs)
	squeeze $(PREFIX)gftopk
o.gftopk: c.gftopk $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c gftopk
c.gftopk: gftopk/p $(commondefines)
	^.lib.convert gftopk c.gftopk
gftopk/p: gftopk/web gftopk/ch
	tangle gftopk.web gftopk.ch


$(PREFIX)gftype: o.gftype $(commono)
	$(CCLD) -o $(PREFIX)gftype $(LDFLAGS) o.gftype $(libs) 
	squeeze $(PREFIX)gftype
o.gftype: c.gftype $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c gftype
c.gftype: gftype/p $(commondefines)
	^.lib.convert gftype c.gftype
gftype/p: gftype/web gftype/ch
	tangle gftype.web gftype.ch


$(PREFIX)mft: o.mft $(commono)
	$(CCLD) -o $(PREFIX)mft $(LDFLAGS) o.mft $(libs)
	squeeze $(PREFIX)mft
o.mft: c.mft $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c mft
c.mft: mft/p $(commondefines)
	^.lib.convert mft c.mft
mft/p: mft/web mft/ch-final
	tangle mft.web mft.ch-final
mft/ch-final: mft/web mft/ch mft/ch-riscos
	tie -c mft.ch-final mft.web mft.ch mft.ch-riscos

$(PREFIX)pktogf: o.pktogf $(commono)
	$(CCLD) -o $(PREFIX)pktogf $(LDFLAGS) o.pktogf $(libs)
	squeeze $(PREFIX)pktogf
o.pktogf: c.pktogf $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c pktogf
c.pktogf: pktogf/p $(commondefines)
	^.lib.convert pktogf c.pktogf
pktogf/p: pktogf/web pktogf/ch
	tangle pktogf.web pktogf.ch


$(PREFIX)pktype: o.pktype $(commono)
	$(CCLD) -o $(PREFIX)pktype $(LDFLAGS) o.pktype $(libs)
	squeeze $(PREFIX)pktype
o.pktype: c.pktype $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c pktype
c.pktype: pktype/p $(commondefines)
	^.lib.convert pktype c.pktype
pktype/p: pktype/web pktype/ch
	tangle pktype.web pktype.ch


$(PREFIX)pltotf: o.pltotf $(commono)
	$(CCLD) -o $(PREFIX)pltotf $(LDFLAGS) o.pltotf $(libs)
	squeeze $(PREFIX)pltotf
o.pltotf: c.pltotf $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c pltotf
c.pltotf: pltotf/p $(commondefines)
	^.lib.convert pltotf c.pltotf
pltotf/p: pltotf/web pltotf/ch
	tangle pltotf.web pltotf.ch


$(PREFIX)tftopl: o.tftopl $(commono)
	$(CCLD) -o $(PREFIX)tftopl $(LDFLAGS) o.tftopl $(libs)
	squeeze $(PREFIX)tftopl
o.tftopl: c.tftopl $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tftopl
c.tftopl: tftopl/p $(commondefines)
	^.lib.convert tftopl c.tftopl
tftopl/p: tftopl/web tftopl/ch
	tangle tftopl.web tftopl.ch


$(PREFIX)vftovp: o.vftovp $(commono)
	$(CCLD) -o $(PREFIX)vftovp $(LDFLAGS) o.vftovp $(libs)
	squeeze $(PREFIX)vftovp
o.vftovp: c.vftovp $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c vftovp
c.vftovp: vftovp/p $(commondefines)
	^.lib.convert vftovp c.vftovp
vftovp/p: vftovp/web vftovp/ch
	tangle vftovp.web vftovp.ch


$(PREFIX)vptovf: o.vptovf $(commono)
	$(CCLD) -o $(PREFIX)vptovf $(LDFLAGS) o.vptovf $(libs)
	squeeze $(PREFIX)vptovf
o.vptovf: c.vptovf $(commonh)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c vptovf
c.vptovf: vptovf/p $(commondefines)
	^.lib.convert vptovf c.vptovf
vptovf/p: vptovf/web vptovf/ch
	tangle vptovf.web vptovf.ch

clean:
	remove gftodvi.p
	remove gftopk.p
	remove gftype.p
	remove mft.p
	remove pktogf.p
	remove pktype.p
	remove pltotf.p
	remove tftopl.p
	remove vftovp.p
	remove vptovf.p
	remove o.gftodvi
	remove o.gftopk
	remove o.gftype
	remove o.mft
	remove o.pktogf
	remove o.pktype
	remove o.pltotf
	remove o.tftopl
	remove o.vftovp
	remove o.vptovf
	remove c.gftodvi
	remove c.gftopk
	remove c.gftype
	remove c.mft
	remove c.pktogf
	remove c.pktype
	remove c.pltotf
	remove c.tftopl
	remove c.vftovp
	remove c.vptovf
	remove h.gftodvi
	remove h.gftopk
	remove h.gftype
	remove h.mft
	remove h.pktogf
	remove h.pktype
	remove h.pltotf
	remove h.tftopl
	remove h.vftovp
	remove h.vptovf

veryclean:
	remove $(PREFIX)gftodvi
	remove $(PREFIX)gftopk
	remove $(PREFIX)gftype
	remove $(PREFIX)mft
	remove $(PREFIX)pktogf
	remove $(PREFIX)pktype
	remove $(PREFIX)pltotf
	remove $(PREFIX)tftopl
	remove $(PREFIX)vftovp
	remove $(PREFIX)vptovf

