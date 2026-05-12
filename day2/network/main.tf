resource "google_compute_network" "vpc-network" {
  name                    = "auto-create-subnetworks"
  auto_create_subnetworks = true
}
resource "google_compute_network" "custom-network" {
  name                    = "custom-subnetworks"
  auto_create_subnetworks = false
  mtu = 1300
  
}

resource "google_compute_subnetwork" "default-subnet" {
  name          = "default-subnet"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.custom-network.id
  region        = "us-central1"
  private_ip_google_access = true

}
output "auto" {
    value = google_compute_network.vpc-network.id
  
}
output "custom" {
    value = google_compute_network.custom-network.id
  
}

resource "google_compute_firewall" "default-allow-icmp" {
  name    = "default-allow-icm"
  network = google_compute_network.custom-network.id

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  destination_ranges = ["10.0.0.0/16"]
  
}