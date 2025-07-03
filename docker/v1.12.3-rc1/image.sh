#!/bin/bash

if [[ -d "moby" ]]; then
  echo "[+] The directory 'moby' exists."
else
    git clone --depth 1 --branch v1.12.3-rc1 https://github.com/moby/moby.git
fi

./apply-patch.sh
cd moby
make image
