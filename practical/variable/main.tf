locals {
  machine_type = var.environment == "prod" ? var.machine_type["prod"] : var.machine_type["dev"]
}

resource "google_storage_bucket" "bucket" {
  count                       = 2
  name                        = "${var.project_id}-${count.index}"
  location                    = "US"
  force_destroy               = false
  uniform_bucket_level_access = true
}


resource "google_compute_firewall" "fw" {
  count         = length(var.tags)
  name          = tolist(var.tags)[count.index]
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
resource "google_compute_instance" "vm1" {
  count        = length(var.zones)
  name         = "vm-${count.index}"
  machine_type = local.machine_type
  zone         = var.zones[count.index]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true
}
