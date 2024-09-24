#!/bin/bash
mkdir runc
cd runc
git init
git remote add origin https://github.com/opencontainers/runc.git
git fetch --depth 1 origin 7d09ba10cc873f3332dd3de5304fbcd6814d72eb
git checkout FETCH_HEAD
cd -