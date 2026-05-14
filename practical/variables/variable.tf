variable "region_resource" {
    type = string
    description = "Ec2 instance type for the web server"
    default = "us-central1"

}

variable "machine_type" {
    type = string
    description = "machine type we can use"
    default = "micro"
    validation {
      condition     = contains(["micro", "small", "medium", "large"], var.machine_type)
      error_message = "The machine_type variable must be one of 'micro', 'small', 'medium', or 'large'."
    }
}

