#!/bin/bash

if [[ -d "moby" ]]; then
  echo "[+] The directory 'moby' exists."
else
    ./git-clone.sh
fi

./apply-patch.sh
cd moby
make build
