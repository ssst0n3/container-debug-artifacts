build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0/
$ ./image.sh
$ cd runc
$ make shell
docker run  \
	-ti --privileged --rm \
	-v /root/research_project/container-debug-artifacts/runc/v1.0.0/runc:/go/src/github.com/opencontainers/runc \
	runc_dev:HEAD bash
root@50d79b8464bb:/go/src/github.com/opencontainers/runc# git config --global url."https://$GIT_MIRROR/github.com/".insteadOf "https://github.com/" # optional
root@50d79b8464bb:/go/src/github.com/opencontainers/runc# make EXTRA_FLAGS='-gcflags="all=-N -l"' static
```

or use my pre-built image [ssst0n3/runc_dev:v1.0.0](https://hub.docker.com/layers/ssst0n3/runc_dev/v1.0.0/images/sha256-5c85d74df7bbdb00b84f967284c676332b9095a5ff033e0e7601bf15794c7dc0?context=explore)

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0/
$ git clone --depth 1 --branch v1.0.0 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.0
$ make RUNC_IMAGE=ssst0n3/runc_dev:v1.0.0 shell
root@f136aafad59e:/go/src/github.com/opencontainers/runc# git config --global url."https://$GIT_MIRROR/github.com/".insteadOf "https://github.com/" # optional
root@f136aafad59e:/go/src/github.com/opencontainers/runc# make EXTRA_FLAGS='-gcflags="all=-N -l"' static
```
