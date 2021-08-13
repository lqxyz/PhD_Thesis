## PhD_Thesis
This is my PhD thesis draft.

#### File structure
* `thesis.tex`: major `tex` file
* `chapter`: `tex` files for each chapter
* `figs`: the figure files (`.pdf` or `.png` format) for each chapter (subfolder)
* `utils`: The scripts used to install necessary packages on Linux platform, such as [`TeXLive`](https://www.tug.org/texlive/) and `Arial` font

#### Compile the latex file
1. Use [`make`](https://www.gnu.org/software/make) and `Makefile`: they compile the latex files through [`latexmk`](https://ctan.org/pkg/latexmk/?lang=en) and compress the output `pdf` file through the [`ghostscript`](https://www.ghostscript.com/) command `gs`.
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

    After that, the latex files can be compiled as follows (same to the methods used in `.github/workflows/compile_linux.yml`): 
    ```{bash}
    TEXFN=thesis
    tectonic --reruns=0 ${TEXFN}.tex  # --keep-intermediates 
    makeindex ${TEXFN}
    makeindex ${TEXFN}.nlo -s nomencl.ist -o ${TEXFN}.nls
    tectonic ${TEXFN}.tex
    ```
