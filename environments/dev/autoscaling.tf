# LB Target Group
resource "aws_lb_target_group" "app" {
  name     = "dev-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
  }

  tags = {
    Name = "dev-app-tg"
  }
}


resource "aws_autoscaling_group" "app" {

  name = "dev-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id
  ]

  target_group_arns = [
    aws_lb_target_group.app.arn
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "dev-app-instance"
    propagate_at_launch = true
  }
}

