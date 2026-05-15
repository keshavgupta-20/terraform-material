resource "google_compute_instance" "vm"{
    name = var.vm_name
    machine_type = var.machine_type
    # zone  = var.region
    zone = var.zone
    boot_disk {
         initialize_params {
            image = var.image
        }
    }
 
 network_interface{
    network = "default"
    }   
}