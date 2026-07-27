data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# LT
resource "aws_launch_template" "app" {

  name_prefix = "dev-launch-template-"

  image_id = data.aws_ssm_parameter.amazon_linux_ami.value

  instance_type = "t3.micro"

  key_name = "fittrack-key"

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2.name
  }

  user_data = base64encode(
    file("${path.module}/user-data.sh")
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "dev-app-instance"
    }
  }
}
