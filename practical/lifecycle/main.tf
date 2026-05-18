resource "random_id" "vm_suffix" {
  byte_length = 4
  keepers = {
    machine_type = "e2-medium"
  }
}

resource "google_compute_instance" "vm-1"{
    
    name  = "my-instance-${random_id.vm_suffix.hex}"
    machine_type = "e2-medium"
    zone =  "us-central1-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = "default"
    }

    lifecycle{
        # precondition {
        #     condition     = google_compute_network.vpc-1.id != null
        #     error_message = "Production only"
        # }
        create_before_destroy = true
    }

}
# resource "google_compute_network" "vpc-1"{
#     name = "vpc-1"
#     auto_create_subnetworks                   = true
# }

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.prod-db.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "prod-db" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }
  lifecycle {
    prevent_destroy = false
  }
  
}

