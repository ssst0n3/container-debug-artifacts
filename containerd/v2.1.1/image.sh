#!/bin/bash

if [[ -d "containerd" ]]; then
  echo "[+] The directory 'containerd' exists."
else
    git clone --depth 1 --branch v2.1.1 https://github.com/containerd/containerd.git
fi

./apply-patch.sh
cd containerd
make image
