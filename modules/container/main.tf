terraform {
  required_providers {
    incus = {
      source  = "lxc/incus"
      version = "0.3.1"
    }
  }
}

variable "name" {}
variable "ip_address" {}

resource "incus_instance" "container" {
  name  = var.name
  image = "images:ubuntu/22.04"
  type  = "container"

  config = {
    "boot.autostart" = true
    "limits.cpu"     = 1
    "limits.memory"  = "500MiB"
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      pool = "default"
      size = "8GB"
      path = "/"
    }
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      network   = "incusbr0"
      name      = "eth0"
      "ipv4.address" = var.ip_address
    }
  }
}