output "project" {

 value = var.project_id

}

output "disk" {

 value = var.disk_size

}

output "public_ip_enabled" {

 value = var.enable_public_ip

}

output "first_zone" {

 value = var.zones[0]

}

output "first_tag" {

 value = tolist(var.tags)[0]

}

output "owner" {

 value = var.metadata.owner

}

output "machine_type" {

 value = local.machine_type

}