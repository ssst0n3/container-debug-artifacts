#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin 67bc4bc2409faa0137dad48b822e8ce572302991
git checkout FETCH_HEAD
cd -