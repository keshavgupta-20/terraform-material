resource "google_compute_instance" "vm-1" {
  name         = "vm-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  network_interface {
    network = "default"
    access_config {}
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  metadata = {
    ssh-keys = "debian:${file(pathexpand("~/.ssh/id_ed25519.pub"))}"
  }

  lifecycle {
    ignore_changes = [
      machine_type
    ]
  }

  connection {
    type        = "ssh"
    user        = "debian"
    private_key = file(pathexpand("~/.ssh/id_ed25519"))
    host        = self.network_interface[0].access_config[0].nat_ip
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx"
    ]
  }
}