variable "DELVE_VERSION" {
  default = "v1.20.2"
}

variable "GOPROXY" {
  default = "direct"
}

variable "GIT_MIRROR" {
  default = ""
}

group "default" {
  targets = ["binary"]
}

target "_common" {
  args = {
    DELVE_VERSION = DELVE_VERSION
    GOPROXY = GOPROXY
    GIT_MIRROR = GIT_MIRROR
  }
}

target "binary" {
  inherits = ["_common"]
  target = "binary"
  output = ["bin"]
}
