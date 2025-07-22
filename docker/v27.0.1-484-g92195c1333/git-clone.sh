#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 92195c1333df23d2cddb62b09133e8f763223816
git checkout FETCH_HEAD
cd -