#!/bin/bash

cwd=$PWD
src=$cwd/runc

series=$cwd/series.conf
while IPF= read -r line
do
    if [[ "$line" =~ ^patch* ]]; then
        echo patch -p1 $cwd/$line
 	    cd $src && patch -p1 < $cwd/$line
        # do not commit to prevent the commit changed in the runc --version
        # git add . && git commit -m "apply patch $line"
    fi
done <"$series"
