# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "google_compute_instance" "raghav" {
  allow_stopping_for_update  = null
  can_ip_forward             = false
  deletion_protection        = false
  description                = null
  desired_status             = null
  enable_display             = false
  hostname                   = null
  key_revocation_action_type = "NONE"
  labels                     = {}
  machine_type               = "e2-medium"
  metadata = {
    enable-osconfig = "TRUE"
  }
  metadata_startup_script = null
  name                    = "instance-2"
  project                 = "learn-terraform-496012"
  resource_policies       = []
  tags                    = []
  zone                    = "us-central1-a"
  boot_disk {
    auto_delete                     = true
    device_name                     = "instance-2"
    disk_encryption_key_raw         = null # sensitive
    disk_encryption_key_rsa         = null # sensitive
    disk_encryption_service_account = null
    force_attach                    = false
    guest_os_features               = ["UEFI_COMPATIBLE", "VIRTIO_SCSI_MULTIQUEUE", "GVNIC", "SEV_CAPABLE", "SEV_LIVE_MIGRATABLE_V2"]
    interface                       = null
    mode                            = "READ_WRITE"
    source                          = "https://www.googleapis.com/compute/v1/projects/learn-terraform-496012/zones/us-central1-a/disks/instance-2"
    initialize_params {
      architecture                = "X86_64"
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20260528"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      replica_zones               = []
      resource_manager_tags       = {}
      resource_policies           = ["https://www.googleapis.com/compute/v1/projects/learn-terraform-496012/regions/us-central1/resourcePolicies/default-schedule-1"]
      size                        = 10
      storage_pool                = null
      type                        = "pd-balanced"
    }
  }
  confidential_instance_config {
    confidential_instance_type  = null
    enable_confidential_compute = false
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    network                     = "https://www.googleapis.com/compute/v1/projects/learn-terraform-496012/global/networks/default"
    network_ip                  = "10.128.0.25"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/learn-terraform-496012/regions/us-central1/subnetworks/default"
    subnetwork_project          = "learn-terraform-496012"
    access_config {
      nat_ip                 = "35.253.161.155"
      network_tier           = "PREMIUM"
      public_ptr_domain_name = null
    }
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    automatic_restart           = true
    availability_domain         = 0
    instance_termination_action = null
    min_node_cpus               = 0
    on_host_maintenance         = "MIGRATE"
    preemptible                 = false
    provisioning_model          = "STANDARD"
    termination_time            = null
  }
  service_account {
    email  = "58384525866-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
}
