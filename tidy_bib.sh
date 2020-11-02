#!/bin/bash
# Tidy the bib file
#
# Qun Liu
# 2020/Nov/2

input_bib=paperslib.bib
input_bib_no_dup="${input_bib/.bib/_no_dup.bib}"
input_bib_backup="${input_bib/.bib/_backup.bib}"
output_bib=extracted.bib
tex_file=thesis

echo $input_bib_no_dup
echo $input_bib_backup

cp "$input_bib" "$input_bib_backup"

# Remove duplicated entries
# https://tex.stackexchange.com/questions/484975/filter-duplicates-in-a-bibtex-bib-file-like-uniq-for-text-files
bibtool -- 'print.deleted.entries = off' -d "$input_bib" -o "$input_bib_no_dup" 

# Sync with crossref 
# https://github.com/nschloe/betterbib
#
# -l: use long journal name, default false
betterbib -l "$input_bib_no_dup" "$input_bib" 

# Compile latex file again to get the latest aux file 
latexmk -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make "$tex_file".tex

# Extract sub-bibliography based on aux file
# https://tex.stackexchange.com/questions/41821/creating-bib-file-containing-only-the-cited-references-of-a-bigger-bib-file 
bibexport -o "$output_bib" "$tex_file".aux

# Online tool to tidy the bib file 
# https://varhowto.com/how-to-remove-duplicates-in-bibtex-bib-file-latex/
# https://flamingtempura.github.io/bibtex-tidy/

