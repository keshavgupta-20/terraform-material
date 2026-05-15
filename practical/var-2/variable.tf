variable "region" {
    type = string
    description = "GCP region"
    default = "us-central"

}
variable "zone"{
    type = string
    description = "Gcp zone"
    validation {
      condition = (var.zone == "us-central1-a")
      error_message = "zone wrong put"

    }
    default = "us-central1-a"

}
variable "vm_name"{
    type = string
    description = "VM name"
    validation {
      condition = length(var.vm_name) >=3 && length(var.vm_name) <20
      error_message = "wrong vm name"
    }
}
variable "machine_type" {
    type = string
    description = "VM Machine type"
    default = "e2-micro"
     validation {
    condition = contains(
      ["e2-micro", "e2-small", "e2-medium"],
      var.machine_type
    )

    error_message = "Allowed machine types: e2-micro, e2-small, e2-medium"
  }
}
variable "image" {
  type        = string
  description = "Boot disk image"
  default = "debian-cloud/debian-12"
}
