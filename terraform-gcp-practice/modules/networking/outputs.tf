output "vpc-networks" {
    value = {
        name = google_compute_network.vpc-network.name
    }
}

output "firewall_summary" {
  value = {
    firewall_names = [
      for rule in google_compute_firewall.firewall_rule :
      rule.name
    ]

    protocols = [
      for rule in google_compute_firewall.firewall_rule :
      one(rule.allow).protocol
    ]

    total_rules = length(google_compute_firewall.firewall_rule)

    all_ports = flatten([
      for rule in google_compute_firewall.firewall_rule :
      one(rule.allow).ports
    ])
  }
}
output "subnetworks" {
    value = [
        for subnet in google_compute_subnetwork.subnetwork :
            "${subnet.name} -> ${subnet.ip_cidr_range}"
    ]

}