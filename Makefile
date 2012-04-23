all: paper.pdf

%.dvi: %.tex
	latex $*
	bibtex $*
	latex $*
	latex $*
%.ps:	%.dvi
	dvips -e 0 $*
%.pdf:	%.ps
	ps2pdf $< $@
%.eps:	%.jpg
#	jpegtopnm $< | pnmtops -nocenter -noturn | ps2eps > $@
#	convert $< $@
	sam2p $< $@
%.eps:	%.png
	sam2p $< $@

paper.dvi: paper.bib
paper.dvi: xo3-4.eps roger1.eps turtlescript-2.eps

paper.tgz: paper.pdf paper.tex paper.bib sig-alternate.cls \
	   xo3-4.eps turtlescript-2.eps
	tar czf $@ $^

clean:
	$(RM) *.dvi *.aux *.bbl *.blg *.log paper.pdf paper.tgz
