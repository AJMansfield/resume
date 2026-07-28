.PHONY: all

LATEXRUN := ./latexrun/latexrun --latex-cmd=lualatex

all:
	$(LATEXRUN) resume.tex

%.pdf:
	$(LATEXRUN) resume.tex -o $@

clean:
	$(LATEXRUN) --clean-all

