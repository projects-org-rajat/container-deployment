#------provider_region---------
variable "region" {
  default     = "ap-south-1"
  description = "AWS deployment region"
  type        = string
}

#------vpc_variable----------
variable "vpcs" {
  type = map(object({
    name       = string
    cidr_block = string
  }))
}


#---------subnet_variable-------
variable "subnets" {
  type = map(object({
    name       = string
    cidr_block = string
    az         = string
    vpc_key    = string
    public_ip  = bool
  }))
}

#-------s3_bucket_variable--------
variable "s3_buckets" {
  description = "Map of S3 buckets"

  type = map(object({
    bucket_name = string
    versioning  = bool
    environment = string
    force_destroy = bool
    tags        = map(string)
  }))
}

#--------igw_variable-----------

variable "igws" {
  description = "Internet gateways"

  type = map(object({
    name    = string
    vpc_key = string
    tags    = map(string)
  }))
}

variable "ecr_repositories" {
  description = "Map of ECR repositories"

  type = map(object({
    repository_name      = string
    image_tag_mutability = string
    scan_on_push         = bool
    force_delete  = bool
    tags                 = map(string)
  }))
}

#--------iam_role_variable------------

variable "iam_roles" {
  type = map(object({
    role_name = string
    service   = string
    policies  = list(string)
  }))
}

#--------route_table_variable--------
variable "route_tables" {
  type = map(object({
    name    = string
    vpc_key = string
    igw_key = string
    tags    = optional(map(string))
  }))
}

#-------subnet_Association_variable------
variable "route_associations" {
  type = map(object({
    subnet_key      = string
    route_table_key = string
  }))
}


#--------beanstalk----------
variable "beanstalk_apps" {

  type = map(object({
    name        = string
    description = string
  }))

}

variable "beanstalk_envs" {

  type = map(object({

    env_name       = string
    app_key        = string
    platform_arn = string
    vpc_key        = string
    subnet_keys    = list(string)

    settings = list(object({
      namespace = string
      name      = string
      value     = string
    }))

  }))

}