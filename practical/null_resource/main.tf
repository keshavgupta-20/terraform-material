resource "google_compute_instance" "vm-1" {
    name = "vm-1"
    machine_type = "e2-medium"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    metadata = {
    ssh-keys = "debian:${file(pathexpand("~/.ssh/id_ed25519.pub"))}"
  }
    network_interface {
        network = "default"
        access_config {}
    }
    
}
resource "null_resource" "notify"{
    depends_on = [google_compute_instance.vm-1]
   
        connection {
        type = "ssh"
        user =  "debian"
        private_key = file(pathexpand("~/.ssh/id_ed25519"))
        host        = google_compute_instance.vm-1.network_interface[0].access_config[0].nat_ip
        timeout     = "5m"
    }
    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update -y",
            "sudo apt-get install nginx -y",
            "sleep 20",
            "sudo systemctl enable nginx",
            "sudo systemctl start nginx"
        ]
    }
    
}