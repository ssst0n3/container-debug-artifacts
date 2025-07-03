use my pre-built image ssst0n3/docker_dev:v1.12.3-rc1

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/docker/v1.12.3-rc1/
$ git clone --depth 1 --branch v1.12.3-rc1 https://github.com/moby/moby.git
$ ./apply-patch.sh
$ cd moby
$ docker pull ssst0n3/docker_dev:v1.12.3-rc1
$ make shell DOCKER_IMAGE=ssst0n3/docker_dev:v1.12.3-rc1
# make debug
# ls -lah bin	
total 94M
drwxr-xr-x  2 root             root 4.0K Jul  3 07:46 .
drwxrwxr-x 39 unprivilegeduser 1000 4.0K Jul  3 07:46 ..
-rwxr-xr-x  1 root             root  15M Jul  3 07:46 docker-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root  11M Jul  3 07:46 docker-containerd-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root  11M Jul  3 07:46 docker-containerd-ctr-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root 3.6M Jul  3 07:46 docker-containerd-shim-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root 2.8M Jul  3 07:46 docker-proxy-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root 8.4M Jul  3 07:46 docker-runc-1.12.3-rc1-debug
-rwxr-xr-x  1 root             root  44M Jul  3 07:46 dockerd-1.12.3-rc1-debug
```

or build dev image and make shell

```
$ git clone https://github.com/ssst0n3/container-debug-artifacts.git
$ cd container-debug-artifacts/docker/v1.12.3-rc1/
$ ./image.sh
$ cd moby
$ make shell
# make debug
```
