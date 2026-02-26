vpc_cidr = "10.0.0.0/16"
enable_dns_hostnames = true
tags = {
    Environment = "production"
    Project     = "beanstalk-container"
    }


subnets = {

  public-1 = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    public            = true
  }

  public-2 = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    public            = true
  }

  
}

bucket_name = "rajat-devops-bucket568632"

routes = [
  {
    cidr_block = "0.0.0.0/0"
  }
]

repository_name = "rajat-devops-app"

role_name= "newrolecreated"

beanstalk_settings = [

  {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.micro"
  }

]

platform = "arn:aws:elasticbeanstalk:ap-south-1::platform/Docker running on 64bit Amazon Linux 2023/4.9.3"

env_name = "rajat-devops-env"
app_name = "rajat-devops-app"
