build kubernetes dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/kubernetes/v1.32.2/
$ ./image.sh
$ cd kubernetes
$ make shell
root@<container>:~# make debug
```

or use my pre-built image ssst0n3/kubernetes_dev:v1.32.2

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/kubernetes/v1.32.2/
$ git clone --depth 1 --branch v1.32.2 https://github.com/kubernetes/kubernetes.git
$ ./patch.sh
$ cd kubernetes
$ docker pull ssst0n3/kubernetes_dev:v1.32.2
$ make shell
root@<container>:~# make debug
```
