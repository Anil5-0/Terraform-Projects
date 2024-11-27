provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "app-vpc" {
    cidr_block = var.vpc_cidr_block
}
