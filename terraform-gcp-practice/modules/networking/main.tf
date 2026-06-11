resource "google_compute_network" "vpc-network"{
    name = var.network-name
    auto_create_subnetworks = false
    mtu = 1460
}
resource "google_compute_subnetwork" "subnetwork" {
    for_each = var.subnetworks
    name = each.key
    ip_cidr_range =  each.value
    region = var.region
    network = google_compute_network.vpc-network.id
}
resource "google_compute_firewall" "firewall_rule" {
  for_each = var.port-mapping

  name    = "${var.firewall-name}-${each.key}"
  network = google_compute_network.vpc-network.id

  allow {
    protocol = each.value.protocol
    ports    = [each.value.port]
  }

  direction      = "INGRESS"
  source_ranges  = ["0.0.0.0/0"]
}