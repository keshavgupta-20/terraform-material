resource google_compute_instance "prod_vm" {
    name = "moved-lab-vm"
    machine_type = "e2-micro"
    zone  = "us-central1-b"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = "default"
        access_config  {
        
        }
    }

}

