resource "aws_elastic_beanstalk_environment" "this" {

  name        = var.env_name
  application = var.application_name

  platform_arn = var.platform_arn

  dynamic "setting" {
    for_each = var.settings

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

}