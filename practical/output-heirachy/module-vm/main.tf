resource "google_compute_instance" "vm-instance" {
    name = var.vm-name
    zone = var.zone
    machine_type = "e2-micro"
    allow_stopping_for_update = true
    boot_disk {
        initialize_params{
         image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network    = var.network-name
        subnetwork = var.subnet-name
        access_config {}
    }
}