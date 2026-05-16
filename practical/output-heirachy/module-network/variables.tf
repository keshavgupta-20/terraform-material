variable "network-name" {
  type        = string
  description = "Name of the VPC network"
}

variable "subnet-name" {
  type        = string
  description = "Name of the subnet"
}

variable "cidr" {
  type        = string
  description = "CIDR range for the subnet"
  default     = "10.0.0.0/24"
}

variable "region" {
  type        = string
  description = "Region for the subnet"
}
