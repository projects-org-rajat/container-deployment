output "environment_url" {
  value = aws_elastic_beanstalk_environment.env.endpoint_url
}

output "environment_name" {
  value = aws_elastic_beanstalk_environment.env.name
}