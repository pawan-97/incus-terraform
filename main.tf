module "container1" {
  source = "./modules/container"
  name = "ubuntu-tf-1"
  ip_address = "10.229.23.101"
}

module "container2" {
  source = "./modules/container"
  name = "ubuntu-tf-2"
  ip_address = "10.229.23.102"
}

module "container3" {
  source = "./modules/container"
  name = "ubuntu-tf-3"
  ip_address = "10.229.23.103"
}