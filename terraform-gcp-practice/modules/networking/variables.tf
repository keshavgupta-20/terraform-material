variable "network-name"{
    type = string
}
variable "subnetworks" {
    type = map(string)
}
variable "region" {
    type = string
}
variable "firewall-name" {
    type = string
}

variable "port-mapping" {
    type = map(object({
        protocol = string
        port     = string
    }))
    
}