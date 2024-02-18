build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc10/
$ ./image.sh
$ cd runc
$ make shell
docker run  -ti --privileged --rm -v /root/research_project/container-debug-artifacts/runc/v1.0.0-rc10/runc:/go/src/github.com/opencontainers/runc runc_dev:HEAD bash
root@0810a4f85672:/go/src/github.com/opencontainers/runc# make EXTRA_FLAGS='-gcflags="all=-N -l"' release
```

or use my pre-built image [ssst0n3/runc_dev:v1.0.0-rc10](https://hub.docker.com/layers/ssst0n3/runc_dev/v1.0.0-rc10/images/sha256-16dc33e08cecc850c896788dcb690b1e6c5ebd9180ffdbc625111ccb625221ac?context=explore)

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc10/
$ git clone --depth 1 --branch v1.0.0-rc10 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.0-rc10
$ make RUNC_IMAGE=ssst0n3/runc_dev:v1.0.0-rc10 shell
root@c321134b2d68:/go/src/github.com/opencontainers/runc# make EXTRA_FLAGS='-gcflags="all=-N -l"' release
```