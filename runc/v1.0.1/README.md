build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.1/
$ ./image.sh
$ cd runc
$ make shell
root@50d79b8464bb:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:v1.0.1

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.1/
$ git clone --depth 1 --branch v1.0.1 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.1
$ make RUNC_IMAGE=ssst0n3/runc_dev:v1.0.1 shell
root@f136aafad59e:/go/src/github.com/opencontainers/runc# make debug
```
