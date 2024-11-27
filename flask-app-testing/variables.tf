variable "vpc_cidr_block" {
  description = "Value of vpc CIDR"
}

variable "subnet_cidr_block" {
  description = "Value of subnet CIDR"
}

variable "availability_zone" {
  description = "Name of AZ in which you want to launch instance"
}

variable "ami_value" {
  description = "AMI value of ec2 instance"
}

variable "instance_type" {
  description = "instance type of ec2 instance, for example t2.micro"
}
