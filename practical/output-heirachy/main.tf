module "network" {
  source       = "./module-network"
  network-name = var.network-name
  subnet-name  = var.subnet-name
  cidr         = var.cidr
  region       = var.region
}

module "vm" {
  source       = "./module-vm"
  vm-name      = var.vm-name
  zone         = var.zone
  network-name = module.network.network-name
  subnet-name  = module.network.subnet-name
}
