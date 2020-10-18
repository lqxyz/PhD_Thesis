# Makefile to compile the thesis.tex
# References:
# 	https://tex.stackexchange.com/questions/318569/makefile-for-a-latex-report

LATEXMK = latexmk

all: thesis.pdf

# MAIN LATEXMK RULE
#
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
#    missing file reference and interactively asking you for an alternative.

thesis.pdf: thesis.tex
	#$(LATEXMK) -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex
	$(LATEXMK) -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex

cleanall:
	$(LATEXMK) -silent -CA
	#rm *.bbl *.nlo

clean:
	$(LATEXMK) -silent -c
	rm *.bbl *.nlo

.PHONY: thesis.pdf all clean cleanall

