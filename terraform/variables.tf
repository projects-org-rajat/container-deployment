variable "region" { 
    default = "ap-south-1" 
}
variable "app_name" {
    default = "rajat-devops-app"
}
variable "environment" {
    default = "prod" 
}
variable "instance_type" {
    default = "t3.micro" 
}
variable "ecr_repo_name" {
    default = "rajat-devops-repo" 
}