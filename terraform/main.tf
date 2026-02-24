module "vpc" {
  source   = "./modules/vpc"
  app_name = var.app_name
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = var.ecr_repo_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.app_name}-eb-bucket"
}

module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

module "beanstalk" {
  source           = "./modules/beanstalk"
  app_name         = var.app_name
  environment      = var.environment
  instance_type    = var.instance_type
  instance_profile = module.iam.instance_profile
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.subnet.subnet_ids
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  app_name = var.app_name
}

module "routetable" {
  source   = "./modules/routetable"
  vpc_id   = module.vpc.vpc_id
  igw_id   = module.igw.igw_id
  app_name = var.app_name
}

module "association" {
  source          = "./modules/association"
  subnet_ids      = module.subnet.subnet_ids
  route_table_id  = module.routetable.route_table_id
}