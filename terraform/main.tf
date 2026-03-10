module "vpc" {
  source = "./modules/vpc"
  for_each = var.vpcs

  name       = each.value.name
  cidr_block = each.value.cidr_block
}

module "subnet" {
  source = "./modules/subnet"
  for_each = var.subnets

  name       = each.value.name
  cidr_block = each.value.cidr_block
  vpc_id = module.vpc[each.value.vpc_key].vpc_id
  availability_zone = each.value.az
  public_ip = each.value.public_ip
}

module "s3" {
  source = "./modules/s3"
  for_each = var.s3_buckets

  bucket_name = each.value.bucket_name
  force_destroy = each.value.force_destroy
  versioning  = each.value.versioning
  environment = each.value.environment
  tags        = each.value.tags
}

module "igw" {
  source = "./modules/igw"
  for_each = var.igws

  name = each.value.name
  vpc_id = module.vpc[each.value.vpc_key].vpc_id
  tags = each.value.tags
}

module "ecr" {
  source = "./modules/ecr"
  for_each = var.ecr_repositories

  repository_name      = each.value.repository_name
  image_tag_mutability = each.value.image_tag_mutability
  scan_on_push         = each.value.scan_on_push
  force_delete = each.value.force_delete
  tags                 = each.value.tags
}

module "iam" {
  source = "./modules/iam"
  for_each = var.iam_roles

  role_name           = each.value.role_name
  assume_role_service = each.value.service
  policy_arns         = each.value.policies
}

module "routetable" {
  source = "./modules/routetable"
  for_each = var.route_tables

  name   = each.value.name
  vpc_id = module.vpc[each.value.vpc_key].vpc_id
  igw_id = module.igw[each.value.igw_key].igw_id

  tags = lookup(each.value, "tags", {})
}

module "association" {
  source = "./modules/association"
  for_each = var.route_associations

  subnet_id = module.subnet[each.value.subnet_key].subnet_id
  route_table_id = module.routetable[each.value.route_table_key].route_table_id
}

module "beanstalk" {
  source = "./modules/beanstalk"
  for_each = var.beanstalk_apps

  app_name    = each.value.name
  description = each.value.description
}

module "beanstalk_env" {
  source = "./modules/beanstalk-env"
  for_each = var.beanstalk_envs

  env_name         = each.value.env_name
  application_name = module.beanstalk[each.value.app_key].app_name
  platform_arn = each.value.platform_arn
  settings = local.beanstalk_settings[each.key]
}