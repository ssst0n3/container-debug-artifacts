.PHONY: binary

DEFAULT_CN_GOPROXY := "https://goproxy.cn,https://goproxy.io,direct"
DEFAULT_GIT_MIRROR := "hub.gitmirror.com"
GOPROXY ?= $(if $(CN),$(DEFAULT_CN_GOPROXY),)
GIT_MIRROR ?= $(if $(CN),$(DEFAULT_GIT_MIRROR),)

binary: 
	GIT_MIRROR=$(GIT_MIRROR) GOPROXY=$(GOPROXY) DELVE_VERSION=$(DELVE_VERSION) docker buildx bake
