#!/bin/bash

if [[ -d "kubernetes" ]]; then
  echo "[+] The directory 'kubernetes' exists."
else
    git clone --depth 1 --branch v1.33.8 https://github.com/kubernetes/kubernetes.git
fi

./patch.sh
cd kubernetes
make image
