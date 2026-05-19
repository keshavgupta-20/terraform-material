data "google_compute_network" "vpc" {
  name = var.network_name
}

resource "google_compute_subnetwork" "network-with" {
  for_each = var.subnets

  name          = each.key
  ip_cidr_range = each.value
  region        = var.region
  network       = local.vpc_id
}
