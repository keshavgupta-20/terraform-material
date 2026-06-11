variable "project_id" {
  type    = string
  default = "learn-terraform-496012"
}

variable "disk_size" {
  type    = number
  default = 50
  validation {
    condition     = var.disk_size > 20
    error_message = "disk should be greater than 20"
  }
}



variable "enable_public_ip" {
  type    = bool
  default = true
}
variable "zones" {
  type = list(string)
  default = [
    "us-central1-a",
    "us-central1-b"
  ]
}
variable "tags" {
  type = set(string)
  default = [
    "dev",
    "web",
    "dev"
  ]
}
variable "metadata" {
  type = map(string)
  default = {
    owner = "keshav"
    env   = "dev"
  }
}
variable "machine_type" {
  type = map(string)
  default = {
    dev  = "e2-micro"
    prod = "e2-medium"
  }
}
variable "environment" {
  type    = string
  default = "dev"
}

