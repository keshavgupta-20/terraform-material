# Lab 6 — Filter only production firewall rules from the full firewall_rules map
locals {
  prod_firewall_rules = {
    for name, rule in var.firewall_rules :
    name => rule
    if rule.environment == "prod"
  }
}
