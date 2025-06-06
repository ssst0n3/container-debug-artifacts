#!/bin/bash

if [[ -d "runc" ]]; then
  echo "[+] The directory 'runc' exists."
else
    git clone --depth 1 --branch v1.3.0-rc.1 https://github.com/opencontainers/runc.git
fi

./apply-patch.sh
cd runc
make runcimage
