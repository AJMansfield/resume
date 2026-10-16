.PHONY: all install-deps clean

LATEXRUN := TEXINPUTS=.:./moderncv//:$$TEXINPUTS ./latexrun/latexrun --latex-cmd=lualatex
SOURCES := personal-info.tex personal-refs.tex doc-setup.tex macros.tex

all: Anson-Mansfield-tech.pdf Anson-Mansfield-trades.pdf

install-deps:
	cd ./fontawesome7/ && (echo y | ./local_install.sh)

%.pdf: %.tex $(SOURCES)
	$(LATEXRUN) $< -o $@


clean:
	$(LATEXRUN) --clean-all

