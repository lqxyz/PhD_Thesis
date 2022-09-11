## PhD_Thesis
This is my PhD thesis draft, and the PDF can be found from the Open Research Exeter ([ORE](http://hdl.handle.net/10871/128290)) or the e-theses online service ([EThOS](https://ethos.bl.uk/OrderDetails.do?uin=uk.bl.ethos.846052)) of British Library. The thesis template ([`thesisStyle.zip`](utils/thesisStyle.zip)) is from the module *Mathematics PGR Resources* on Exeter Learning Environment ([ELE](https://vle.exeter.ac.uk); the original file can be found [here](https://vle.exeter.ac.uk/mod/resource/view.php?id=697014), but you may need username and password to access).

#### File structure
* [thesis.tex](thesis.tex): main `tex` file
* [thesisPreamble.tex](thesisPreamble.tex): abstract and acknowledgement
* [paperslib.bib](paperslib.bib): the bibliorgraphy file, to be compiled by `bibtex`
* [ametsoc2014.bst](ametsoc2014.bst): the bibliorgraphy style, copied from [American Meteorological Society](https://www.ametsoc.org) journal [template](https://www.ametsoc.org/index.cfm/ams/publications/author-information/latex-author-info/)
* [exeterthesis.cls](exeterthesis.cls): thesis template for [University of Exeter](https://www.exeter.ac.uk/)
* [packages.tex](packages.tex): the `tex` packages, including self-defined commands
* [glossary.tex](glossary.tex): acronyms, abbreviations and symbols
* [chapter/](chapter/): `tex` files for each chapter
* [figs/](figs/): figure files (in `.pdf` or `.png` format) for each chapter (subfolder)
* [utils/](utils/): scripts to install necessary packages (i.e., [`TeX Live`](https://www.tug.org/texlive/) and `Arial` font) on Linux platform and to track changes since the initial submission
* [tidy_bib.sh](tidy_bib.sh): a shell script to tidy the `bib` file, but there might be some mistakes in the [Crossref](https://www.crossref.org/) database
* [.github/workflows/compile_linux.yml](.github/workflows/compile_linux.yml): Github action configuration file, which auto-compiles the `tex` files after any changes being pushed into this Github repository

#### Compile the LaTeX files
Perhaps need to install `TeX Live` and `Arial` font first (see the examples: [install_texlive.sh](utils/install_texlive.sh) and [install_ms_fonts.sh](utils/install_ms_fonts.sh)).

1. Use [`make`](https://www.gnu.org/software/make) and [Makefile](Makefile), which compile the LaTeX files through [`latexmk`](https://ctan.org/pkg/LaTeXmk/?lang=en) and compress the output `pdf` file through the [Ghostscript](https://www.ghostscript.com/) command `gs`:
    ```{bash}
    make
    ```
    Then we can get compiled file `thesis.pdf` and the compressed version `thesis_compressed.pdf`. Use `make clean` to remove the temporary files produced during the compilation, and use `make cleanall` to remove all the temporary and output `pdf` files.

2. Use [Tectonic](https://tectonic-typesetting.github.io/en-US/), which can automatically download support files.

    Tectonic can be installed following this [instruction](https://tectonic-typesetting.github.io/book/latest/installation/). Simply, install on Linux (or MacOS) through [`conda`](https://docs.conda.io/en/latest/):
    ```{bash}
    conda install -c conda-forge tectonic
    ```

    On MacOS, it can also be installed using [Homebrew](https://brew.sh/):
    ```{bash}
    brew install tectonic
    ```

    After that, the LaTeX files can be compiled as follows (same to the methods used in [compile_linux.yml](.github/workflows/compile_linux.yml)):
    ```{bash}
    TEXFN=thesis
    tectonic --reruns=0 ${TEXFN}.tex  # --keep-intermediates
    makeindex ${TEXFN}
    makeindex ${TEXFN}.nlo -s nomencl.ist -o ${TEXFN}.nls
    tectonic ${TEXFN}.tex
    ```
