#!/bin/bash

src="containerd"

if [[ -d "$src/.git" ]]; then
  echo "[+] The directory '$src' exists."
else
  rm -rf "$src"
  git clone --depth 1 --branch v0.2.9 https://github.com/containerd/containerd.git "$src"
fi

./apply-patch.sh "$src"

cd "$src"
make image
