output "network-name" {
  value = google_compute_network.vpc-network.name
}

output "subnet-name" {
  value = google_compute_subnetwork.subnet.name
}
