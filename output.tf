output "subnet-web-ids" {
  value = [aws_subnet.tier-public-subnet-1.id, aws_subnet.tier-public-subnet-2.id]
  description = "Public Subnet ID List"
}

output "web-sg-id" {
  value = aws_security_group.web-lc-sg.id
  description = "Bastion Security Group id"
}

output "bastion-public-ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "Bastion Public IP Address"
}

output "was-alb-dns" {
  value = aws_lb.was-alb.dns_name
  description = "WAS ALB DNS Name"
}

output "external-was-alb-dns" {
  value = aws_lb.external-was-alb.dns_name
  description = "EXTERNAL WEB ALB DNS Name"
}
