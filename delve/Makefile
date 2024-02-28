.PHONY: binary

DEFAULT_CN_GOPROXY := https://goproxy.cn,https://goproxy.io,direct
GOPROXY ?= $(if $(CN),$(DEFAULT_CN_GOPROXY),)

binary: 
	GOPROXY="$(GOPROXY)" DELVE_VERSION=$(DELVE_VERSION) docker buildx bake 
