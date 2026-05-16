resource "google_compute_network" "vpc-network" {
  name                    = var.network-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet-name
  ip_cidr_range = var.cidr
  region        = var.region
  network       = google_compute_network.vpc-network.id
}
