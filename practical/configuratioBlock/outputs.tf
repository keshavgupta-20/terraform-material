output "network_name" {
  description = "The name of the referenced VPC network"
  value       = data.google_compute_network.vpc.name
}

output "network_self_link" {
  description = "The self link of the referenced VPC network"
  value       = data.google_compute_network.vpc.self_link
}

output "subnet_names" {
  description = "The names of all created subnets"
  value       = { for k, v in google_compute_subnetwork.network-with : k => v.name }
}

output "subnet_self_links" {
  description = "The self links of all created subnets"
  value       = { for k, v in google_compute_subnetwork.network-with : k => v.self_link }
}

output "subnet_cidr_ranges" {
  description = "The CIDR ranges of all created subnets"
  value       = { for k, v in google_compute_subnetwork.network-with : k => v.ip_cidr_range }
}
