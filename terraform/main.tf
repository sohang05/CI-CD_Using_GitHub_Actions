module "ecr" {
  source          = "terraform-aws-modules/ecr/aws"
  repository_name = var.repo_name

  repository_lifecycle_policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire untagged images older than 30 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 30
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
}

module "ecs" {
  source = "./modules/ecs"

  project_name   = var.project_name
  container_port = var.container_port
  ecr_image_url  = var.ecr_image_url

  vpc_id            = module.networking.vpc_id
  subnet_ids        = module.networking.subnet_ids
  security_group_id = module.networking.security_group_id

  target_group_arn = module.networking.target_group_arn
}
