## PhD_Thesis
This is my PhD thesis draft.

#### File structure


#### Compile the LaTex file
1. Use [`make`](https://www.gnu.org/software/make) and `Makefile`: they compile the LaTex files through [`latexmk`](https://ctan.org/pkg/latexmk/?lang=en) and compile the output `pdf` file through the [`ghostscript`](https://www.ghostscript.com/) command `gs`.
```{bash}
make
```
Then we can get compiled file `thesis.pdf` and its compressed version `thesis_compressed.pdf`. Use `make clean` to remove the temporary files produced during the compilation, and use `make cleanall` to remove all the temporary and output `pdf` files.

2. Use [`Tectonic`](https://tectonic-typesetting.github.io/en-US/), which can be installed following this [instruction](https://tectonic-typesetting.github.io/book/latest/installation/).

Install on Linux (or MacOS) through [`conda`](https://docs.conda.io/en/latest/):
```{bash}
conda install -c conda-forge tectonic
```

On MacOS, it can also be installed using [`Homebrew`](https://brew.sh/):
```{bash}
brew install tectonic
```

After that, the latex files can be compiled as follows: 
```{bash}
TEXFN=thesis
# tectonic --keep-intermediates --reruns=0 ${TEXFN}.tex
tectonic --reruns=0 ${TEXFN}.tex
makeindex ${TEXFN}
makeindex ${TEXFN}.nlo -s nomencl.ist -o ${TEXFN}.nls
tectonic ${TEXFN}.tex
```
