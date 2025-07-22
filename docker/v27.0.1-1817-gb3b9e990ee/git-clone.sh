#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin b3b9e990ee6c03bbbdf2166453f51628745ab464
git checkout FETCH_HEAD
cd -