#!/bin/bash

set -x

if [[ "$DELVE_VERSION" == "v1.1.0" ]] || [[ "$DELVE_VERSION" == "v1.0.0" ]]; then
    mkdir -p /go/src/github.com/derekparker/
    cd /go/src/github.com/derekparker/
    git clone --depth 1 --branch $DELVE_VERSION https://github.com/go-delve/delve.git
    cd delve
    make build CGO_ENABLED=0 GO111MODULE=off
    cp dlv /go/bin/
else 
CGO_ENABLED=0 go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}
fi