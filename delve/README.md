
```
$ make DELVE_VERSION=v1.9.1 CN=1
GOPROXY="https://goproxy.cn,https://goproxy.io,direct" DELVE_VERSION=v1.9.1 docker buildx bake 
[+] Building 3.8s (9/9) FINISHED                                                                                                                                                                                                                             docker:default
 => [internal] load .dockerignore                                                                                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                        0.0s
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                   0.0s
 => => transferring dockerfile: 444B                                                                                                                                                                                                                                   0.0s
 => resolve image config for docker.io/docker/dockerfile:1                                                                                                                                                                                                             2.0s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:ac85f380a63b13dfcefa89046420e1781752bab202122f8f50032edf31be0021                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/golang:1.20.4-bullseye                                                                                                                                                                                              1.5s
 => [base 1/1] FROM docker.io/library/golang:1.20.4-bullseye@sha256:918857f4064db0fff49799ce5e7c4d43e394f452111cd89cca9af539c18a76a8                                                                                                                                   0.0s
 => CACHED [delve 1/1] RUN go install github.com/go-delve/delve/cmd/dlv@v1.9.1                                                                                                                                                                                         0.0s
 => [binary 1/1] COPY --from=delve /go/bin/dlv /v1.9.1/dlv-v1.9.1                                                                                                                                                                                                      0.0s
 => exporting to client directory                                                                                                                                                                                                                                      0.0s
 => => copying files 17.74MB
```
