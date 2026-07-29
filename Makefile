.PHONY: all clean

LATEXRUN := ./latexrun/latexrun --latex-cmd=lualatex
SOURCES := resume.tex personal-info.tex personal-refs.tex

all: Anson-Mansfield.pdf

%.pdf: $(SOURCES)
	$(LATEXRUN) resume.tex -o $@

clean:
	$(LATEXRUN) --clean-all

