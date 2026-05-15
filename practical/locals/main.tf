resource "google_compute_instance" "vm-1"{
    name = local.resource_name
    machine_type = var.machine_type
    zone = var.zone
    boot_disk{
         initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
     network_interface {

    network = "default"
     }
    labels = local.common_labels
    metadata  = {
        monitoring = tostring(local.monitoring_Enabled)
        subnet_name = local.primary_subnet
        subnet_count = tostring(local.subnet_count)
    }
    

}