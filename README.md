## PhD_Thesis
This is my PhD thesis draft.

#### File structure
* `thesis.tex`: main `tex` file
* `thesisPreamble.tex`: abstract and acknowledgement
* `paperslib.bib`: the bibliorgraphy file, to be compiled by `bibtex`
* `ametsoc2014.bst`: the bibliorgraphy style, copied from [American Meteorological Society](https://www.ametsoc.org) journal [template](https://www.ametsoc.org/index.cfm/ams/publications/author-information/latex-author-info/)
* `exeterthesis.cls`: thesis template for [University of Exeter](https://www.exeter.ac.uk/)
* `packages.tex`: the `tex` packages, including self-defined commands
* `glossary.tex`: acronyms, abbreviations and symbols
* `chapter`: `tex` files for each chapter
* `figs`: figure files (in `.pdf` or `.png` format) for each chapter (subfolder)
* `utils`: scripts used to install necessary packages on Linux platform, such as [`TeXLive`](https://www.tug.org/texlive/) and `Arial` font
* `tidy_bib.sh`: a shell script to tidy the `bib` file, but there might be some mistakes in the [`Crossref`](https://www.crossref.org/) database
*`.github/workflows/compile_linux.yml`: Github action configuration file, which auto-compiles the `tex` files after any changes being pushed in the Github repository

#### Compile the LaTeX file
1. Use [`make`](https://www.gnu.org/software/make) and `Makefile`, which compile the LaTeX files through [`LaTeXmk`](https://ctan.org/pkg/LaTeXmk/?lang=en) and compress the output `pdf` file through the [`ghostscript`](https://www.ghostscript.com/) command `gs`:
    ```{bash}
    make
    ```
    Then we can get compiled file `thesis.pdf` and the compressed version `thesis_compressed.pdf`. Use `make clean` to remove the temporary files produced during the compilation, and use `make cleanall` to remove all the temporary and output `pdf` files.

2. Use [`Tectonic`](https://tectonic-typesetting.github.io/en-US/), which can automatically download support files.

    `Tectonic` can be installed following this [instruction](https://tectonic-typesetting.github.io/book/latest/installation/). Install on Linux (or MacOS) through [`conda`](https://docs.conda.io/en/latest/):
    ```{bash}
    conda install -c conda-forge tectonic
    ```

    On MacOS, it can also be installed using [`Homebrew`](https://brew.sh/):
    ```{bash}
    brew install tectonic
    ```

    After that, the LaTeX files can be compiled as follows (same to the methods used in `.github/workflows/compile_linux.yml`):
    ```{bash}
    TEXFN=thesis
    tectonic --reruns=0 ${TEXFN}.tex  # --keep-intermediates
    makeindex ${TEXFN}
    makeindex ${TEXFN}.nlo -s nomencl.ist -o ${TEXFN}.nls
    tectonic ${TEXFN}.tex
    ```
