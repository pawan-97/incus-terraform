resource "incus_instance" "ubuntutf" {
  name  = "ubuntu-tf"
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
      "ipv4.address" = "10.229.23.100"    
    }
  }

  wait_for {
    type = "ipv4"
  }
}

output "ip_address" {
  value = incus_instance.ubuntutf.ipv4_address

}
