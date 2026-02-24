build kubernetes dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/kubernetes/v1.33.8/
$ ./image.sh
$ cd kubernetes
$ make shell
root@<container>:~# make debug
```

or use my pre-built image ssst0n3/kubernetes_dev:v1.33.8

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/kubernetes/v1.33.8/
$ git clone --depth 1 --branch v1.33.8 https://github.com/kubernetes/kubernetes.git
$ ./patch.sh
$ cd kubernetes
$ docker pull ssst0n3/kubernetes_dev:v1.33.8
$ make shell
root@<container>:~# make debug
```
