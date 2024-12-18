variable "region" {
  description = "name of the geographical location at which you want to create resources, for example us-east-1"
}

variable "vpc_cidr_block" {
  description = "cidr value for vpc, for example 10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "cidr value for subnet1, for example 10.0.0.0/24"
}

variable "subnet2_cidr_block" {
  description = "cidr value for subnet2, for example 10.0.1.0/24"
}

variable "availabilty_zone1" {
  description = "name of the availability zone where the instance should run, for example ap-southeast-1"
}

variable "availabilty_zone2" {
  description = "name of the availability zone where the instance should run, for example ap-southeast-2"
}

variable "ami_id" {
  description = "value of ami id to be used, for example ami-047126e50991d067b"
}

variable "instance_type" {
  description = "value of the instance type, for example t2.micro"
}

variable "s3_bucket_name" {
  description = "name of the s3 bucket, needs to be unique across all accounts"
}

variable "lb_type" {
  description = "name the type of load balancer, for example application or network"
}