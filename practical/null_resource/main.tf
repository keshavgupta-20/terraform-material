resource "google_compute_instance" "vm-1" {
    name = "vm-1"
    machine_type = "e2-medium"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        
    }

}