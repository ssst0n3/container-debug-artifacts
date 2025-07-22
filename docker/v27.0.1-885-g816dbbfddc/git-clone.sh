#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 816dbbfddcbc3fab47eb4aaa7d4878e0b58396d4
git checkout FETCH_HEAD
cd -