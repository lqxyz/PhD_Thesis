# Makefile to compile the thesis.tex
# References:
# 	https://tex.stackexchange.com/questions/318569/makefile-for-a-latex-report

LATEXMK = latexmk
RM = rm -f
TEXFN = thesis

all: ${TEXFN}.pdf ${TEXFN}_compressed.pdf

# MAIN LATEXMK RULE
#
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
#    missing file reference and interactively asking you for an alternative.

${TEXFN}.pdf: ${TEXFN}.tex
	#$(LATEXMK) -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make "$<"
	#$(LATEXMK) -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make "$<"
	$(LATEXMK) -f -pdf -xelatex -interaction=nonstopmode "$<"

${TEXFN}_compressed.pdf: ${TEXFN}.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
	   -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$@" "$<"

clean:
	$(LATEXMK) -silent -c
	$(RM) *.bbl *.nlo *.nls *.xdv chapter/*.aux

cleanall:
	$(LATEXMK) -silent -CA
	$(RM) *.bbl *.nlo *.nls *.xdv chapter/*.aux

.PHONY: all clean cleanall

