#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 8eba9bfa64e46c729377d6d8900a8782422ffae2
git checkout FETCH_HEAD
cd -