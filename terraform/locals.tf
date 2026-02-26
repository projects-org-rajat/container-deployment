locals {

  beanstalk_settings = concat(
    var.beanstalk_settings,

    [
      {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = module.iam.instance_profile
      },
      {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "InstanceType"
        value     = "t3.micro"
      },


      {
        namespace = "aws:ec2:vpc"
        name      = "VPCId"
        value     = module.vpc.vpc_id
      },

      {
        namespace = "aws:ec2:vpc"
        name      = "Subnets"
        value     = join(",", module.subnet.subnet_ids)
      }
    ]
  )
}