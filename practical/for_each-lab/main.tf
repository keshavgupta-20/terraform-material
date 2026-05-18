resource "google_compute_network" "custom_vpc" {
    name = var.vpc-creation
     auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnets" {
  for_each      = var.subnets
  
  name          = each.key    
  ip_cidr_range = each.value  
  region        = var.region
  network       = google_compute_network.custom_vpc.id
}
resource "google_compute_instance" "vm-create" {
    for_each = var.vm_config
    name = each.key
    machine_type = each.value.machine_type
    zone = each.value.zone

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-12"
      }
    }

    network_interface {
      network    = google_compute_network.custom_vpc.id
      subnetwork = google_compute_subnetwork.vpc_subnets[each.value.subnet].id
    }
}
resource "google_compute_firewall" "multiport_firewall" {
  name    = "test-firewall-dynamic"
  network = google_compute_network.custom_vpc.name

  
  dynamic "allow" {
    for_each = var.firewall_ports
    content {
      protocol = "tcp"
      ports    = [allow.value] 
    }
  }

  
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "prod_firewall" {
  for_each = local.prod_firewall_rules   

  name    = each.key                    
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = [each.value.port]        
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["env-prod"]
}


module "vm_instances" {
  for_each = var.module_vms
  source   = "./modules/vm"

  vm_name       = each.key                                                      
  machine_type  = each.value.machine_type
  zone          = each.value.zone
  network_id    = google_compute_network.custom_vpc.id
  subnetwork_id = google_compute_subnetwork.vpc_subnets[each.value.subnet].id
}

# ---------------------------------------------------------------
# LAB 9 — Advanced Nested Object Iteration
# var.subnet_advanced is a map of objects with cidr, region, private_access
# for_each iterates over each object and uses each.value.<field> for config
# ---------------------------------------------------------------
resource "google_compute_subnetwork" "advanced_subnets" {
  for_each = var.subnet_advanced

  name                     = each.key              # subnet name from map key
  ip_cidr_range            = each.value.cidr       # CIDR block
  region                   = each.value.region     # region per subnet
  network                  = google_compute_network.custom_vpc.id
  private_ip_google_access = each.value.private_access  # boolean flag
}

resource "google_compute_disk" "vm_disk" {
  for_each = var.vm_config
  name     = "${each.key}-disk"
  zone     = each.value.zone
  type     = "pd-standard"
  size     = 50
}

resource "google_compute_attached_disk" "disk_attachment" {
  for_each = var.vm_config

  instance = google_compute_instance.vm-create[each.key].id  # Targets the specific VM ID
  disk     = google_compute_disk.vm_disk[each.key].id        # Targets the matching disk ID
  zone     = each.value.zone                                  # Attaches within the correct zone
}