data "google_compute_network" "vpc-1" {
    name = "vpc-frontend"
}
output "vpc-output" {
    value = {
        vpc_detail =  data.google_compute_network.vpc-1
     
    } 
}



variable "project_id" {
  default = "learn-terraform-496012"
}

variable "zone" {
  default = "us-central1-a"
}

variable "vm_name" {
  default = "vm-1"
}

resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
   allow_stopping_for_update = true

}

import {
  to = google_compute_instance.vm
  id = "projects/${var.project_id}/zones/${var.zone}/instances/${var.vm_name}"
}