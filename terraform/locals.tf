locals {
  beanstalk_settings = {
    for k, v in var.beanstalk_envs : k => concat([
      
      # VPC configuration
      {
        namespace = "aws:ec2:vpc"
        name      = "VPCId"
        value     = module.vpc[v.vpc_key].vpc_id
      },
      {
        namespace = "aws:ec2:vpc"
        name      = "Subnets"
        value     = join(",", [for s in v.subnet_keys : module.subnet[s].subnet_id])
      },
      {
        namespace = "aws:ec2:vpc"
        name      = "ELBSubnets"
        value     = join(",", [for s in v.subnet_keys : module.subnet[s].subnet_id])
      },

      # Instance configuration
      {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "InstanceType"
        value     = "t3.micro"
      },
      {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = module.iam["beanstalk"].instance_profile
      },

      # Environment type
      {
        namespace = "aws:elasticbeanstalk:environment"
        name      = "EnvironmentType"
        value     = "LoadBalanced"
      },

      # Health check configuration
      {
        namespace = "aws:elasticbeanstalk:environment:process:default"
        name      = "HealthCheckPath"
        value     = "/"
      }

    ], v.settings)
  }
}