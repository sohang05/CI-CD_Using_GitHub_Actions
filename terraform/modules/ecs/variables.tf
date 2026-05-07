variable "project_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "ecr_image_url" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}