#!/bin/bash

if [[ -d "runc" ]]; then
  echo "[+] The directory 'runc' exists."
else
    git clone --depth 1 --branch v1.2.0-rc.2 https://github.com/opencontainers/runc.git
fi

./apply-patch.sh
cd runc
make runcimage
