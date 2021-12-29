variable "region" {
  default = "ap-southeast-2"
  description = "Amazon Region (Sydney)"
}
variable "resource_prefix" {
  default = "Terraform-3-tier-Demo"
  description = "resource name prefix"
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "vpc CIDR Range"
}

variable "subnet_cidr" {
  default = "10.0.1.0/20"
  description = "subnet CIDR Range"
}

variable "bastion_instance_type" {
  default = "t2.micro"
  description = "EC2 Bastion Instance Type"
}

variable "web_instance_type" {
  default = "t2.micro"
  description = "EC2 Web Server Instance Type"
}

variable "was_instance_type" {
  default = "t2.micro"
  description = "EC2 WAS Server Instance Type"
}

variable "bastion_key_pair_name" {
  default = "devos-demo-sydney-instance-key"
  description = "Bastion Instance Key Pair Name"
}

variable "instance_key_pair_name" {
  default = "devos-demo-sydney-target-instance-key"
  description = "Instance Key Pair Name"
}

variable "db_username" {
  default = "demouser"
  description = "RDS Access User Name"
}

variable "db_password" {
  default = "demopass"
  description = "RDS Access Password"
}

variable "web_ami" {
  default = "ami-054e417a0417638f3"
  description = "WEB EC2 Machine Image"
}

variable "was_ami" {
  default = "ami-01cab1e6f40e84581"
  description = "WAS EC2 Machine Image"
}
