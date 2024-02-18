build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc3/
$ ./image.sh
$ cd runc
$ make shell
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
root@c321134b2d68:/go/src/github.com/opencontainers/runc# 
```
