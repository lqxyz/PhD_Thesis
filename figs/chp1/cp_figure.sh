#!/bin/bash

#figs=("a" "b")
#
#for fig in ${figs[@]}
#do
#
#    echo $fig
#done

cat ../../chapter1.tex | grep includegraphics | grep Exps_Analysis | awk -F '{' '{print $NF}' | tr -d } | while read line; do cp ../../"$line"* .; done
