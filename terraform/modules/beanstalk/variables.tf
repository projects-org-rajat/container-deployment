
variable "app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "env_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "platform" {
  description = "Beanstalk platform"
  type        = string
}

variable "instance_profile" {
  description = "EC2 instance profile"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for Beanstalk"
  type        = list(string)
}

variable "settings" {
  description = "Beanstalk environment settings"

  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))

  default = []
}

variable "tags" {
  description = "Tags for Beanstalk environment"
  type        = map(string)
  default     = {}
}