#!/bin/bash

if [[ -d "nvidia-container-toolkit" ]]; then
  echo "[+] The directory 'nvidia-container-toolkit' exists."
else
    git clone --depth 1 --branch v1.17.6 https://github.com/NVIDIA/nvidia-container-toolkit.git
fi

./apply-patch.sh
cd nvidia-container-toolkit
make image
