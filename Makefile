.PHONY: all install-deps clean

LATEXRUN := TEXINPUTS=.:./moderncv//:$$TEXINPUTS ./latexrun/latexrun --latex-cmd=lualatex
SOURCES := personal-info.tex personal-refs.tex doc-setup.tex macros.tex

all: Anson-Mansfield-tech.pdf Anson-Mansfield-tech.odt Anson-Mansfield-tech.docx Anson-Mansfield-trades.pdf Anson-Mansfield-trades.odt Anson-Mansfield-trades.docx

install-deps:
	cd ./fontawesome7/ && (echo y | ./local_install.sh)

%.pdf: %.tex $(SOURCES)
	$(LATEXRUN) $< -o $@

%.docx %.odt: %.tex $(SOURCES)
	pandoc -s $< -o $@

clean:
	$(LATEXRUN) --clean-all

