output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = data.aws_region.current.region
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "launch_template_id" {
  value = aws_launch_template.app.id
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.address
}
