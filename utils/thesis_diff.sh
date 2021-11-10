#!/bin/bash
# Track changes of thesis after corrections
#
# For multiple tex files, flat them first before generate the diff tex file
# Refer to: http://www.brechtdeman.com/blog/LaTeX-diff.html

outdir='thesis_diff'
old_tex=thesis_old_flat.tex
new_tex=thesis_new_flat.tex
diff=thesis_diff

[[ ! -d $outdir ]] && mkdir $outdir
cd $outdir

# Checkout the latest version of thesis
git clone git@github.com:lqxyz/PhD_Thesis.git
cd PhD_Thesis
# latexpand can be installed by tlmgr, e.g.: sudo tlmgr install latexpand
latexpand thesis.tex > ../$new_tex

# Checkout to initial submission version according to tag
git checkout tags/v_submission
latexpand thesis.tex > ../$old_tex

git checkout main

mv ../$old_tex ../$new_tex .

echo "Generate the diff tex file..."
latexdiff $old_tex $new_tex > "$diff".tex

echo "Generate the diff pdf file..."
# Generatre nomenclature and glossory
xelatex -interaction=nonstopmode "$diff".tex
makeindex "$diff".nlo -s nomencl.ist -o "$diff".nls
latexmk -f -pdf -xelatex -interaction=nonstopmode "$diff".tex

mv "$diff".pdf ../../
cd ../../
rm -rf $outdir

echo "The output file is: $diff.pdf"

