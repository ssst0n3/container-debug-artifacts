#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 330e717403b24fdc662354c6dd76f3106f3bc80d
git checkout FETCH_HEAD
cd -