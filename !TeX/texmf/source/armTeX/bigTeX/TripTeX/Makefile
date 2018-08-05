# This file makes TeX in its trip variant

# Routines used everywhere.
commondefines=^.^.lib.common_def ^.^.lib.texmf_def
commonh=^.^.lib.h.common ^.^.lib.h.texmfmem
commono=^.^.lib.o.library

# Routines used in TeX and Metafont.
extrac=^.^.lib.c.texmf
extrah=^.^.lib.h.texmf

# Routines used in TeX, Metafont, and BibTeX.
fileioc=^.^.lib.c.openinout
fileioo=o.openinout

objs=$(fileioo) o.tex0 o.tex1 o.tex2 o.tex3 o.tex4 o.tex5 o.tex6 o.tex7 \
     o.tex8 o.tex9
iobjs=o.iextra o.initex
vobjs=o.vextra o.itex

CC = cc
CFLAGS = -throwback -W -f -DSMALLTeX
CPPFLAGS = -DTeX -I^.^.lib

CCLD = link
LDFLAGS = 
libs = $(commono) C:o.Stubs $(extralibs)

default: all
	@

all: initex virtex
	@

sminstall: all
	copy virtex texbin:virtex f~c~v
	copy initex texbin:initex f~c~v

initex: $(iobjs) $(objs) $(commono)
	$(CCLD) -o initex $(LDFLAGS) $(iobjs) $(objs) $(libs)
	squeeze initex

virtex: $(vobjs) $(objs) $(commono)
	$(CCLD) -o virtex $(LDFLAGS) $(vobjs) $(objs) $(libs)
	squeeze virtex

tex/p: ^.tex/web ^.tex/ch sedscript
	sed -f sedscript ^.tex.ch >tex.ch
	copy ^.tex.web tex.web ~v~c
	tangle tex.web tex.ch
	remove tex/pool
	rename tex.pool tex/pool
	remove tex.web

# The convert script produces the following:
# c.tex0 c.tex1 c.tex2 c.tex3 c.tex4 c.tex5 c.tex6 c.tex7 c.tex8 c.tex9
# c.itex h.coerce h.texd, but AMU seems to want only one filename at
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
o.tex2: c.tex2 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex2
o.tex3: c.tex3 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex3
o.tex4: c.tex4 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex4
o.tex5: c.tex5 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex5
o.tex6: c.tex6 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex6
o.tex7: c.tex7 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex7
o.tex8: c.tex8 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex8
o.tex9: c.tex9 $(commonh) h.texd
	$(CC) $(CFLAGS) $(CPPFLAGS) -c tex9


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
