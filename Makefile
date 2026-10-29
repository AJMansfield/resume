.PHONY: all install-deps clean

LATEXRUN := TEXINPUTS=.:./moderncv//:$$TEXINPUTS ./latexrun/latexrun --latex-cmd=lualatex

TEX_TARGETS := Anson-Mansfield-tech.pdf Anson-Mansfield-trades.pdf
TEX_EXTRA += personal-info.tex personal-refs.tex doc-setup.tex macros.tex publications.bib
TEX_EXTRA += $(wildcard moderncv/*.cls) $(wildcard moderncv/*.sty)

FILENAME_TARGETS += filenamed/Software-Engineer.pdf
FILENAME_TARGETS += filenamed/software-engineer/Anson-Mansfield.pdf
FILENAME_TARGETS += filenamed/Plumber.pdf
FILENAME_TARGETS += filenamed/plumber/Anson-Mansfield.pdf

all: $(TEX_TARGETS) $(FILENAME_TARGETS)

install-deps:
	cd ./fontawesome7/ && (echo y | ./local_install.sh)

clean:
	$(LATEXRUN) --clean-all
	rm $(FILENAME_TARGETS)

filenamed/Software-Engineer.pdf: Anson-Mansfield-tech.pdf
filenamed/software-engineer/Anson-Mansfield.pdf: Anson-Mansfield-tech.pdf
filenamed/Plumber.pdf: Anson-Mansfield-trades.pdf
filenamed/plumber/Anson-Mansfield.pdf: Anson-Mansfield-trades.pdf

$(FILENAME_TARGETS):
	@mkdir -p $(@D)
	cp $< $@

Anson-Mansfield-tech.pdf: Anson-Mansfield-tech.tex $(TEX_EXTRA)
Anson-Mansfield-trades.pdf: Anson-Mansfield-trades.tex $(TEX_EXTRA)

$(TEX_TARGETS):
	$(LATEXRUN) $< -o $@


