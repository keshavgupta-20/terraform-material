locals {
  # Common labels applied to all resources
  common_labels = {
    project     = var.project_id
    region      = var.region
    managed_by  = "terraform"
  }

  # Shortcut to avoid repeating the long data source reference
  vpc_id = data.google_compute_network.vpc.id

  # Subnets enriched with full metadata — useful for outputs or future modules
  subnet_details = {
    for name, cidr in var.subnets : name => {
      cidr   = cidr
      region = var.region
      vpc_id = data.google_compute_network.vpc.id
    }
  }
}
