resource "aws_lb" "app" {
  name               = "prod-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]

  tags = {
    Name = "prod-alb"
  }
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.app.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.app.arn
  }
}
