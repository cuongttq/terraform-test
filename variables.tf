variable "user_name" {}
variable "tenant_name" {
    default = "Default"
}
variable "user_domain_name" {
    default = "Default"
}
variable "password" {}
variable "auth_url" {}
variable "region" {}

variable "external_network" {
    default = "provider-net" 
}

variable "image_id" {
    default = "cirros"
}