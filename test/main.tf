module "network" {
    source = "./modules/vpc-1"
   
    region  = var.region
    network = var.network
    subnet  = var.subnet
    cidr    = var.cidr
}
module "firewall" {
    source = "./modules/firewall"
    vpc-network = module.network.network.name
    subnetwork = var.subnet
    firewall_name = var.firewall_name
}