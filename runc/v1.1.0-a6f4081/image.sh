#!/bin/bash

if [[ -d "runc" ]]; then
  echo "[+] The directory 'runc' exists."
else
    ./git-clone.sh
fi

./apply-patch.sh
cd runc
make runcimage
