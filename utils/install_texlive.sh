#!/bin/bash
# Install the full TexLive on Scientific Linux without root privilege

# Download script to install texlive
url=https://mirror.ctan.org/systems/texlive/tlnet/install-tl.zip
pkg=$(basename $url)
dst_dir=${pkg/.zip/}
wget -N "$url"
[[ -f $pkg ]] && unzip -o -d $dst_dir $pkg
cd $dst_dir
mv -f install-tl-*/* .
rmdir install-tl-*

# Self-defined install directory
# add the texlive to PATHs
# e.g.: export PATH="/data/tools/texlive/2021/bin/x86_64-linux/:$PATH"
#       export MANPATH="/data/tools/texlive/2021/texmf-dist/doc/man:$MANPATH"
#       export INFOPATH="/data/tools/texlive/2021/texmf-dist/doc/info:$INFOPATH"
export TEXLIVE_INSTALL_PREFIX='/data/tools/texlive'
echo $TEXLIVE_INSTALL_PREFIX

# Follow the interactive instructions...
./install-tl

# Delete the downloaded files
# rm -rf $pkg $dst_dir
