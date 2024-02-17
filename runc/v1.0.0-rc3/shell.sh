#!/bin/bash

if [[ -d "runc" ]]; then
  echo "[+] The directory 'runc' exists."
else
    git clone https://github.com/opencontainers/runc.git
    cd runc
    git checkout v1.0.0-rc3
    cd -
fi

./apply-patch.sh
cd runc
make shell