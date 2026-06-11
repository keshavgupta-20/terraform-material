module "networking" {
    source = "./modules/networking"
    network-name = local.network-name
    subnetworks = var.subnet-name
    region = var.region
    firewall-name = var.firewall-name
    port-mapping =var.port-protocol    
}
locals {
    network-name = join("-", [var.env[0], var.network-name])

}


module "storage" {
    source  = "./modules/storage"
    project_id = var.projectid
    env = var.env
    app-name = var.app-name
    


}