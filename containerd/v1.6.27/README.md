build containerd dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/containerd/v1.6.27/
$ ./image.sh
$ cd containerd
$ make shell
root@2b4e0421c250:/go/src/github.com/containerd/containerd# make debug
```

or use my pre-built image ssst0n3/containerd_dev:v1.6.27

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/runc/v1.6.27/
$ git clone --depth 1 --branch v1.6.27 https://github.com/containerd/containerd.git
$ ./apply-patch.sh
$ cd containerd
$ docker pull ssst0n3/containerd_dev:v1.6.27
$ make shell
root@2b4e0421c250:/go/src/github.com/containerd/containerd# make debug
```