provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

resource "aws_instance" "tf-server" {
  ami                         = var.ami_value
  instance_type               = var.instance_type_value
  associate_public_ip_address = var.associate_public_ip_address_value
}