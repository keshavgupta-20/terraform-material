variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for resources"
  type        = string
  default     = "us-central1-a"
}

variable "credentials_file" {
  description = "Path to the GCP service account credentials JSON file"
  type        = string
  sensitive   = true
}

variable "network_name" {
  description = "Name of the existing VPC network to reference"
  type        = string
}

variable "subnets" {
  description = "Map of subnet names to their CIDR ranges"
  type        = map(string)
  default = {
    "dev-subnet"  = "10.0.2.0/24"
    "prod-subnet" = "10.0.3.0/24"
    "qa-subnet"   = "10.0.4.0/24"
  }
}
