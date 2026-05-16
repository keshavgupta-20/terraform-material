resource "google_compute_network" "vpc_network" {
    name = var.vpc-network-name
    auto_create_subnetworks = false
    mtu = 1460

}
resource "google_compute_subnetwork" "subnets" {
    count = length(var.subnetwork-ip)
    name = "test-subnetwork-${count.index}"
    region = "us-central1"
    network = google_compute_network.vpc_network.name
    ip_cidr_range = var.subnetwork-ip[count.index]
    private_ip_google_access = (
        count.index %2 ==0
    )
}
resource "google_compute_instance" "vm-1"{
    name = "my-instance"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network    = google_compute_network.vpc_network.name
        subnetwork = google_compute_subnetwork.subnets[1].name
        
    }
}