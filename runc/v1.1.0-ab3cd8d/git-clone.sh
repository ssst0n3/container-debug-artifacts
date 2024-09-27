#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin ab3cd8d73e61847e16fbc2fd1ce054301dc240d4
git checkout FETCH_HEAD
cd -