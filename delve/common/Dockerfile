# syntax=docker/dockerfile:1

ARG GO_VERSION=1.21
ARG BASE_DEBIAN_DISTRO="bullseye"
ARG GOLANG_IMAGE="golang:${GO_VERSION}-${BASE_DEBIAN_DISTRO}"

FROM ${GOLANG_IMAGE} AS base
ARG GIT_MIRROR
RUN git config --global --add safe.directory /root/app
RUN git config --global url."https://$GIT_MIRROR/github.com/".insteadOf "https://github.com/"
COPY install.sh /

FROM base AS delve
ARG DELVE_VERSION
ARG GOPROXY
# RUN go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}
RUN /install.sh

FROM scratch AS binary
ARG DELVE_VERSION
COPY --from=delve /go/bin/dlv /${DELVE_VERSION}/dlv-${DELVE_VERSION}
