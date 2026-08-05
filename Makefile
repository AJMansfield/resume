.PHONY: all install-deps clean

LATEXRUN := TEXINPUTS=.:./moderncv//:$$TEXINPUTS ./latexrun/latexrun --latex-cmd=lualatex
SOURCES := resume.tex personal-info.tex personal-refs.tex

all: Anson-Mansfield.pdf

install-deps:
	cd ./fontawesome7/ && (echo y | ./local_install.sh)

%.pdf: $(SOURCES)
	$(LATEXRUN) resume.tex -o $@

clean:
	$(LATEXRUN) --clean-all

