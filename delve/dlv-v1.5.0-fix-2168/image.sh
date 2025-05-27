#!/bin/bash

if [[ -d "runc" ]]; then
  echo "[+] The directory 'runc' exists."
else
    git clone --depth 1 --branch v1.5.0 https://github.com/go-delve/delve.git
fi

./apply-patch.sh
cd delve
make image
