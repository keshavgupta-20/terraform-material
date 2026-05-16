variable "vpc-network-name" {
    type = string
    default = "vpc-network1"
    description = "creating vpc-networks"
}

variable "subnetwork-ip" {
    type = list(string)
    description = "list of subnetwork inside the vpc"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}