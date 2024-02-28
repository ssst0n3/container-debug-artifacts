# syntax=docker/dockerfile:1

ARG GO_VERSION=1.20.4
ARG BASE_DEBIAN_DISTRO="bullseye"
ARG GOLANG_IMAGE="golang:${GO_VERSION}-${BASE_DEBIAN_DISTRO}"

FROM ${GOLANG_IMAGE} AS base

FROM base AS delve
ARG DELVE_VERSION
ARG GOPROXY
RUN go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}

FROM scratch AS binary
ARG DELVE_VERSION
COPY --from=delve /go/bin/dlv /${DELVE_VERSION}/dlv-${DELVE_VERSION}
