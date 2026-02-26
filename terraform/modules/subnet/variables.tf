variable "vpc_id" {
  description = "VPC where subnets will be created"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"

  type = map(object({
    cidr_block        = string
    availability_zone = string
    public            = bool
  }))
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}