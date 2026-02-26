variable "vpc_id" {
  description = "VPC ID where Internet Gateway will be attached"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}