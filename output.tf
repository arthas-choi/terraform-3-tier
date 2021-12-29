output "subnet_web_ids" {
  value = [aws_subnet.tier-public-subnet-1.id, aws_subnet.tier-public-subnet-2.id]
  description = "Public Subnet ID List"
}

output "web-sg-id" {
  value = aws_security_group.web-lc-sg.id
  description = "Bastion Security Group id"
}

output "bastion_public_ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "Bastion Public IP Address"
}

output "web_alb_dns" {
  value = aws_lb.web-alb.dns_name
  description = "WEB ALB DNS Name"
}

output "was_alb_dns" {
  value = aws_lb.was-alb.dns_name
  description = "WAS ALB DNS Name"
}
