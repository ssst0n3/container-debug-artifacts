#!/bin/bash

if [[ -d "containerd" ]]; then
  echo "[+] The directory 'containerd' exists."
else
    git clone --depth 1 --branch v1.6.27 https://github.com/containerd/containerd.git
fi

./apply-patch.sh
cd runc
make image
