variable "project_id" {
    default = "learn-terraform-496012"
}
variable "region"{
    default = "asia-south1"

}
variable "zone"{
    default = "asia-south1-a"
}
variable "environment" {
    default = "dev"
}
variable "users" {
    default = ["keshav", "admin" , "devops" ]

}
variable "install_nginx" {
    default = true
}
variable "machine"{
    default = "e2-medium"
}