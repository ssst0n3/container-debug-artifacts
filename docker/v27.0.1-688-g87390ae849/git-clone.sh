#!/bin/bash
mkdir moby
cd moby
git init
git remote add origin https://github.com/moby/moby.git
git fetch --depth 1 origin 87390ae84951403335216ba870226618ddfd50c3
git checkout FETCH_HEAD
cd -