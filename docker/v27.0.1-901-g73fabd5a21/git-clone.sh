#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 73fabd5a2182f6a543efaa90dccf5ff110c90e4e
git checkout FETCH_HEAD
cd -