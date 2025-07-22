#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 035b8afe04e579d5377a740666eeb80f6edfec1e
git checkout FETCH_HEAD
cd -