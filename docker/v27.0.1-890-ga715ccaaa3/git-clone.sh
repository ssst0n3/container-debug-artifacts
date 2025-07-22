#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin a715ccaaa31fe1120110d6136c4ed8b52b191c74
git checkout FETCH_HEAD
cd -