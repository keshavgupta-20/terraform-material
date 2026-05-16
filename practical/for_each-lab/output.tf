# ---------------------------------------------------------------
# LAB 8 — Outputs with for_each
# All outputs use for expressions to produce map-format results
# ---------------------------------------------------------------

# All VM names from the direct google_compute_instance resource
output "vm_names" {
  description = "Map of all VM names keyed by VM identifier"
  value       = { for k, v in google_compute_instance.vm-create : k => v.name }
}

# All VM internal IPs from the direct google_compute_instance resource
output "vm_internal_ips" {
  description = "Map of all VM internal IPs keyed by VM identifier"
  value       = { for k, v in google_compute_instance.vm-create : k => v.network_interface[0].network_ip }
}

# All subnet names from the basic vpc_subnets resource
output "subnet_names" {
  description = "Map of all subnet names keyed by subnet identifier"
  value       = { for k, v in google_compute_subnetwork.vpc_subnets : k => v.name }
}

# Lab 7 — Module VM names (addresses module outputs via for expression)
output "module_vm_names" {
  description = "Map of VM names created by the reusable VM module"
  value       = { for k, v in module.vm_instances : k => v.vm_name }
}

# Lab 7 — Module VM internal IPs
output "module_vm_internal_ips" {
  description = "Map of internal IPs of VMs created by the reusable VM module"
  value       = { for k, v in module.vm_instances : k => v.vm_internal_ip }
}

# Lab 9 — Advanced subnet names with private access flag
output "advanced_subnet_info" {
  description = "Map of advanced subnet names and their private Google access setting"
  value       = { for k, v in google_compute_subnetwork.advanced_subnets : k => { name = v.name, private_access = v.private_ip_google_access } }
}
