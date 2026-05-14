resource "google_compute_network" "vpc-network" {
  name                    = "vpc-net1"
  auto_create_subnetworks = false 
}
resource "google_compute_network" "vpc-network2" {
  name                    = "vpc-net3"
  auto_create_subnetworks = false 

}
resource "google_compute_network" "vpc-network4" {
  name                    = "vpc-net4"
  auto_create_subnetworks = false
  lifecycle {
    replace_triggered_by = [ google_compute_network.vpc-network3 ]
  }
}

resource "google_compute_network" "vpc-network3" {
  name                    = "vpc-net2"
  auto_create_subnetworks = false
  depends_on = [ google_compute_network.vpc-network2 ]
}
resource "google_compute_subnetwork" "vpc-netwok-subnet" {
  name          = "vpc-net1-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc-network.id
  region        = "us-central1"
}

resource "google_compute_subnetwork" "vpc-netwok-subnet2" {
  name          = "vpc-net1-subnet2"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc-network.id
  region        = "us-central1"
  timeouts {
    create = "10m"
    delete = "1h"
  }
}

resource "google_compute_subnetwork" "vpc-netwok-subnet3" {
  name          = "vpc-net1-subnet3"
  ip_cidr_range = "10.0.9.0/24"
  network       = google_compute_network.vpc-network.id
  region        = "asia-south1"
  purpose = "PRIVATE"
  secondary_ip_range {
    range_name = "secondary-range"
    ip_cidr_range = "10.0.5.0/24"
  }
  private_ip_google_access = true
  lifecycle {
    create_before_destroy = true
  }


}
