#!/bin/bash

cwd=$PWD
src=$cwd/containerd

cd $src
git config user.email "ssst0n3@gmail.com"
git config user.name "ssst0n3/container-debug-artifacts"
cd ..

series=$cwd/series.conf
while IPF= read -r line
do
    if [[ "$line" =~ ^patch* ]]; then
        echo patch -p1 $cwd/$line
 	    cd $src && patch -p1 < $cwd/$line
	    git add . && git commit -m $line
    fi
done <"$series"
