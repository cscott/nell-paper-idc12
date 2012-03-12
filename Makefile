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

clean:
	$(RM) *.dvi *.aux *.bbl *.blg *.log paper.pdf
