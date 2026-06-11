locals {
  machine_type_map = {
    micro  = "e2-micro"
    small  = "e2-small"
    medium = "e2-medium"
    large  = "e2-standard-2"
  }
  gcp_machine_type = local.machine_type_map[var.machine_type]
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-net1"
  auto_create_subnetworks = false


}
resource "google_compute_subnetwork" "vpc-subnet1" {
  name          = "vpc-net1-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
  region        = var.region_resource

}

resource "google_compute_instance" "vm-1" {
  name         = "vm-1"
  machine_type = local.gcp_machine_type
  zone         = "${var.region_resource}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"

    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.vpc-subnet1.id
  }
  labels = {
    "env" = "prod"
  }
}