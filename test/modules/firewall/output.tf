output "firewall" {
  value = {
    name    = google_compute_firewall.allow-ssh-practice.name
    network = google_compute_firewall.allow-ssh-practice.network
    allow   = google_compute_firewall.allow-ssh-practice.allow
  }
}