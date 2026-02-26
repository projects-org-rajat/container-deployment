variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for VPC"
  type        = map(string)
}


variable "subnets" {
  description = "Subnet definitions"

  type = map(object({
    cidr_block        = string
    availability_zone = string
    public            = bool
  }))
}

variable "bucket_name" {
  description = "Deployment bucket name"
  type        = string
}


variable "routes" {
  description = "Route definitions"

  type = list(object({
    cidr_block = string
    gateway_id = optional(string)
    nat_gateway_id = optional(string)
  }))

  default = []
}

variable "repository_name" {
  description = "ECR repository name"
  type        = string
}

variable "beanstalk_settings" {
  description = "Beanstalk configuration"

  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
}

variable "platform" {
  description = "Beanstalk platform"
  type        = string
  
}

variable "role_name" {
  
}
#-----------------------------------

variable "region" { 
    default = "ap-south-1" 
    description = "AWS deployment region"
    type = string
}
variable "app_name" {
    description = "name of the app"
    type = string
    default = "rajat-devops-app"
}
variable "env_name" {
    description = "name of the environment"
    type = string
    default = "rajat-devops-env"
}
variable "environment" {
    description = "deployment environment name"
    default = "prod" 
    type = string
}
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t3.micro" 
}
variable "ecr_repo_name" {
    description = "ECR repository name"
    type = string
    default = "rajat-devops-repo" 
}