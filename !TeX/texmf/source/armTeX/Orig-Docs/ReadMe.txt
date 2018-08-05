ArmTeX 3.141 - Release 2.04        02/03/95
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These directories contain a pre-installed and setup version
of ArmTex 3.141, with LaTeX 2.09, 2e and all the trimmings. It
is hoped that by supplying these files in this easy to install
form many first time users of TeX and LaTeX will succeed in
getting started.

Where did the files come from?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The files were pulled back from the University of Stuttgart ftp
server, and manually unpacked. I then discovered to my horror
that not only were there minimal setup instructions, the script
they suggested using was broken. They also required David
Pillings excellent 'SparkFS' software to be loaded whilst
running the software.

Fortunately Bryan Scattergood stepped in and spent a merry
evening manually rearranging the distribution into the workable
state you have now. He therefore deserves the bulk of the
credit for this release.

LaTeX2e (optional)
~~~~~~~~~~~~~~~~~~

A new version of LaTeX, LaTeX2e was recently released, and this
is (to my knowledge) the first release of it for the Arc. It
provides (apparently) lots of new features and has a backwards
compatibility mode. I had to recompile initex and virtex to
increase the pool size to make this work with LaTeX2e. I had some
trouble doing this, and I can give no guarantees that it won't
all fall over horribly when you try and do something I have
missed - it does however pass all the tests I have run on it.

While we can make no guarantees that the setup as given is the
best TeX setup possible on the Arc, it does seem to work fairly
reliably for us. Hopefully it will be of some use to others too.
If you do find any problems with it, then please get in touch
(especially if you know how to solve them >8*) ).

Some early releases of this distribution had problems with
LaTeX2e running out of space. I have now increased the memory
available, and juggled some of the variables, so hopefully
everything should now work. (Yeah right!)

DVIPS (optional)
~~~~~~~~~~~~~~~~

Included in this release is a new port of dvips 5.55, supplied
with source if required. This was ported by David Bryan, who's
full address can be found in the !dvips.!ReadMe file, and is
designed especially to work with ArmTeX.

As well as the dvips Archives, you also need to take the PSFonts
archive.

MakeIndex (optional)
~~~~~~~~~~~~~~~~~~~~
Again ported by David Bryan, this is the useful MakeIndex utility,
again with full source if required.

DaTeX (optional)
~~~~~~~~~~~~~~~~

This is a nice front end for TeX. For people that are scared
of the command line.

SemTeX (optional)
~~~~~~~~~~~~~~~~~

This is another (nicer?) front end for TeX. Try both and see
which one you like.

BibTeX (optional)
~~~~~~~~~~~~~~~~~

This is BibTeX ripped out of Graham Toals ArMaTuReS TeX
distribution. It seems to work OK though thanks to the help
of Alun Jones and Dick Alstein. Dick has also provided a nice
little WIMP front end for BibTeX that fills the deficiency
in DaTeX.

archepsf.sty
~~~~~~~~~~~~

This little piece of TeX hackery is used for including the output
from Acorns Printer drivers (and Artworks EPS?) in TeX documents.
Basically, it is the same as epsf.sty but with the minor mod
that it will accept stuff normally found in the Header anywhere
in the document. This makes up for the (atend) bits of postscript
that conventional epsf.sty doesn't like.

What are TeX and LaTeX?
~~~~~~~~~~~~~~~~~~~~~~~

TeX is a professional typesetting program used especially for
typesetting technical or mathematical material. Using plain
TeX is a bit like trying to mow Wembley Stadium with nail
clippers, so Leslie Lamport produced a set of macros for
TeX, called LaTeX, that drastically reduce the work required
to produce high quality documents.

TeX was designed by Knuth for him to write his (still
unfinished) epic "The Art of Computer Programming" with, and
has since been adopted by (amoung others) the American
Mathematical Society. Many technical publications now only
accept submissions in TeX or LaTeX format.

Many books on TeX and LaTeX are available - amoung the best
are "The TeX book" and "The LaTeX book" by Knuth and Lamport
respectively.

If you stil don't have a clue what I am going on about then
don't worry - TeX is probably not for you.

How do TeX/LaTeX compare with (say) Impression?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There is no comparison - that's not to say that one is better
than the other, just that they address totally different
needs.

Impression (and similar programs) are WYSIWYG (What you see
is what you get); you construct a page on the screen exactly
as you would see it on the printed page. Creating attractive
posters, pamphlets and even books is a relatively simpe task,
but technical reports with many inline equations, diagrams
and special characters can pose real problems.

