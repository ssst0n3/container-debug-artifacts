
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

## dlv-v1.5.0-85952c0

```
$ make DELVE_VERSION=85952c08267be75f85cf3ad92254cd57bebd8dc2
GIT_MIRROR= GOPROXY= DELVE_VERSION=85952c08267be75f85cf3ad92254cd57bebd8dc2 docker buildx bake
[+] Building 125.7s (16/16) FINISHED                                                                                                                           docker:default
 => [internal] load local bake definitions                                                                                                                               0.0s
 => => reading docker-bake.hcl 388B / 388B                                                                                                                               0.0s
 => [internal] load build definition from Dockerfile                                                                                                                     0.0s
 => => transferring dockerfile: 642B                                                                                                                                     0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:1                                                                                                0.0s
 => CACHED docker-image://docker.io/docker/dockerfile:1                                                                                                                  0.0s
 => [internal] load build definition from Dockerfile                                                                                                                     0.0s
 => [internal] load metadata for docker.io/library/golang:1.21-bullseye                                                                                                  5.5s
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                          0.0s
 => [base 1/4] FROM docker.io/library/golang:1.21-bullseye@sha256:40a67e6626bead90d5c7957bd0354cfeb8400e61acc3adc256e03252630014a6                                      98.4s
 => => resolve docker.io/library/golang:1.21-bullseye@sha256:40a67e6626bead90d5c7957bd0354cfeb8400e61acc3adc256e03252630014a6                                            0.0s
 => => sha256:40a67e6626bead90d5c7957bd0354cfeb8400e61acc3adc256e03252630014a6 9.10kB / 9.10kB                                                                           0.0s
 => => sha256:203e9cf21bd27322e5baf32653bf3314ccf688be497585240d18b9f0ca24f2ee 55.08MB / 55.08MB                                                                        58.4s
 => => sha256:6665b6f4bd774e6a4c9738f0532ee622cf3bc07679e5a4449ba05c1f395e4f75 54.59MB / 54.59MB                                                                        50.9s
 => => sha256:301b0f36ff74f5b3b0fcae9a158b6338fd6b6d1ed8231b0fff6460a065cebeb3 2.32kB / 2.32kB                                                                           0.0s
 => => sha256:3e3b31e004ade9e39bbdc18008b0494ba3c06533cb1f48949e868602249c555b 2.81kB / 2.81kB                                                                           0.0s
 => => sha256:9a3438c04e457d7cf49dfbfe92aa9c64df2c0d9dc8ac53a7dbda0c620c405d9f 15.76MB / 15.76MB                                                                        18.7s
 => => sha256:a818415ef02f582c87c5f378d9303dc6e2d2129563a28669c6dbfb6feba43b8f 85.96MB / 85.96MB                                                                        91.7s
 => => sha256:54bf7053e2d96c2c7f4637ad7580bd64345b3c9fabb163e1fdb8894aea8a9af0 67.01MB / 67.01MB                                                                        97.0s
 => => extracting sha256:203e9cf21bd27322e5baf32653bf3314ccf688be497585240d18b9f0ca24f2ee                                                                                0.7s
 => => sha256:0cc3eeb8d0994f3f39f914c543f5a0a2afc353306a1322a4a3193ebb99622f95 127B / 127B                                                                              59.3s
 => => extracting sha256:9a3438c04e457d7cf49dfbfe92aa9c64df2c0d9dc8ac53a7dbda0c620c405d9f                                                                                0.1s
 => => extracting sha256:6665b6f4bd774e6a4c9738f0532ee622cf3bc07679e5a4449ba05c1f395e4f75                                                                                0.7s
 => => sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1 32B / 32B                                                                                60.7s
 => => extracting sha256:a818415ef02f582c87c5f378d9303dc6e2d2129563a28669c6dbfb6feba43b8f                                                                                0.9s
 => => extracting sha256:54bf7053e2d96c2c7f4637ad7580bd64345b3c9fabb163e1fdb8894aea8a9af0                                                                                1.3s
 => => extracting sha256:0cc3eeb8d0994f3f39f914c543f5a0a2afc353306a1322a4a3193ebb99622f95                                                                                0.0s
 => => extracting sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1                                                                                0.0s
 => [internal] load build context                                                                                                                                        0.0s
 => => transferring context: 474B                                                                                                                                        0.0s
 => [base 2/4] RUN git config --global --add safe.directory /root/app                                                                                                    0.2s
 => [base 3/4] RUN git config --global url."https:///github.com/".insteadOf "https://github.com/"                                                                        0.1s
 => [base 4/4] COPY install.sh /                                                                                                                                         0.0s
 => [delve 1/1] RUN /install.sh                                                                                                                                         21.2s
 => [binary 1/1] COPY --from=delve /go/bin/dlv /85952c08267be75f85cf3ad92254cd57bebd8dc2/dlv-85952c08267be75f85cf3ad92254cd57bebd8dc2                                    0.0s
 => exporting to client directory                                                                                                                                        0.0s
 => => copying files 14.54MB
```