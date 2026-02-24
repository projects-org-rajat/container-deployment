variable "app_name" {}
variable "environment" {}
variable "instance_type" {}
variable "instance_profile" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}