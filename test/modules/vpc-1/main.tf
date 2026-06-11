resource "google_compute_network" "network-1" {
  name                    = var.network
  auto_create_subnetworks = false
  mtu                     = 1460
}
resource "google_compute_subnetwork" "practice-subnet" {
  name          = var.subnet
  ip_cidr_range = var.cidr
  network       = google_compute_network.network-1.id
  region         =  var.region

}
