#!/bin/bash

cwd=$PWD
src=$cwd/nvidia-container-toolkit

series=$cwd/series.conf
while IPF= read -r line
do
    if [[ "$line" =~ ^patch* ]]; then
        echo patch -p1 $cwd/$line
 	    cd $src && patch -p1 < $cwd/$line
    fi
done <"$series"
