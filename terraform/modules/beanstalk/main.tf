resource "aws_elastic_beanstalk_application" "app" {
  name = var.app_name

  tags = var.tags
}

resource "aws_elastic_beanstalk_environment" "env" {

  name                = var.env_name
  application         = aws_elastic_beanstalk_application.app.name
  platform_arn = var.platform

  dynamic "setting" {
    for_each = var.settings

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

  tags = var.tags
}