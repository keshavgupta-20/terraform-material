resource "google_compute_firewall" "allow-ssh-practice" {
    network = var.vpc-network
    name = var.firewall_name
    allow {
        protocol = "tcp"
        ports = ["22", ""]
    }
    direction = "INGRESS"
    source_ranges= ["0.0.0.0/0"]
}