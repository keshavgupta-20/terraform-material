variable "vpc-creation" {
    type = string
    description = "vpc creating using the subnet"

}
variable "region" {
    type =string
    description ="vpc region"
    default = "us-central1"

}
variable "subnets" {
  type        = map(string)
  description = "A map of subnet names to their respective CIDR blocks"
}
variable "vm_config" {
  type = map(object({
    machine_type = string
    zone         = string
    subnet       = string
  }))
  default = {
    "web"   = { machine_type = "e2-small",      zone = "us-central1-a", subnet = "subnet-dev" }
    "api"   = { machine_type = "e2-medium",     zone = "us-central1-b", subnet = "subnet-test" }
    "batch" = { machine_type = "e2-standard-2", zone = "us-central1-c", subnet = "subnet-prod" }
    "cache" = { machine_type = "e2-micro",      zone = "us-central1-f", subnet = "subnet-stage" }
  }
}
variable "firewall_ports" {
  type        = set(string)
  default     = ["22", "80", "443", "8080"]
  description = "A set of TCP ports to allow through the dynamic firewall rule"
}


variable "firewall_rules" {
  type = map(object({
    environment = string
    port        = string
  }))
  default = {
    "allow-http-prod"  = { environment = "prod",    port = "80"   }
    "allow-ssh-prod"   = { environment = "prod",    port = "22"   }
    "allow-http-dev"   = { environment = "dev",     port = "80"   }
    "allow-db-staging" = { environment = "staging", port = "5432" }
  }
  
}


variable "module_vms" {
  type = map(object({
    machine_type = string
    zone         = string
    subnet       = string
  }))
  default = {
    "mod-web" = { machine_type = "e2-small",  zone = "us-central1-a", subnet = "subnet-dev"  }
    "mod-api" = { machine_type = "e2-medium", zone = "us-central1-b", subnet = "subnet-test" }
  }
  description = "Map of VM configurations passed to the reusable VM module"
}


variable "subnet_advanced" {
  type = map(object({
    cidr           = string
    region         = string
    private_access = bool
  }))
  default = {
    "subnet-app"  = { cidr = "10.1.1.0/24", region = "us-central1", private_access = true  }
    "subnet-db"   = { cidr = "10.1.2.0/24", region = "us-east1",    private_access = true  }
    "subnet-mgmt" = { cidr = "10.1.3.0/24", region = "us-west1",    private_access = false }
  }
  description = "Advanced subnet objects with CIDR, region, and private Google access flag"
}
