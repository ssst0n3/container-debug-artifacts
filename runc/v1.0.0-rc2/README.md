build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc2/
$ ./image.sh
$ cd runc
$ make shell
root@949a40bdad0f:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:v1.0.0-rc2

```
$ git clone --depth 1 --branch v1.0.0-rc2 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.0-rc2
$ make shell RUNC_IMAGE=ssst0n3/runc_dev:v1.0.0-rc2
root@c321134b2d68:/go/src/github.com/opencontainers/runc# make debug
```
