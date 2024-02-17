build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc3/
$ ./image.sh
Cloning into 'runc'...
...
patch -p1 /root/container-debug-artifacts/runc/v1.0.0-rc3/patch/0001-Fix-make-shell.patch
patching file Makefile
Hunk #1 succeeded at 96 with fuzz 2 (offset 14 lines).
patch -p1 /root/container-debug-artifacts/runc/v1.0.0-rc3/patch/0002-Fix-debian-jessie-sources-archived.patch
patching file Dockerfile
patch -p1 /root/container-debug-artifacts/runc/v1.0.0-rc3/patch/0003-Fix-missing-apparmor.patch
patching file Dockerfile
docker build -t runc_dev:HEAD .
Sending build context to Docker daemon  2.854MB
Step 1/15 : FROM golang:1.8.0
 ---> 2cc9519276d1
...
Step 15/15 : ADD . /go/src/github.com/opencontainers/runc
 ---> cdf4c51b0cab
Successfully built cdf4c51b0cab
Successfully tagged runc_dev:HEAD
$ cd runc
$ make shell
docker build -t runc_dev:HEAD .
Sending build context to Docker daemon  2.854MB
Step 1/15 : FROM golang:1.8.0
 ---> 2cc9519276d1
Step 2/15 : RUN echo 'deb http://archive.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list
 ---> Using cache
...
Step 15/15 : ADD . /go/src/github.com/opencontainers/runc
 ---> Using cache
 ---> cdf4c51b0cab
Successfully built cdf4c51b0cab
Successfully tagged runc_dev:HEAD
docker run -e TESTFLAGS -ti --privileged --rm -v /root/container-debug-artifacts/runc/v1.0.0-rc3/runc:/go/src/github.com/opencontainers/runc runc_dev:HEAD bash
root@949a40bdad0f:/go/src/github.com/opencontainers/runc# 
root@949a40bdad0f:/go/src/github.com/opencontainers/runc# make release
Building target: /go/src/github.com/opencontainers/runc/release/runc
Building target: /go/src/github.com/opencontainers/runc/release/runc.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.apparmor
Building target: /go/src/github.com/opencontainers/runc/release/runc.apparmor.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.selinux
Building target: /go/src/github.com/opencontainers/runc/release/runc.selinux.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.selinux.apparmor
Building target: /go/src/github.com/opencontainers/runc/release/runc.selinux.apparmor.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.apparmor
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.apparmor.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.selinux
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.selinux.static
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.selinux.apparmor
Building target: /go/src/github.com/opencontainers/runc/release/runc.seccomp.selinux.apparmor.static
```

or use my pre-built image [ssst0n3/runc_dev:v1.0.0-rc3](https://hub.docker.com/layers/ssst0n3/runc_dev/v1.0.0-rc3/images/sha256-d4afee640526412bd8013e85949ec9f8b2b3ef488c83f3b1b441d63e782d7441?context=explore)

```
$ git clone --depth 1 --branch v1.0.0-rc3 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.0-rc3
$ make RUNC_IMAGE=ssst0n3/runc_dev:v1.0.0-rc3 shell
```