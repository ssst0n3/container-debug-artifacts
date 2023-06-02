# syntax=docker/dockerfile:1

ARG GO_VERSION=1.20.4
ARG BASE_DEBIAN_DISTRO="bullseye"
ARG GOLANG_IMAGE="golang:${GO_VERSION}-${BASE_DEBIAN_DISTRO}"

FROM ${GOLANG_IMAGE} AS base

FROM base AS delve
ARG DELVE_VERSION=v1.20.2
RUN go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}

FROM scratch AS binary
COPY --from=delve /go/bin/dlv /
