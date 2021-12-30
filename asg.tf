resource "aws_launch_configuration" "web-launch-configuration" {
  name   = "${var.resource_prefix}-WEB-LAUNCH-CONFIGURATION"
  image_id      = data.aws_ami.amazon-nginx.id
  instance_type = var.web_instance_type

  key_name = var.instance_key_pair_name

  associate_public_ip_address = false
  security_groups = [aws_security_group.web-lc-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo amazon-linux-extras install -y nginx1
              sudo service nginx start
              EOF
}

resource "aws_autoscaling_group" "web-autoscaling-group" {
  name = "${var.resource_prefix}-WEB-AUTO-SCALING"
  launch_configuration = aws_launch_configuration.web-launch-configuration.name
  vpc_zone_identifier = [aws_subnet.tier-web-private-subnet-1.id, aws_subnet.tier-web-private-subnet-2.id]

  force_delete = true

  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.resource_prefix}-WEB-ASG-EC2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "web-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.web-autoscaling-group.id
  alb_target_group_arn   = aws_lb_target_group.web-alb-target-group.arn
}

resource "aws_launch_configuration" "was-launch-configuration" {
  name   = "${var.resource_prefix}-WAS-LAUNCH-CONFIGURATION"
  image_id      = data.aws_ami.tomcat-was.id
  instance_type = var.was_instance_type

  key_name = var.instance_key_pair_name

  associate_public_ip_address = false
  security_groups = [aws_security_group.was-lc-sg.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo systemctl start tomcat
            EOF
}

resource "aws_autoscaling_group" "was-autoscaling-group" {
  name = "${var.resource_prefix}-WAS-AUTO-SCALING"
  launch_configuration = aws_launch_configuration.was-launch-configuration.name
  vpc_zone_identifier = [aws_subnet.tier-was-private-subnet-1.id, aws_subnet.tier-was-private-subnet-2.id]

  force_delete = true

  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.resource_prefix}-WAS-ASG-EC2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "was-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.was-autoscaling-group.id
  alb_target_group_arn   = aws_lb_target_group.was-alb-target-group.arn
}