TeX and LaTeX are different. You write a text file that
contains both your text and formatting instructions, along
with pointers to illustrations to include, and then submit
this to TeX, which 'compiles' you an output file (known as
a DVI file). Creating technical or mathematical reports is
trivial with TeX as it structures and consistently lays out
your document in a given style, but creating posters etc is
much harder work.

Another big point in TeXs favour is its standardness - TeX
implementations exist for a vast number of machines,
particularly Unix systems, and so your document source code
is trivially portable between many systems. Many people
doing 'science' subjects at University will use TeX in
one form or another.

So how do I use it?
~~~~~~~~~~~~~~~~~~~

First, using your favourite editor, you create a LaTeX or a
TeX file, and save this onto disc. TeX and LaTeX files have
type &2A7 and &2A8 respectively.

Next, just double click these and TeX/LaTeX should do its job.
When they finish you should be left with a Log file that
describes what went on during compilation, and a DVI output
file.

To check the output, double click the DVI file and !DVIView
should start up and display the DVI file.

To print, either take the DVI file to the nearest machine
with a DVI printer routine on it, or save the pages out as
Draw files from the previewer and print those.

Installation
~~~~~~~~~~~~

Be prepared - it takes a lot of space.

First you unpack DVIview, TeXBase1, TeXBase2, TeXFnts1,
TeXFnts2, TeXFnts3, TeXFnts4 and TeXFnts5 into the same
directory. This is a fairly minimal working setup.

Next, if you want DaTeX (and/or SemTeX), unpack that into the
same directory.

Next, if you want LaTeX2e, unpack that into the same directory.

All this stuff I have tested, and it works as far as I can see.

If you want dvips, then unpack this into the same directory.

If you want lgrind, then unpack this into the same directory. I
haven't tested this at all :-(

If you want BibTeX, then unpack this into the same directory. This
is the ArMaTuReS BibTeX, but it seems to work OK now.

For the would be TeX hackers out there, you can also unpack TeXExtr1
and TeXExtr2 to get some more intersting TeX binaries and other
associated files.

For the really hardcore out there, the entire source for LaTeX2e
can be found in L2eSrc1 and L2eSrc2.


Changes from 2.01 -> 2.03
~~~~~~~~~~~~~~~~~~~~~~~~~

New DVIview (and TeXFonts upgrade).
Included SemTeX in the distribution.
Fixed names of Ulasy.fd and Ullasy.fd t avoid warnings in LaTeX2e.

Changes from 2.01 -> 2.02
~~~~~~~~~~~~~~~~~~~~~~~~~

Fixed problems with MFInputs$Path.
Updated Run$Path rather than multiple aliases.
Fix dvips to find binaries.

Changes from 2 -> 2.01
~~~~~~~~~~~~~~~~~~~~~~

Fixed problem with dvips assuming !TeX.Bin was in the Run$Path.
Fixed problem with LaTeX 2.09/2e exec scripts unsetting BibTeX from path.

Credits:
~~~~~~~~
(If I have missed anyone, then sorry - contact me, and I'll put you in)

Dick Alstein		(BibTeX/!BibTeX)	wsinda@win.tue.nl
David Arnold		(DaTeX)			daa93@aber.ac.uk
David Bryan		(!dvips/!MakeIndex)	djb1003@phx.cam.ac.uk
Chris Holgate		(Fix for !dvips)	c.holgate@ic.ac.uk
Paul Field		(!DVIview)		paulf@dcs.qmw.ac.uk
Alun Jones 		(BibTeX/archepsf.sty)
Mark J Sinke		(Original Port)		marks@stack.urc.tue.nl
Bryan Scattergood	(Making it all work!)	jbs@comlab.ox.ac.uk
Chris Taylor		(Hinted fonts)
Graham Toal		(BibTeX port)

(Both Alun Jones, and Chris Taylor are on email, but I don't have their
addresses with me. If people want it, then mail me.)
-------------------------------------------------------------------------
Well, thats about all I can think of to say at present. Good
luck. If you have any trouble with this, then feel free to
write to me at:

Warm Silence Software,
St Catherines College,
Manor Road,
Oxford, OX1 3UJ

or e-mail me at:

Robin.Watts@comlab.ox.ac.uk

I am by no means a TeXpert, but I will help if I can. (It
should be stressed that this is NOT a Warm Silence Software
product, so please don't blame us if it all goes wrong.)

Happy TeXing,

        Robin Watts
