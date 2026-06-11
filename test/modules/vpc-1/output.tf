output "network" {
  value = {
    name = google_compute_network.network-1.name,
    subnet_name = google_compute_subnetwork.practice-subnet.name,
    cidr = google_compute_subnetwork.practice-subnet.ip_cidr_range
  }

}