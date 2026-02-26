variable "vpc_id" {
  description = "VPC where route table will be created"
  type        = string
}

variable "routes" {
  description = "List of routes"

  type = list(object({
    cidr_block = string
    gateway_id = optional(string)
    nat_gateway_id = optional(string)
  }))

  default = []
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}