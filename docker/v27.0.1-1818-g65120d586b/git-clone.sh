#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 65120d586b59d5197df9fc81267f8e927211016a
git checkout FETCH_HEAD
cd -