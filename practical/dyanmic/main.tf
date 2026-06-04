variable "ports" {
    type = map(string)
    default = {
        "80" = "tcp"
        "443" = "udp"
        "8080" = "tcp"
    }
}
resource "google_compute_firewall" "default" {
    name = "test-firewall"
   network = data.google_compute_network.vpc_network.name
    dynamic "allow" {
        for_each = var.ports
        content {
            protocol = allow.value
            ports    = [allow.key]

        }
    }
    source_tags = ["web"]
}
data "google_compute_network" "vpc_network" {
    name = "default"
}





