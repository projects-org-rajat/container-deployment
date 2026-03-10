variable "role_name" {
  type = string
}

variable "assume_role_service" {
  type = string
}

variable "policy_arns" {
  type = list(string)
}