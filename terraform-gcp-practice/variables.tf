variable "region"{
    type = string
}
variable "zone" {
    type = string
}
variable "projectid"{
    type =string
}
variable "network-name"{
    type = string
}
variable "subnet-name"{
    type = map(string)
}

variable "port-protocol"{
    type = map(object({
        protocol = string
        port     = string
    }))
}
variable "env"{
    type = list(string)
}
variable "firewall-name"{
    type =string
}
variable "app-name" {
    type = string
    
}