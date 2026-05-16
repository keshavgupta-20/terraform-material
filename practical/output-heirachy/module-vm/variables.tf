variable "vm-name" {
    type = string
    description = "It is the name of vm"
}

variable "zone" {
    type = string
    description = "zone of the vm"
}

variable "network-name" {
    type        = string
    description = "VPC network to attach the VM to"
}

variable "subnet-name" {
    type        = string
    description = "Subnet to attach the VM to"
}