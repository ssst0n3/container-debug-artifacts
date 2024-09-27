build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.1.0-a6f4081/
$ ./image.sh
$ cd runc
$ make shell
root@554b7197dd11:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:v1.1.0-a6f4081

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.1.0-a6f4081/
$ ./git-clone.sh
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.1.0-a6f4081
$ make shell RUNC_IMAGE=ssst0n3/runc_dev:v1.1.0-a6f4081
root@f136aafad59e:/go/src/github.com/opencontainers/runc# make debug
```
