resource "google_compute_instance" "vm-1"{
    count = 3
    name = "web-${count.index}"
    machine_type = "e2-micro"
    network_interface {
        network = "default"
        access_config {

        }
    }
    boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

}
output "vm" {
    value = resource.google_compute_instance.vm-1[*].id
}