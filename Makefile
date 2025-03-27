# Makefile for building FOKS whitepaper

# Configuration
TEXFILE = main.tex
OUTPUT = foks-whitepaper.pdf
LATEX = pdflatex
BIBTEX = bibtex

# Default target
all: $(OUTPUT)

# Build PDF
$(OUTPUT): $(TEXFILE) refs.bib threatmodel.tex design.tex crypto.tex
	$(LATEX) $(TEXFILE)
	$(BIBTEX) $(basename $(TEXFILE))
	$(LATEX) $(TEXFILE)
	$(LATEX) $(TEXFILE)
	mv $(basename $(TEXFILE)).pdf $(OUTPUT)

# Clean build artifacts
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.toc $(OUTPUT)

.PHONY: all clean
