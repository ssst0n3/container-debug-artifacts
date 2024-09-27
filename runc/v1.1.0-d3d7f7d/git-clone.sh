#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin d3d7f7d85abfe7bd6f4ddbe45ad6b1c188dcf194
git checkout FETCH_HEAD
cd -