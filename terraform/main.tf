module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = var.tags
}

module "subnet"{
  source = "./modules/subnet"

  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
  tags    = var.tags
}




module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
  tags        = var.tags
}



module "routetable" {
  source   = "./modules/routetable"
  vpc_id = module.vpc.vpc_id

  routes = local.routes

  tags = var.tags
}


module "igw" {
  source   = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}


module "ecr" {
  source    = "./modules/ecr"
  repository_name = var.repository_name
  environment     = var.environment
  tags            = var.tags
}

module "iam" {
  source   = "./modules/iam"
  app_name = var.role_name
}

module "beanstalk" {
  source           = "./modules/beanstalk"
  app_name         = var.app_name
  env_name         = var.env_name
  platform         = var.platform
  instance_profile = module.iam.instance_profile
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.subnet.subnet_ids
  settings = local.beanstalk_settings
  tags             = var.tags
}
module "association" {
  source          = "./modules/association"
  subnets = module.subnet.subnets
  route_table_id  = module.routetable.route_table_id
}
