#!/bin/bash

cwd=$PWD
if [[ -n "$1" ]]; then
  src="$cwd/$1"
else
  src="$cwd/containerd"
fi

series=$cwd/series.conf
while IPF= read -r line
do
    if [[ "$line" =~ ^patch* ]]; then
        echo patch -p1 $cwd/$line
	    cd $src && patch -p1 -N < $cwd/$line
	    # git add . && git commit -m $line
    fi
done <"$series"
