#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 29e5bfb0f015bf58c9f046bdc5d1b36a0f3db681
git checkout FETCH_HEAD
cd -