#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin e46e159001831b2d37c2f5982e39075eee034690
git checkout FETCH_HEAD
cd -