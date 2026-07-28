.PHONY: all

all:
	./latexrun/latexrun resume.tex

%.pdf:
	./latexrun/latexrun resume.tex -o $@

clean:
	./latexrun/latexrun --clean-all

