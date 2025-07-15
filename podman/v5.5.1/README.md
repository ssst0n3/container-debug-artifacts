use my pre-built image

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/podman/v5.5.1/
$ git clone --depth 1 --branch v5.5.1 https://github.com/containers/podman.git
$ ./apply-patch.sh
$ cd podman
$ docker pull ssst0n3/podman_dev:v5.5.1
$ make shell
de894ad16f4c:/go/src/github.com/containers/podman# make debug
```

or build dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/podman/v5.5.1/
$ ./image.sh
$ cd podman
$ make shell
de894ad16f4c:/go/src/github.com/containers/podman# make debug
```

