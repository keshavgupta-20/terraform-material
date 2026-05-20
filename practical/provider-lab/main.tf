resource "google_compute_network" "vpc" {
    name = "vpc-1"
    auto_create_subnetworks = false

}
resource "google_compute_subnetwork" "subnet-1"{
    name = "basic-network"
    region = "us-central1"
    network = google_compute_network.vpc.id
    ip_cidr_range = "10.0.1.0/24"
}


resource "google_compute_instance" "vm-1"{
    name = "vm-2"
    zone = "us-central1-a"
    machine_type = "e2-micro"
    boot_disk{
        initialize_params {
            image = "debian-cloud/debian-12"
        }

    }
    network_interface {
        network = google_compute_network.vpc.id
        subnetwork = google_compute_subnetwork.subnet-1.id
    }
}
# removed {
#     from  = google_compute_instance.vm-1
#     lifecycle {
#         destroy = false
#     }
# }

