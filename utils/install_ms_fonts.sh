#!/bin/bash
# Install MS fonts on Scientific Linux without root privilege

wget -N http://corefonts.sourceforge.net/msttcorefonts-2.5-1.spec
rpmbuild -ba msttcorefonts-2.5-1.spec

cp ~/rpmbuild/BUILD/msttcorefonts/fonts/*.ttf ~/.fonts/
fc-cache -f -v 

echo "Test: find arial font"
fc-list | grep Arial

