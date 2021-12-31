output "bastion-public-ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "Bastion Public IP Address"
}

output "web-alb-dns" {
  value = aws_lb.web-alb.dns_name
  description = "WEB ALB DNS Name"
}

output "was-alb-dns" {
  value = aws_lb.was-alb.dns_name
  description = "WAS ALB DNS Name"
}


output "external-was-alb-dns" {
  value = aws_lb.external-was-alb.dns_name
  description = "EXTERNAL WAS ALB DNS Name"
}

output "rds-address" {
  value = aws_db_instance.tier-db-instance.address
  description = "RDS Address"
}
