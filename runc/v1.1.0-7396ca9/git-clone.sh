#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin 7396ca90fa47d0458da4188061b24ca1bff465bf
git checkout FETCH_HEAD
cd -