output "bastion-public-ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "Bastion Public IP Address"
}

output "web-alb-dns" {
  value = aws_lb.web-alb.dns_name
  description = "WAS ALB DNS Name"
}

output "external-was-alb-dns" {
  value = aws_lb.external-was-alb.dns_name
  description = "EXTERNAL WEB ALB DNS Name"
}
