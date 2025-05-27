#!/bin/bash

if [[ -d "moby" ]]; then
  echo "[+] The directory 'moby' exists."
else
    git clone --depth 1 --branch v19.03.13 https://github.com/moby/moby.git
fi

./apply-patch.sh
cd moby
make build
