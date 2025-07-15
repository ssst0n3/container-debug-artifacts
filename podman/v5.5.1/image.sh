#!/bin/bash

if [[ -d "podman" ]]; then
  echo "[+] The directory 'podman' exists."
else
    git clone --depth 1 --branch v5.5.1 https://github.com/containers/podman.git
fi

./apply-patch.sh
cd podman
make image
