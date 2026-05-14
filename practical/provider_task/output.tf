data "google_client_openid_userinfo" "me" {}

output "current_account" {
  value = data.google_client_openid_userinfo.me.email
}
output "vpc-output" {
  value = {
    name = google_compute_network.vpc-network.name
    id = google_compute_network.vpc-network.id
    self_link = google_compute_network.vpc-network.self_link
    project = google_compute_network.vpc-network.project
  }
}

output "vpc-subnet-output" {
  value = {
    name = google_compute_subnetwork.vpc-netwok-subnet.name
    cidr = google_compute_subnetwork.vpc-netwok-subnet.ip_cidr_range
    region = google_compute_subnetwork.vpc-netwok-subnet.region
  }
}

output "vpc-subnet2-output" {
  value = {
    name = google_compute_subnetwork.vpc-netwok-subnet2.name
    cidr = google_compute_subnetwork.vpc-netwok-subnet2.ip_cidr_range
    region = google_compute_subnetwork.vpc-netwok-subnet2.region
  }
}
