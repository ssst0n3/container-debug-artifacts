build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/openEuler-22.03-LTS/
$ ./image.sh
$ cd runc
$ make shell
root@949a40bdad0f:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:openEuler-22.03-LTS

```
$ git clone --depth 1 --branch openEuler-22.03-LTS https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:openEuler-22.03-LTS
$ make shell RUNC_IMAGE=ssst0n3/runc_dev:openEuler-22.03-LTS
root@c321134b2d68:/go/src/github.com/opencontainers/runc# make debug
```
