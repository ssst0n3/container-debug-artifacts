#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin a6f4081766a0f405bb9b5e798a4930c1f434c6b1
git checkout FETCH_HEAD
cd -