build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc5/
$ ./image.sh
$ cd runc
$ make shell
root@50d79b8464bb:/go/src/github.com/opencontainers/runc# make debug
```

or use my pre-built image ssst0n3/runc_dev:v1.0.0-rc5

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.0.0-rc5/
$ git clone --depth 1 --branch v1.0.0-rc5 https://github.com/opencontainers/runc.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/runc_dev:v1.0.0-rc5
$ make RUNC_IMAGE=ssst0n3/runc_dev:v1.0.0-rc5 shell
root@f136aafad59e:/go/src/github.com/opencontainers/runc# make debug
```

Goland:

1. Clone runc to /home/st0n3/research_project/opencontainers/runc-v1.0.0-rc5/src/github.com/opencontainers/runc
2. Open /home/st0n3/research_project/opencontainers/runc-v1.0.0-rc5
3. Disable gomod
4. Add /home/st0n3/research_project/opencontainers/runc-v1.0.0-rc5/src as Project GOPATH