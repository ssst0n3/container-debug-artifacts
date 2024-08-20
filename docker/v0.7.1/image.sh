#!/bin/bash

if [[ -d "moby" ]]; then
  echo "[+] The directory 'moby' exists."
else
    git clone --depth 1 --branch v0.7.1 https://github.com/moby/moby.git
fi

# ./apply-patch.sh
# cd containerd
# make image
