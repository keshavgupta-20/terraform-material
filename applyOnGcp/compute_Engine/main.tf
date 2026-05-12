resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  machine_type = "e2-medium"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "custom-subnetworks"
    subnetwork = "default-subnet"
  }
  allow_stopping_for_update = true
  labels = {
    "env" = "dev"
  }
}
