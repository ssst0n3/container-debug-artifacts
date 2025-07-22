#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 933fcc981418bd6994abd76701a2833789e143f5
git checkout FETCH_HEAD
cd -