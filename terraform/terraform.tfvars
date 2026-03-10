#----------VPC----------
vpcs = {
  prod = {
    name       = "prod-vpc"
    cidr_block = "10.0.0.0/16"
  }

  dev = {
    name       = "dev-vpc"
    cidr_block = "10.1.0.0/16"
  }

}

#----------Subnet------------
subnets = {
  prod-public-1 = {
    name       = "prod-public-1"
    cidr_block = "10.0.1.0/24"
    az         = "ap-south-1a"
    vpc_key    = "prod"
    public_ip  = true
  }

  prod-public-2 = {
    name       = "prod-public-2"
    cidr_block = "10.0.2.0/24"
    az         = "ap-south-1c"
    vpc_key    = "prod"
    public_ip  = true
  }

  dev-public-1 = {
    name       = "dev-public-1"
    cidr_block = "10.1.1.0/24"
    az         = "ap-south-1b"
    vpc_key    = "dev"
    public_ip  = true
  }

}

#---------S3---------------
s3_buckets = {

  beanstalk_bucket = {
    bucket_name = "rajat-devops-bucket568632"
    versioning  = true
    force_destroy = true
    environment = "prod"

    tags = {
      project = "logging"
      owner   = "devops"
    }
  }
}

#----------IGW----------
igws = {

  prod_igw = {
    name    = "prod-igw"
    vpc_key = "prod"

    tags = {
      environment = "production"
    }
  }

  dev_igw = {
    name    = "dev-igw"
    vpc_key = "dev"

    tags = {
      environment = "development"
    }
  }

}

#---------ECR-------------
ecr_repositories = {

  backend = {
    repository_name      = "backend-service"
    image_tag_mutability = "MUTABLE"
    scan_on_push         = true
    force_delete  = true

    tags = {
      environment = "prod"
      team        = "backend"
    }
  }

  frontend = {
    repository_name      = "frontend-service"
    image_tag_mutability = "IMMUTABLE"
    scan_on_push         = true
    force_delete = true

    tags = {
      environment = "prod"
      team        = "frontend"
    }
  }

}

#-----------iam_roles--------
iam_roles = {

  beanstalk = {
    role_name = "myapp-eb-role"
    service   = "ec2.amazonaws.com"

    policies = [
      "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
      "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
      "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
      "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    ]
  }

}

#------------routes_table----------
route_tables = {

  public = {
    name    = "public-rt"
    vpc_key = "prod"
    igw_key = "prod_igw"

    tags = {
      environment = "production"
    }
  }

}

#---------association----------
route_associations = {

  public1 = {
    subnet_key      = "prod-public-1"
    route_table_key = "public"
  }

  public21 = {
    subnet_key      = "prod-public-2"
    route_table_key = "public"
  }

}

#------beanstalk-------------
beanstalk_apps = {

  app1 = {
    name        = "myapp"
    description = "main application"
  }

}

#--------beanstalk_env----------
beanstalk_envs = {

  dev = {

    env_name = "myapp-dev"

    app_key = "app1"

    platform_arn = "arn:aws:elasticbeanstalk:ap-south-1::platform/Docker running on 64bit Amazon Linux 2023/4.9.3"

    vpc_key = "prod"

    subnet_keys = [
      "prod-public-1", "prod-public-2"
    ]
    instance_profile_key = ""
    settings = [

      {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "InstanceType"
        value     = "t3.micro"
      },
    ]
  }
}
