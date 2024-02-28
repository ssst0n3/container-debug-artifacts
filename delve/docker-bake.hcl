variable "DELVE_VERSION" {
  default = "v1.20.2"
}

variable "GOPROXY" {
  default = "direct"
}

group "default" {
  targets = ["binary"]
}

target "_common" {
  args = {
    DELVE_VERSION = DELVE_VERSION
    GOPROXY = GOPROXY
  }
}

target "binary" {
  inherits = ["_common"]
  target = "binary"
  output = ["bin"]
}
