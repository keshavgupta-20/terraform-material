variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
}

variable "zone" {
  description = "GCP zone where the VM will be created"
  type        = string
}

variable "network_id" {
  description = "The VPC network ID to attach the VM to"
  type        = string
}

variable "subnetwork_id" {
  description = "The subnetwork ID to attach the VM to"
  type        = string
}
