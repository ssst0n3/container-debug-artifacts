build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.1.15/
$ ./image.sh
$ cd runc
$ make shell
root@968abdc534ad:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:v1.1.15

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.1.15/
$ git clone --depth 1 --branch v1.1.15 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.1.15
$ make shell RUNC_IMAGE=ssst0n3/runc_dev:v1.1.15
root@f136aafad59e:/go/src/github.com/opencontainers/runc# make debug
```
