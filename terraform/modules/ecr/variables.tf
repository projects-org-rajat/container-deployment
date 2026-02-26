variable "repository_name" {
  description = "Name of ECR repository"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "image_tag_mutability" {
  description = "Image tag mutability setting"
  type        = string
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Enable image vulnerability scanning"
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Delete repository even if images exist"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}