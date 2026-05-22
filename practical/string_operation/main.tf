resource "google_compute_instance" "vm" {
    name = local.vm_name
    machine_type=  var.machine
    zone = var.zone
    boot_disk {
        initialize_params{
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = "default"
        access_config {

        }
    }
    allow_stopping_for_update = true
    metadata_startup_script = replace(<<-EOF
        ${local.startup_script}

        echo "${local.welcome_mesg}"
        ${local.install_block}
        ${local.user_config}

        EOF
    , "\r\n", "\n")

}



