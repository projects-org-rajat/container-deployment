variable "name" {}
variable "cidr_block" {}
variable "availability_zone" {}
variable "vpc_id" {}
variable "public_ip" {
    default = true  
    type = bool
  
}