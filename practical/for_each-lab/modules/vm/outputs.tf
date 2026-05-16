output "vm_name" {
  description = "The name of the created VM"
  value       = google_compute_instance.vm.name
}

output "vm_internal_ip" {
  description = "The internal IP address of the VM"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "vm_id" {
  description = "The ID of the VM instance"
  value       = google_compute_instance.vm.id
}
