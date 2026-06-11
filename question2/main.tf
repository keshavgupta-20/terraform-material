resource "google_compute_instance" "vm-1" {
    name = "vm-1"
    machine_type = "e2-micro"
    network_interface {
        network = "default"
    }
    boot_disk {
        initialize_params {
            image  = "debian-cloud/debian-12"

        }
    }
    zone = "us-central1-a"
    
}
resource "google_compute_network" "vpc-1"{
    name = "vpc-1"
}
import {
    to = google_compute_instance.vm-1
    id= "projects/learn-terraform-496012/zones/us-central1-a/instances/vm-1"  
}