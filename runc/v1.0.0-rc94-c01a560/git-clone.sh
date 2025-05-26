#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin c01a56034f5ab0c1aa314377a499fe60a9c26b36
git checkout FETCH_HEAD
cd -