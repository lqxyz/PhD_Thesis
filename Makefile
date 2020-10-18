# Makefile to compile the thesis.tex

.PHONY: thesis.pdf all clean
all: thesis.pdf

# MAIN LATEXMK RULE
#
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
#    missing file reference and interactively asking you for an alternative.

thesis.pdf: thesis.tex
	#latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex
	latexmk -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex

cleanall:
	latexmk -CA
	#rm *.bbl *.nlo

clean:
	latexmk -c
	rm *.bbl *.nlo
