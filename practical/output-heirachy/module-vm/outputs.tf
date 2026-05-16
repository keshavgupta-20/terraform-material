output "vm-detail" {
    value = {
        name         = google_compute_instance.vm-instance.name
        id           = google_compute_instance.vm-instance.id
        zone         = google_compute_instance.vm-instance.zone
        machine_type = google_compute_instance.vm-instance.machine_type
        nat_ip       = google_compute_instance.vm-instance.network_interface[0].access_config[0].nat_ip
        internal_ip  = google_compute_instance.vm-instance.network_interface[0].network_ip
        network      = google_compute_instance.vm-instance.network_interface[0].network
        subnetwork   = google_compute_instance.vm-instance.network_interface[0].subnetwork
        status       = google_compute_instance.vm-instance.current_status
        self_link    = google_compute_instance.vm-instance.self_link
    }
}

