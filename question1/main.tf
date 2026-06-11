resource "google_compute_instance" "vm-2" {
    name = "vm-1"
    machine_type = "e2-medium"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"

        }
    }
    network_interface {
        network = "default"
    }
}
import {
    to = google_compute_instance.vm-2 
    id = "projects/learn-terraform-496012/zones/us-central1-a/instances/vm-1"
}
