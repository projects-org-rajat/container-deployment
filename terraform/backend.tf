terraform {
  backend "s3" {
    bucket         = "rajat7014"
    key            = "beanstalk/terraform.tfstate"
    region         = "ap-south-1"
    
    encrypt        = true
  }
}