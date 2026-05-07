output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}