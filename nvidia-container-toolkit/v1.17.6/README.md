build runc dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/nvidia-container-toolkit/v1.17.6/
$ ./image.sh
$ cd nvidia-container-toolkit
$ make shell
root@5f0c003bc4da:/go/src/nvidia-container-toolkit# make debug
```

or use my pre-built image ssst0n3/nvidia-container-toolkit_dev:v1.17.6

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/nvidia-container-toolkit/v1.17.6/
$ git clone --depth 1 --branch v1.17.6 https://github.com/NVIDIA/nvidia-container-toolkit.git
$ ./apply-patch.sh
$ cd runc
$ docker pull ssst0n3/nvidia-container-toolkit_dev:v1.17.6
$ make shell
root@5f0c003bc4da:/go/src/nvidia-container-toolkit# make debug
```
