variable "vpc_id" {
  description = "VPC where route table will be created"
  type        = string
}

variable "name" {
  type = string
}

variable "igw_id" {
  type    = string
  default = null
}


variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}