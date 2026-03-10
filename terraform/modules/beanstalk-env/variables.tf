variable "settings" {

  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))

  default = []
}

variable "platform_arn" {
    type = string
  
}
variable "application_name" {
    type = string
  
}

variable "env_name" {
    type = string
  
}

