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

clean:
	$(RM) *.dvi *.aux *.bbl *.blg *.log paper.pdf
